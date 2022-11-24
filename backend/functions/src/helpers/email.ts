import Mailgun from 'mailgun.js'
import * as formData from 'form-data'

export const getMailer = (apiKey: string) => new Mailgun(formData).client({
    username: 'api',
    key: apiKey,
    url: 'https://api.eu.mailgun.net',
})

export const emailData = {
    domain: 'mail.ilurama.com',
    from: 'Ilurama noreply@mail.ilurama.com',
}
