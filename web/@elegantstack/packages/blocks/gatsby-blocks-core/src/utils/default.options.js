const getValue = require('get-value')

module.exports = pluginOptions => {
  const localPaths = [
    {
      name: 'block',
      path: getValue(pluginOptions, 'localPaths.block', 'content/blocks')
    }
  ]

  const staticPaths = [
    {
      name: 'asset',
      path: getValue(pluginOptions, 'localPaths.asset', 'content/assets')
    }
  ]

  const createDemoPages = getValue(pluginOptions, 'createDemoPages', true)
  const colorMode = getValue(pluginOptions, 'colorMode', true)

  const isDevelopment = process?.env?.NODE_ENV === 'development'

  const pageContextOptions = {
    createDemoPages,
    colorMode,
    isDevelopment
  }

  return {
    localPaths,
    staticPaths,
    pageContextOptions
  }
}
