import React from 'react'
import { Global } from '@emotion/core'
import { ThemeProvider, merge, Flex, Box, css } from 'theme-ui'
import baseTheme from '@solid-ui-theme'
import pageContextProvider from '@helpers/pageContextProvider'
import { FormContextProvider } from '@solid-ui-components/ContentForm'
import { ModalContextProvider } from '@solid-ui-components/Modal'
import { TabsContextProvider } from '@solid-ui-components/Tabs'
import ColorMode from '@solid-ui-components/ColorMode'
import CookieConsent from 'react-cookie-consent';

const Layout = ({ children, pageContext = {}, location, theme = {} }) => {
  return (
    <ThemeProvider theme={merge(baseTheme, theme)}>
      <CookieConsent
          location="bottom"
          buttonText="Accept"
          declineButtonText="Decline"
          cookieName="gatsby-gdpr-google-analytics"
      >
        This website stores cookies on your computer. These cookies are used to collect information about how you interact with this website and allow us to remember you.
        We use this information in order to improve and customize your browsing experience and for analytics and metrics about our visitors on this website.
        If you decline, your information won’t be tracked when you visit this website. A single cookie will be used in your browser to remember your preference not to be tracked.
      </CookieConsent>
      <pageContextProvider.Provider value={{ pageContext, location }}>
        <FormContextProvider>
          <ModalContextProvider>
            <TabsContextProvider>
              <Flex variant='layout.layout'>
                <Global styles={css(theme => theme.global)} />
                <ColorMode />
                <Box variant='layout.body'>{children}</Box>
              </Flex>
            </TabsContextProvider>
          </ModalContextProvider>
        </FormContextProvider>
      </pageContextProvider.Provider>
    </ThemeProvider>
  )
}

export default Layout
