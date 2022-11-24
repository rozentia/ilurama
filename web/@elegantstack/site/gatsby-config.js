require('dotenv').config({ path: `.env.${process.env.NODE_ENV}` })
const fontFile = require('./src/@elegantstack/solid-ui-theme/typography-fonts.json')

module.exports = {
  flags: {
    DEV_SSR: false
  },
  plugins: [
    `gatsby-plugin-image`,
    `gatsby-transformer-sharp`,
    `gatsby-plugin-sharp`,
    `gatsby-plugin-use-query-params`,
    // {
    //   resolve: 'gatsby-plugin-web-font-loader',
    //   options: {
    //     google: {
    //       families: ['Droid Sans', 'Droid Serif']
    //     }
    //   }
    // },
    {
      resolve: '@elegantstack/gatsby-theme-flexiblocks',
      options: {
        createDemoPages: false,
        colorMode: false,
        fonts: fontFile.fonts,
      },
    },
    {
      resolve: '@elegantstack/gatsby-theme-flexiblog-news',
      options: {
        // Add theme options here. Check documentation for available options.
        siteUrl: 'https://ilurama.com', // process.env.URL || process.env.VERCEL_URL
        basePath: '/content',
      }
    },
    {
      resolve: `gatsby-plugin-gdpr-cookies`,
      options: {
        googleAnalytics: {
          trackingId: process.env.GATSBY_FIREBASE_MEASUREMENT_ID,
          cookieName: "gatsby-gdpr-google-analytics",
          anonymize: true, // https://github.com/andrezimpel/gatsby-plugin-gdpr-cookies#anonymize
          allowAdFeatures: false,
        },
      },
    },
    {
      resolve: 'gatsby-plugin-google-tagmanager',
      options: {
        id: process.env.GATSBY_FIREBASE_MEASUREMENT_ID,
        includeInDevelopment: false,
  
        // datalayer to be set before GTM is loaded
        // should be an object or a function that is executed in the browser
        //
        // Defaults to null
        defaultDataLayer: { platform: 'gatsby' },
  
        // Specify optional GTM environment details.
        // gtmAuth: 'YOUR_GOOGLE_TAGMANAGER_ENVIRONMENT_AUTH_STRING',
        // gtmPreview: 'YOUR_GOOGLE_TAGMANAGER_ENVIRONMENT_PREVIEW_NAME',
        // dataLayerName: 'YOUR_DATA_LAYER_NAME',
  
        // Name of the event that is triggered
        // on every Gatsby route change.
        //
        // Defaults to gatsby-route-change
        // routeChangeEventName: 'YOUR_ROUTE_CHANGE_EVENT_NAME',
        // Defaults to false
        enableWebVitalsTracking: true,
        // Defaults to https://www.googletagmanager.com
        // selfHostedOrigin: 'YOUR_SELF_HOSTED_ORIGIN',
      },
    },
  ],
  // Customize your site metadata:
  siteMetadata: {
    siteUrl: `https://ilurama.com`,
    //General Site Metadata
    title: 'ilurama',
    name: 'ilurama',
    description: 'lighting blog',
    address: 'Madrid, Spain',
    email: 'info@ilurama.com',
    phone: '+34 (609) 971 307',

    //Site Social Media Links
    social: [
      {
        name: 'Github',
        url: 'https://github.com/gatsbyjs'
      },
      {
        name: 'Twitter',
        url: 'https://twitter.com/gatsbyjs'
      },
      {
        name: 'Instagram',
        url: 'https://github.com/gatsbyjs'
      }
    ],

    //Header Menu Items
    headerMenu: [
      {
        name: 'Home',
        slug: '/'
      },
      {
        name: 'Our Team',
        slug: '/authors'
      },
      {
        name: 'Contact',
        slug: '/contact'
      }
    ],

    //Footer Menu Items (2 Sets)
    footerMenu: [
      {
        title: 'Quick Links',
        items: [
          {
            name: 'Advertise with us',
            slug: '/contact'
          },
          {
            name: 'About Us',
            slug: '/about'
          },
          {
            name: 'Contact Us',
            slug: '/contact'
          }
        ]
      },
      {
        title: 'Legal Stuff',
        items: [
          {
            name: 'Privacy Notice',
            slug: '/'
          },
          {
            name: 'Cookie Policy',
            slug: '/'
          },
          {
            name: 'Terms Of Use',
            slug: '/'
          }
        ]
      }
    ]
  }
}
