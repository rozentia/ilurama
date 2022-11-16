import React from 'react'
import { graphql } from 'gatsby'
import { Container } from 'theme-ui'
import Layout from '@solid-ui-layout/Layout'
import Seo from '@solid-ui-components/Seo'
import Divider from '@solid-ui-components/Divider'
import Header from '@solid-ui-blocks/Header/Block01'
import Footer from '@solid-ui-blocks/Footer/Block01'
import { normalizeBlockContentNodes } from '@blocks-helpers'
import styles from './_styles'

const Privacy = props => {
  const { allBlockContent } = props.data
  const content = normalizeBlockContentNodes(allBlockContent?.nodes)

  return (
    <Layout {...props}>
        <Seo title='Privacy Policy' />
        <Header content={content['header']} />
        <Divider space='5' />
        <Container p={20} sx={styles.contentTwoContainer}>
        <div style={{padding: '20px'}} >
        <div><strong><span style={{fontSize: '26px'}}><span data-custom-class="title">COOKIE
                POLICY</span></span></strong></div>
        <div><br /></div>
        <div><span style={{color: 'rgb(127, 127, 127)'}}><strong><span style={{fontSize: '15px'}}><span data-custom-class="subtitle">Last updated <bdt className="question">
                    November 06, 2022</bdt></span></span></strong></span>
        </div>
        <div style={{lineHeight: '1.5'}}><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(89, 89, 89)', fontSize: '15px'}}><span data-custom-class="body_text">This Cookie Policy explains how <bdt className="question">Misfitcoders ÖU</bdt>
                <bdt className="block-component" /> ("<bdt className="block-component">
                </bdt><strong>Company</strong>
                <bdt className="statement-end-if-in-editor" />", "<strong>we</strong>",
                "<strong>us</strong>", and "<strong>our</strong>") uses cookies and
                similar technologies to recognize you when you visit our websites at<bdt className="forloop-component" />
                <bdt className="question"><a href="https://ilurama.com" target="_blank" data-custom-class="link">https://ilurama.com</a></bdt>,
                <bdt className="forloop-component" /> ("<strong>Websites</strong>"). It
                explains what these technologies are and why we use them, as well as
                your rights to control our use of them.<bdt className="block-component">
                </bdt>
              </span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(89, 89, 89)', fontSize: '15px'}}><span data-custom-class="body_text">In some cases we may use cookies to
                collect personal information, or that becomes personal information if we
                combine it with other information. <bdt className="block-component" />
              </span>
              <bdt className="statement-end-if-in-editor"><span data-custom-class="body_text" /></bdt>
            </span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(0, 0, 0)', fontSize: '15px'}}><strong><span data-custom-class="heading_1">What are
                  cookies?</span></strong></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(89, 89, 89)', fontSize: '15px'}}><span data-custom-class="body_text">Cookies are small data files that are
                placed on your computer or mobile device when you visit a website.
                Cookies are widely used by website owners in order to make their
                websites work, or to work more efficiently, as well as to provide
                reporting information.</span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(89, 89, 89)', fontSize: '15px'}}><span data-custom-class="body_text">Cookies set by the website owner (in this
                case, <bdt className="question">Misfitcoders ÖU</bdt>) are called "first
                party cookies". Cookies set by parties other than the website owner are
                called "third party cookies". Third party cookies enable third party
                features or functionality to be provided on or through the website (e.g.
                like advertising, interactive content and analytics). The parties that
                set these third party cookies can recognize your computer both when it
                visits the website in question and also when it visits certain other
                websites.</span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(0, 0, 0)', fontSize: '15px'}}><strong><span data-custom-class="heading_1">Why do we use
                  cookies?</span></strong></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(89, 89, 89)', fontSize: '15px'}}><span data-custom-class="body_text">We use first<bdt className="block-component">
                </bdt> and third<bdt className="statement-end-if-in-editor" /> party
                cookies for several reasons. Some cookies are required for technical
                reasons in order for our Websites to operate, and we refer to these as
                "essential" or "strictly necessary" cookies. Other cookies also enable
                us to track and target the interests of our users to enhance the
                experience on our Online Properties. <bdt className="block-component" />
                Third parties serve cookies through our Websites for advertising,
                analytics and other purposes. <bdt className="statement-end-if-in-editor">
                </bdt>This is described in more detail below.</span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(89, 89, 89)', fontSize: '15px'}}><span data-custom-class="body_text">The specific types of first<bdt className="block-component" /> and third<bdt className="statement-end-if-in-editor" /> party cookies served
                through our Websites and the purposes they perform are described below
                (please note that the specific cookies served may vary depending on the
                specific Online Properties you visit):</span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(89, 89, 89)', fontSize: '15px'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span id="control" style={{color: 'rgb(0, 0, 0)'}}><strong><span data-custom-class="heading_1">How can I
                        control
                        cookies?</span></strong></span></span></span></span></span>
        </div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">You have the right to decide whether to
                accept or reject cookies. You can exercise your cookie rights by setting
                your preferences in the Cookie Consent Manager. The Cookie Consent
                Manager allows you to select which categories of cookies you accept or
                reject. Essential cookies cannot be rejected as they are strictly
                necessary to provide you with services.</span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">The Cookie Consent Manager can be found in
                the notification banner and on our website. If you choose to reject
                cookies, you may still use our website though your access to some
                functionality and areas of our website may be restricted. You may also
                set or amend your web browser controls to accept or refuse cookies. As
                the means by which you can refuse cookies through your web browser
                controls vary from browser-to-browser, you should visit your browser's
                help menu for more information.</span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">In addition, most advertising networks
                offer you a way to opt out of targeted advertising. If you would like to
                find out more information, please visit&nbsp;</span></span><span style={{fontSize: '15px', color: 'rgb(48, 48, 241)'}}><span data-custom-class="body_text"><a data-custom-class="link" href="http://www.aboutads.info/choices/" target="_blank">http://www.aboutads.info/choices/</a></span></span><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">&nbsp;or&nbsp;</span></span><span style={{fontSize: '15px', color: 'rgb(48, 48, 241)'}}><span data-custom-class="body_text"><a data-custom-class="link" data-fr-linked="true" href="http://www.youronlinechoices.com" target="_blank">http://www.youronlinechoices.com</a></span></span><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">.</span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">The specific types of first and third
                party cookies served through our Websites and the purposes they perform
                are described in the table below (please note that the
                specific&nbsp;</span><span data-custom-class="body_text">cookies served
                may vary depending on the specific Online Properties you
                visit):</span></span></span><span style={{fontSize: '15px'}} /></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(0, 0, 0)', fontSize: '15px'}}><strong><span data-custom-class="heading_1">What about other tracking
                  technologies, like web beacons?</span></strong></span></span>
        </div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(89, 89, 89)', fontSize: '15px'}}><span data-custom-class="body_text">Cookies are not the only
                way&nbsp;</span><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">to recognize or track visitors to
                  a website. We may use other, similar technologies from time to
                  time, like web beacons (sometimes called "tracking pixels" or
                  "clear gifs"). These are tiny graphics files that contain a
                  unique identifier that enable us to recognize when someone has
                  visited our Websites<bdt className="block-component" /> or
                  opened an e-mail including them<bdt className="statement-end-if-in-editor" />. This allows
                  us, for example, to monitor&nbsp;</span><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">the traffic
                      patterns of users from one page within a website
                      to another, to deliver or communicate with
                      cookies, to understand whether you have come to
                      the website from an online advertisement
                      displayed on a third-party website, to improve
                      site performance, and to measure the success of
                      e-mail marketing campaigns. In many instances,
                      these technologies are reliant on cookies to
                      function properly, and so declining cookies will
                      impair their functioning.</span>
                    <bdt className="block-component" />
                  </span></span></span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(89, 89, 89)', fontSize: '15px'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{color: 'rgb(0, 0, 0)'}}><strong><span data-custom-class="heading_1">Do you use
                        Flash cookies or Local Shared
                        Objects?</span></strong></span></span></span></span></span>
        </div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">Websites may also use so-called "Flash Cookies"
              (also known as Local Shared Objects or "LSOs") to, among other things, collect
              and store information about your use of our services, fraud prevention and for
              other site operations.</span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">If you do not want Flash Cookies stored on your
              computer, you can adjust the settings of your Flash player to block Flash
              Cookies storage using the tools contained in the&nbsp;</span></span><span data-custom-class="body_text"><span style={{color: 'rgb(48, 48, 241)'}}><a data-custom-class="link" href="http://www.macromedia.com/support/documentation/en/flashplayer/help/settings_manager07.html" target="_BLANK"><span style={{fontSize: '15px'}}>Website Storage Settings
                  Panel</span></a></span><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}>. You can also control Flash
              Cookies by going to the&nbsp;</span><span style={{color: 'rgb(48, 48, 241)'}}><a data-custom-class="link" href="http://www.macromedia.com/support/documentation/en/flashplayer/help/settings_manager03.html" target="_BLANK"><span style={{fontSize: '15px'}}>Global Storage Settings
                  Panel</span></a></span></span><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">&nbsp;and&nbsp;</span><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">following the instructions (which may
                include instructions that explain, for example, how to delete existing
                Flash Cookies (referred to "information" on the Macromedia site), how to
                prevent Flash LSOs from being placed on your computer without your being
                asked, and (for Flash Player 8 and later) how to block Flash Cookies
                that are not being delivered by the operator of the page you are on at
                the time).</span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">Please note that setting the Flash Player
                to restrict or limit acceptance of Flash Cookies may reduce or impede
                the functionality of some Flash applications, including, potentially,
                Flash applications used in connection with our services or online
                content.</span></span></span><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(89, 89, 89)', fontSize: '15px'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{color: 'rgb(89, 89, 89)'}}>
                    <bdt className="statement-end-if-in-editor" />
                    <bdt className="block-component" />
                  </span></span></span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(89, 89, 89)', fontSize: '15px'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(0, 0, 0)'}}><strong><span data-custom-class="heading_1">Do
                            you serve targeted
                            advertising?</span></strong></span></span></span></span></span></span></span>
        </div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">Third parties may serve cookies on your computer
              or mobile device to serve advertising through our Websites. These companies may
              use information about your visits to this and other websites in order to provide
              relevant advertisements about goods and services that you may be interested in.
              They may also employ technology that is used to measure the effectiveness of
              advertisements. This can be accomplished by them using cookies or web beacons to
              collect information about your visits to this and other sites in order to
              provide relevant advertisements about goods and services of potential interest
              to you. The information collected through this process does not enable us or
              them to identify your name, contact details or other details that directly
              identify you unless you choose to provide these.</span></span><span style={{color: 'rgb(127, 127, 127)'}}><span style={{color: 'rgb(89, 89, 89)', fontSize: '15px'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{color: 'rgb(89, 89, 89)'}}>
                    <bdt className="statement-end-if-in-editor" />
                  </span></span></span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(0, 0, 0)'}}><strong><span data-custom-class="heading_1">How often will you update this
                  Cookie Policy?</span></strong></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">We may update&nbsp;</span><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">this Cookie Policy from time to
                  time in order to reflect, for example, changes to the cookies we
                  use or for other operational, legal or regulatory reasons.
                  Please therefore re-visit this Cookie Policy regularly to stay
                  informed about our use of cookies and related
                  technologies.</span></span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">The date at the top of this Cookie
                  Policy indicates when it was last
                  updated.</span></span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(0, 0, 0)'}}><strong><span data-custom-class="heading_1">Where can I get further
                    information?</span></strong></span></span></span></div>
        <div style={{lineHeight: '1.5'}}><br /></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">If you have any questions about
                  our use of cookies or other technologies, please email us at
                  <bdt className="question">support@misfitcoders.com</bdt> or by post
                  to:</span></span></span></span></div>
        <div style={{lineHeight: '1.5'}}><span data-custom-class="body_text"><br /></span></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}><span data-custom-class="body_text">
                <bdt className="question">Misfitcoders ÖU</bdt>
              </span></span></span></div>
        <div style={{lineHeight: '1.5'}}><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}>
            <bdt className="question"><span data-custom-class="body_text">Calle Eduardo Rivas 14
                3E</span></bdt><span data-custom-class="body_text">
              <bdt className="block-component" />
            </span>
          </span></div>
        <div style={{lineHeight: '1.5'}}><span data-custom-class="body_text"><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}>
              <bdt className="question">Madrid</bdt>
              <bdt className="block-component" />, <bdt className="question">Madrid</bdt>
              <bdt className="statement-end-if-in-editor" />
              <bdt className="block-component" />
              <bdt className="question">28019</bdt>
              <bdt className="statement-end-if-in-editor" />
              <bdt className="block-component" />
              <bdt className="block-component" />
            </span></span></div>
        <div style={{lineHeight: '1.5'}}><span data-custom-class="body_text"><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}>
              <bdt className="question">Spain</bdt>
              <bdt className="statement-end-if-in-editor" />
            </span></span><span data-custom-class="body_text"><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}>
              <bdt className="statement-end-if-in-editor" />
            </span></span></div>
        <div style={{lineHeight: '1.5'}}><span data-custom-class="body_text"><span style={{fontSize: '15px', color: 'rgb(89, 89, 89)'}}>Phone: <bdt className="question">
                +34 609971307</bdt>
              <bdt className="block-component" />
            </span></span></div>
        </div>  
        </Container>
        <Divider space='5' />
        <Footer content={content['footer']} />
    </Layout>
  )
}

export const query = graphql`
  query cookiesBlockContent {
    allBlockContent(
      filter: { page: { in: ["site/legal", "shared"] } }
    ) {
      nodes {
        ...BlockContent
      }
    }
  }
`

export default Privacy
