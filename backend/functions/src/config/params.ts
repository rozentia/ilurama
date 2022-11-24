import { defineSecret } from 'firebase-functions/params'

export const mailgunApiKey = defineSecret('MAILGUN_API_KEY')
export const jwtKey = defineSecret('JWT_KEY')

export const secrets = [
    mailgunApiKey,
    jwtKey,
]
