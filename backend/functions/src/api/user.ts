import { fnApi } from '../config'
import { deleteUser } from '../helpers/user'

export const reqdelconfirm = fnApi()
    .onRequest(async (req, res) => {
        try {
            await deleteUser(req.body.token)
            res.status(200).send({ message: 'Account delete succesfully' })
        } catch (e) {
            res.status(500).send({ message: e, reqBody: req.body, reqParams: req.params })
        }
    })
