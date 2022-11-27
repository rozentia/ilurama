import React from 'react'
import { graphql, navigate } from 'gatsby'
import { Container } from 'theme-ui'
import ContentContainer from '@solid-ui-components/ContentContainer'
import ContentButtons from '@solid-ui-components/ContentButtons'
import Layout from '@solid-ui-layout/Layout'
import Seo from '@solid-ui-components/Seo'
import Divider from '@solid-ui-components/Divider'
import ModalWithTabs from '@solid-ui-blocks/Modal/Block01'
import Header from '../../../blocks/Headers/BasicHeader'
import Footer from '../../../blocks/Footer/Footer'
import { normalizeBlockContentNodes } from '@blocks-helpers'
import { useLocation } from '@reach/router';
import queryString from 'query-string';
import theme from '../../_theme'
import Axios from 'axios'

const IndexPage = props => {
  const { allBlockContent } = props.data
  const content = normalizeBlockContentNodes(allBlockContent?.nodes)

  const location = useLocation()
  const query = location.search
  const params = queryString.parse(query === undefined ? '' : query)
  const token = params.token

  console.log(`v0.2 - ${token}`)
  return (
    <Layout theme={theme} {...props}>
      <Seo title='Home' />
      <ModalWithTabs content={content['contact']} />
      <Header content={content['header-basic']} menuJustify='space-between' />
      <Divider space='4' />
      <Container variant='medium' sx={{ padding: '40px' }}>
        <ContentContainer variant='cards.paper-lg' sx={{ textAlign: 'center' }}>
          <h1>Confirm Account Deletion</h1>
          <p>Your have requested to forfait your acount and delete all related data. Such action is irreversible and this is the final confirmation to proceed.</p>
            <p>Please click the button below if you wish to finish the process.</p>
          <div
            role='button'
            tabIndex={0}
            onClick={event => {
              event.preventDefault()
              if (!token) {
                navigate(`failure`)
                return
              }
              Axios.post(
                `/api/fn/reqdelconfirm`,
                { token },
                { headers: { "Content-Type": "application/x-www-form-urlencoded" } },
              )
              .then(_ => navigate(`success`))
              .catch(_ => navigate(`failure`))
            }}
            onKeyDown={console.log('unimplemented')}
          >
          <Divider space={5} />
            <ContentButtons content={[{
              text: 'Yes proceed to delete',
              type: '',
              link: '',
              variant: 'gradient'
            }]} 
            />
            </div>
        </ContentContainer>
      </Container>
      <Footer content={content['footer']} />
    </Layout>
  )
}

export const query = graphql`
  query iluramaAPIBlockContent {
    allBlockContent(filter: { page: { in: ["site/home", "shared"] } }) {
      nodes {
        ...BlockContent
      }
    }
  }
`
export default IndexPage
