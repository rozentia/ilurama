import React, { useContext } from 'react'
import { Box } from 'theme-ui'
import defaultContent from '@solid-ui-blocks/utils/default.content'
import pageContextProvider from '@helpers/pageContextProvider'

const WithDefaultContent =
  Block =>
  ({ content = {}, ...props }) => {
    const { pageContext } = useContext(pageContextProvider)
    const { isDevelopment } = pageContext

    const title = `Block: ${Block.name} | Page: ${content.page} | Identifier: ${content.identifier}`

    return (
      <Box title={isDevelopment ? title : undefined} id={content.identifier}>
        <Block content={{ ...defaultContent, ...content }} {...props} />
      </Box>
    )
  }

export default WithDefaultContent
