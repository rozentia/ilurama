/* eslint-disable require-jsdoc */
import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'

export async function verifyToken(request: functions.Request): Promise<boolean> {
    try {
        const token: string | undefined = await getToken(request)

        if (!token) return false

        const payload: admin.auth.DecodedIdToken = await admin.auth().verifyIdToken(token)
        return payload !== null
    } catch (err) {
        return false
    }
}

export async function getCurrentUser(request: functions.Request): Promise<admin.auth.DecodedIdToken | null> {
    const token: string | undefined = await getToken(request)
    if (!token) return null
    const payload: admin.auth.DecodedIdToken = await admin.auth().verifyIdToken(token)
    return payload
}

async function getToken(request: functions.Request): Promise<string | undefined> {
    if (!request.headers.authorization) return undefined
    const token: string = request.headers.authorization.replace(/^Bearer\s/, '')
    return token
}
