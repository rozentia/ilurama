/* eslint-disable quote-props */
import { fnApp, params } from '../config'
import { getUserEmail, getUserFullName } from '../helpers/user'
import { getMailer, emailData } from '../helpers/email'

export const reqdel = fnApp()
    .onCall( async (data) => {
        /*
        if (!context.auth) {
            return { status: 'error', code: 401, message: `Not signed in... ${context.rawRequest}` }
        }
        const emailTo = context.auth.token.email
        if (!emailTo) {
            return {
                status: 'error',
                code: 401,
                message: `Invalid email...\n\nCONTEXT.AUTH:${JSON.stringify(context.auth)}`,
            }
        }
        */
        try {
            const emailTo = await getUserEmail(data)
            const displayName = await getUserFullName(data)
            const mailer = getMailer(params.mailgunApiKey.value())
            const result = await mailer.messages.create(emailData.domain, {
                from: emailData.from,
                to: emailTo,
                subject: 'Account Deletion Request',
                template: 'ilurama-base',
                'h:X-Mailgun-Variables': JSON.stringify({
                    msg_greeting: `Hi ${displayName}`,
                    // eslint-disable-next-line max-len
                    msg_content: 'You have requested the complete deletion of your Ilurama account, please bear in mind this action is irreversible and all of your data will be lost.\nTo proceed to the deletion confirmation page please click the button below.',
                    msg_farewell: 'Thank you',
                    msg_farewell_source: 'The Ilurama Team',
                    msg_action: 'Proceed to Confirmation Page',
                    link_action: `https://ilurama.com/api/confirm-deletion?token=${data}`,
                }),
                text: `The function was called with data:\n ${data}`,
            })
            return { status: 'success', code: 200, message: JSON.stringify(result) }
        } catch (e) {
            return { status: 'error', code: 500, message: `${e}` }
        }
    })
