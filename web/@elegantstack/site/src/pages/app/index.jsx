import React from 'react'
import { graphql } from 'gatsby'
import { Container } from 'theme-ui'
import Layout from '@solid-ui-layout/Layout'
import Seo from '@solid-ui-components/Seo'
import Divider from '@solid-ui-components/Divider'
import ModalWithTabs from '@solid-ui-blocks/Modal/Block01'
// import ModalSimple from '@solid-ui-blocks/Modal/Block02'
// import Header from '@solid-ui-blocks/Header/Block01'
import Tabs from '@solid-ui-components/Tabs'
import ContentImages from '@solid-ui-components/ContentImages'
import Hero from '@solid-ui-blocks/Hero/Block01'
// import Stats from '@solid-ui-blocks/Stats/Block01'
import Features from '@solid-ui-blocks/Features/Block06'
import HowItWorks from '@solid-ui-blocks/FeaturesWithPhoto/Block04'
// import FeatureTabOne from '@solid-ui-blocks/FeaturesWithPhoto/Block05'
import FeatureTabOneWithBG from '../../blocks/Tabs/TabBlock05WithBG'
// import FeatureTabTwo from '@solid-ui-blocks/FeaturesWithPhoto/Block01'
import FeatureTabTwoWithBG from '../../blocks/Tabs/TabBlock01WithBG'
import FeatureTabThreeWithBG from '../../blocks/Tabs/TabBlock07WithBG'
import FeatureTabThree from '@solid-ui-blocks/FeaturesWithPhoto/Block07'
import Screenshot from '@solid-ui-blocks/FeaturesWithPhoto/Block03'
import Testimonials from '@solid-ui-blocks/Testimonials/Block03'
// import Companies from '@solid-ui-blocks/Companies/Block01'
// import Faq from '@solid-ui-blocks/Faq/Block02'
// import Blog from '@solid-ui-blocks/Blog/Block01'
import Footer from '../../blocks/Footer/Footer'
import { normalizeBlockContentNodes } from '@blocks-helpers'
import theme from './_theme'
import styles from './_styles'
import { StaticImage } from 'gatsby-plugin-image'

const IndexPage = props => {
  const { allBlockContent } = props.data
  const content = normalizeBlockContentNodes(allBlockContent?.nodes)
  return (
    <Layout theme={theme} {...props}>
        <Seo title='App' />
        
        {/* Modals */}
        
        <ModalWithTabs content={content['contact']} />
        
        {/* Blocks */}
        
        <Container sx={styles.heroContainer}>
            <Divider space='5' />
            <Hero content={content['hero']} reverse />
            <Divider space='5' />
        </Container>
        
        <Container variant='wide' sx={styles.featuresContainer}>
            <Divider space={0} />
            {/* <Stats content={content['stats']} /> */}
            <Features content={content['features']} />
        </Container>
        
        <Divider space='5' />
        <HowItWorks content={content['how-it-works']} />
        <Divider space='5' />

        <Container varian='wide' sx={styles.slideshowContainer}>
            <Tabs space={3} variant='dots' position='bottom' autoplay >
                <Screenshot content={content['screenshot-one']} />
                <Screenshot content={content['screenshot-two']} />
                <Screenshot content={content['screenshot-three']} />
            </Tabs>
        </Container>
        <Divider space='5' />

        <Container variant='wide' sx={styles.tabsContainer}>
            <Tabs space={4} variant='pill'>
                <FeatureTabOneWithBG content={content['feature-tab-one']}  sx={styles.singleTabContainer}/>
                <FeatureTabTwoWithBG content={content['feature-tab-two']} reverse sx={styles.singleTabContainerReverse}/>
                <FeatureTabThreeWithBG content={content['feature-tab-three']} sx={styles.singleTabContainer}/>
            </Tabs>
        </Container>
        
        {/* <Faq content={content['faq']} /> */}
      
        <Container variant='wide' sx={styles.roadmapContainer}>
            <FeatureTabThree content={content['image-divider']} />
        </Container>
      
        <Container variant='wide' sx={styles.testimonialsContainer}>
            <Testimonials content={content['testimonials']} />
            {/* <Divider space='5' color='omegaLight' />
            <Companies content={content['companies']} /> */}
        </Container>
      
        <StaticImage src='../../assets/app/bg_lines_7_2.png' alt='colors filters' />    
        {/* <Container variant='wide' sx={styles.finalContainer}>
        <Divider space='10' />
        <p style={{color: 'transparent'}}>...</p>
        <Divider space='10' />
        </Container> */}

        {/* <Blog content={content['latest-blogs']} /> */}
        
        <Footer content={content['footer-landing']} />
    </Layout>
  )
}

export const query = graphql`
  query appLandingBlockContent {
    allBlockContent(filter: { page: { in: ["site/app/landing", "shared"] } }) {
      nodes {
        ...BlockContent
      }
    }
  }
`

export default IndexPage
