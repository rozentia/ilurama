import adminApp from './admin'

const auth = adminApp.auth()

export const getUserEmail = async (uid: string): Promise<string> => {
    const { email } = await auth.getUser(uid)
    if (!email) throw new Error('Email not found or invalid user')
    return email
}

export const getUserFullName = async (uid: string): Promise<string> => {
    const { displayName } = await auth.getUser(uid)
    if (!displayName) throw new Error('displayName not found or invalid user')
    return displayName
}

export const deleteUser = async (uid: string): Promise<void> => {
    await Promise.allSettled([
        auth.revokeRefreshTokens(uid),
        auth.deleteUser(uid),
    ])
}
