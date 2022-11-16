import bg_lines_1 from '../../assets/app/bg_lines_1.png'
import bg_lines_2 from '../../assets/app/bg_lines_2.png'
import bg_lines_3 from '../../assets/app/bg_lines_3.png'
import bg_lines_4 from '../../assets/app/bg_lines_4.png'
import bg_lines_5 from '../../assets/app/bg_lines_5.png'
import bg_lines_5_cut_sm from '../../assets/app/bg_lines_5_cut_sm.png'
import bg_lines_6_cut from '../../assets/app/bg_lines_6_cut.png'
import bg_lines_6_cut_sm from '../../assets/app/bg_lines_6_cut_sm.png'
import bg_lines_7_2 from '../../assets/app/bg_lines_7_2.png'
import bg_lines_8_cut from '../../assets/app/bg_lines_8_cut.png'
import bg_lines_8_cut_sm from '../../assets/app/bg_lines_8_cut_sm.png'

const media = {
  upTo640: '@media screen and (max-width: 640px)',
  upTo768: '@media screen and (min-width: 641px) and (max-width: 768px)',
  upTo1024: '@media screen and (min-width: 769px) and (max-width: 1023px)',
  upToInf: '@media screen and (min-width: 1024px)',
}

const styles = {
  finalContainer: {
    background: `url(${bg_lines_7_2}) no-repeat center top`,
    backgroundSize: '100% auto'
  },
  slideshowContainer: {
    background: `url(${bg_lines_3}) no-repeat center center`,
    backgroundSize: '100% auto'
  },
  heroContainer: {
    h1: {
      'text-shadow': '0px 0px 25px black'
    },
    h4: {
      'text-shadow': '0px 0px 15px black'
    },
    background: `url(${bg_lines_1}) no-repeat center top`,
    [media.upTo640]: {
      backgroundSize: `auto 100%`,
      backgroundPosition: '-500px 100px'
    },
    [media.upTo768]: {
      backgroundSize: `auto 100%`,
    },
    [media.upTo1024]: {
      backgroundSize: `auto 100%`,
    },
    [media.upToInf]: {
      backgroundSize: `100% 100%`,
    },
    
  },
  featuresContainer: {
    position: `relative`,
    py: [5, 6],
    '::before': {
      position: `absolute`,
      content: `" "`,
      size: `full`,
      top: -3,
      right: 0,
      zIndex: -1,
      borderRadius: `xl`,
      background: `url(${bg_lines_2}) no-repeat`,
      backgroundColor: 'white',
      [media.upTo640]: {
        backgroundPosition: `50% 300px`,
        backgroundSize: `300% 100%`,
      },
      [media.upTo768]: {
        backgroundPosition: `50% 290px`,
        backgroundSize: `200% 100%`,
      },
      [media.upTo1024]: {
        backgroundPosition: `50% 300px`,
        backgroundSize: `150% 100%`,
      },
      [media.upToInf]: {
        backgroundPosition: `50% 350px`,
        backgroundSize: `130% 100%`,
      },
    }
  },
  tabsContainer: {
    position: `relative`,
    py: [4, 5],
    '::before': {
      position: `absolute`,
      content: `" "`,
      size: `full`,
      top: 0,
      right: 0,
      zIndex: -1,
      borderRadius: `xl`,
      background: `linear-gradient(
        180deg,
        #e2e8f0 0%,
        #f4f4f8 100%
      )`
    }
  },

  singleTabContainer: {
    background: `url(${bg_lines_8_cut}) no-repeat center top`,
    [media.upTo640]: { 
      background: `url(${bg_lines_8_cut_sm}) no-repeat center top`,
      backgroundSize: `100% auto`,
    },
    [media.upTo768]: { 
      background: `url(${bg_lines_8_cut_sm}) no-repeat center top`,
      backgroundSize: `100% auto`,
    },
    [media.upTo1024]: { backgroundSize: `100% 100%` },
    [media.upToInf]: { backgroundSize: `100% 100%` }
  },
  
  singleTabContainerReverse: {
    background: `url(${bg_lines_6_cut}) no-repeat center bottom`,
    [media.upTo640]: {
      background: `url(${bg_lines_6_cut_sm}) no-repeat center bottom`,
      backgroundSize: `100% auto` },
    [media.upTo768]: {
      background: `url(${bg_lines_6_cut_sm}) no-repeat center bottom`,
      backgroundSize: `100% auto` },
    [media.upTo1024]: { backgroundSize: `100% 100%` },
    [media.upToInf]: { backgroundSize: `100% 100%` }
  },

  roadmapContainer: {
    h2: {
      'text-shadow': '0px 0px 25px black'
    },
    position: `relative`,
    py: [4, 5],
    background: `url(${bg_lines_5}) no-repeat`,
    backgroundSize: `auto 100%`,
    [media.upTo640]: {
      background: `url(${bg_lines_5_cut_sm}) no-repeat center top`,
      backgroundSize: `100% 50%`
    },
    [media.upTo768]: {
      background: `url(${bg_lines_5_cut_sm}) no-repeat center top`,
      backgroundSize: `100% 40%`
    },
    '::before': {
      position: `absolute`,
      content: `" "`,
      size: `full`,
      top: 0,
      right: 0,
      zIndex: -1,
      borderRadius: `xl`,
    

    }
  },
  testimonialsContainer: {
    position: `relative`,
    pt: 6,
    pb: 5,
    '::before': {
      position: `absolute`,
      content: `" "`,
      width: `full`,
      height: `full`,
      top: 0,
      right: 0,
      zIndex: -1,
      borderRadius: `xl`,
      background: `linear-gradient(
        180deg,
        #f7f9fe 0%,
        #f4f4f8 100%
      )`
    }
  }
}

export default styles;