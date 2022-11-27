import * as functions from 'firebase-functions'
import { secrets } from './params'

const fn = functions.region('europe-west1')
export const fnApp = () => fn
    .runWith({
        enforceAppCheck: false,
        invoker: 'public',
        secrets: secrets,
    })
    .https

export const fnApi = () => fn
    .runWith({
        enforceAppCheck: true,
        invoker: 'public',
        secrets: secrets,
    })
    .https

export const { logger } = functions

export * as params from './params'
