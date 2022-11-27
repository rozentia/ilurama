import { fnApi, logger } from '../config'

export const onpostpublished = fnApi().onRequest((req, res) => {
    const tick = Date.now()
    logger.log(`HEADERS ${tick}`, req.headers)
    logger.log(`BODY ${tick}`, req.body)
    logger.log(`PARAMS ${tick}`, req.params)
    res.send('ok')
})
