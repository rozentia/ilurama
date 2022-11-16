// Importing default theme color object to mutate it
import defaultColors from '@elegantstack/solid-ui-theme/src/colors'
// Using tailwind preset colors
import colors from '@elegantstack/solid-ui-theme/src/color-preset'

defaultColors.headerActiveBg = '#1A1A1F'
defaultColors.headerActiveColor = colors.blueGray[600]

const colorOverride = {
  ...defaultColors,
  // Alpha (primary)
  alphaLighter: colors.orange[100],
  alphaLight: colors.orange[300],
  alpha: colors.orange[500],
  alphaDark: colors.orange[600],
  alphaDarker: colors.orange[800],
  // beta (secondary)
  betaLighter: colors.rose[100],
  betaLight: colors.rose[300],
  beta: colors.rose[500],
  betaDark: colors.rose[600],
  betaDarker: colors.rose[800]
}

export default colorOverride;