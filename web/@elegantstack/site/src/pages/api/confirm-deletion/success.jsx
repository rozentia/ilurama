import React from 'react'
import { graphql } from 'gatsby'
import { Container } from 'theme-ui'
import Layout from '@solid-ui-layout/Layout'
import Seo from '@solid-ui-components/Seo'
import Divider from '@solid-ui-components/Divider'
import ContentContainer from '@solid-ui-components/ContentContainer'
import ModalWithTabs from '@solid-ui-blocks/Modal/Block01'
import Header from '@solid-ui-blocks/Header/Block01'
import Footer from '../../../blocks/Footer/Footer'
import { normalizeBlockContentNodes } from '@blocks-helpers'
import { useLocation } from '@reach/router';
import queryString from 'query-string';
import theme from '../../_theme'

const IndexPage = props => {
  const { allBlockContent } = props.data
  const content = normalizeBlockContentNodes(allBlockContent?.nodes)

  const location = useLocation()
  const query = location.search
  const params = queryString.parse(query == undefined ? '' : query)
  const token = params.token

  return (
    <Layout theme={theme} {...props}>
      <Seo title='Home' />
      <ModalWithTabs content={content['contact']} />
      <Header content={content['header-basic']} menuJustify='space-between' />
      <Divider space='5' />
      <Container variant='medium' sx={{ padding: '40px' }}>
      <ContentContainer variant='cards.paper-lg' sx={{ textAlign: 'center' }}>
          <h2>Account Deleted Successfuly</h2>
        </ContentContainer>    
      </Container>
      <Divider space='5' />
      <Footer content={content['footer']} />
    </Layout>
  )
}

export const query = graphql`
  query iluramaAPISuccessBlockContent {
    allBlockContent(filter: { page: { in: ["site/home", "shared"] } }) {
      nodes {
        ...BlockContent
      }
    }
  }
`
export default IndexPage
