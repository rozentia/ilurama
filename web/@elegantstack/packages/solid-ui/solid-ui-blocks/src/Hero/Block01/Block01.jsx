import React from 'react'
import { Container, Flex, Box, css } from 'theme-ui'
import ContentText from '@solid-ui-components/ContentText'
import Reveal from '@solid-ui-components/Reveal'
import Divider from '@solid-ui-components/Divider'
import ContentImages from '@solid-ui-components/ContentImages'
import QuickSignupForm from '@solid-ui-components/QuickSignupForm'
import ContentButtons from '@solid-ui-components/ContentButtons'
import WithDefaultContent from '@solid-ui-blocks/WithDefaultContent'

const HeroBlock01 = ({
  content: { text = [], images, buttons, form },
  reverse
}) => (
  <Container>
    <Flex
      sx={{
        alignItems: [null, null, null, `center`],
        flexDirection: [
          reverse ? `column-reverse` : `column`,
          null,
          null,
          reverse ? `row-reverse` : `row`
        ]
      }}
    >
      <Box
        sx={{
          flexBasis: [null, null, null, `3/5`],
          [reverse ? 'ml' : 'mr']: [null, null, null, 5],
          position: `relative`,
          textAlign: `center`
        }}
      >
        <ContentImages
          content={{ images }}
          loading='eager'
          reverse={reverse}
          imagePosition='center'
        />
      </Box>
      <Box
        sx={{
          flexBasis: `2/5`,
          textAlign: [`center`, null, null, `left`]
        }}
      >
        <Reveal effect='fadeInDown'>
          <ContentText content={text} />
        </Reveal>
        {buttons && (
          <Reveal
            effect='fadeInRight'
            delay={1}
            css={css({ mb: [4, null, null, 0] })}
          >
            {buttons && (
              <>
                <Divider space={3} />
                <ContentButtons content={buttons} />
              </>
            )}
          </Reveal>
        )}
        {form && (
          <Reveal
            effect='fadeInRight'
            delay={1}
            css={css({ mb: [4, null, null, 0] })}
          >
            <QuickSignupForm {...form} space={3} />
          </Reveal>
        )}
      </Box>
    </Flex>
  </Container>
)

export default WithDefaultContent(HeroBlock01)
