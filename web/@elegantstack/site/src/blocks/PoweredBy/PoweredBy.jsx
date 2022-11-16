import React from 'react'
import { Link } from 'theme-ui'
import SVG from 'react-inlinesvg'
import MisfitcodersSVG from '../../assets/shared/misfitcoders-logo.svg'

const styles = {
  link: {
    display: `inline-flex`,
    color: `omegaDark`,
    fontWeight: `medium`,
    textDecoration: `none`,
    ':visited': {
      color: `heading`
    },
    ':hover': {
      color: `#EC008C`
    },
    svg: {
      height: 32,
      ml: 2
    }
  }
}

const PoweredByMisfitcoders = () => (
  <Link
    target='_blank'
    title='Misfitcoders'
    href='https://www.misfitcoders.com'
    rel='noopener'
    sx={styles.link}
  >
    Powered By Misfitcoders
    {MisfitcodersSVG && <SVG src={MisfitcodersSVG} />}
  </Link>
)

export default PoweredByMisfitcoders
