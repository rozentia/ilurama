const withDefaults = require('./utils/default.options')
const queryMobileMenu = require('./utils/queryMobileMenu')

module.exports = async ({ graphql, page, actions }, pluginOptions) => {
  const { createPage, deletePage } = actions
  const { pageContextOptions } = withDefaults(pluginOptions)

  //@ START - Overwrite for Firebase login pages
  // page.matchPath is a special key that's used for matching pages
  // only on the client.
  if (page.path.match(/^\/profile/)) {
    page.matchPath = `/profile/*`;
    // Update the page.
    createPage(page);
    return;
  }
  //@ END - 

  pageContextOptions.mobileMenu = await queryMobileMenu({ graphql })

  deletePage(page)

  // Pass services auto-created pages
  createPage({
    ...page,
    context: {
      ...page.context,
      ...pageContextOptions
    }
  })
}
