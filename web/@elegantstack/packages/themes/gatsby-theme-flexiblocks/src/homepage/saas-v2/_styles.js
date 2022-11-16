/**
 *
 * These styles are solely for adding [background images] or
 * [background colors] to blocks.
 *
 */

import circle from './assets/circle.png'

export default {
  heroContainer: {
    position: `relative`,
    pt: 5,
    '::before': {
      content: `" "`,
      width: `110%`,
      height: `1000px`,
      position: `absolute`,
      top: `-200px`,
      right: [0, null, null, `35%`],
      transform: [`none`, null, null, `skew(-23deg, 0deg) rotate(-10deg)`],
      zIndex: -1,
      borderRadius: `xl`,
      background: t => `radial-gradient(
          circle,
          ${t.colors.beta} 0%,
          ${t.colors.alpha} 100%
        )`,
      backgroundSize: `100%`,
      backgroundPosition: `650px bottom`
    },
    '::after': {
      content: `" "`,
      position: `absolute`,
      top: `50%`,
      left: `50%`,
      transform: `translate(-50%, -45%)`,
      zIndex: -1,
      size: 'full',
      maxWidth: 600,
      maxHeight: 600,
      background: `url(${circle}) no-repeat center center`,
      backgroundSize: `contain`,
      opacity: 0.1
    }
  },
  featuresContainer: {
    position: `relative`,
    overflow: [`hidden`, `unset`],
    '::before': {
      content: `" "`,
      width: `100%`,
      height: [`80%`, null, `140%`],
      position: `absolute`,
      top: [`5%`, null, `-5%`],
      left: `60%`,
      zIndex: -1,
      borderRadius: `xl`,
      transform: `skew(23deg, 0deg) rotate(-10deg)`,
      background: t => `radial-gradient(
          circle,
          ${t.colors.beta} 0%,
          ${t.colors.alpha} 100%
        )`,
      backgroundSize: `100%`,
      backgroundPosition: `650px bottom`
    },
    '::after': {
      display: [`none`, `block`],
      content: `" "`,
      position: `absolute`,
      top: `-30%`,
      left: `100%`,
      transform: `translate(-50%, 0)`,
      zIndex: -1,
      size: '600px',
      background: `url(${circle}) no-repeat center center`,
      backgroundSize: `cover`,
      filter: `brightness(60%) sepia(100) saturate(100) hue-rotate(25deg)`,
      opacity: 0.1
    }
  },
  socialProofContainer: {
    position: `relative`,
    '::before': {
      content: `" "`,
      width: `100%`,
      height: `100%`,
      position: `absolute`,
      top: 0,
      left: 0,
      zIndex: -2,
      bg: `#F6F7FA`
    }
  }
}
