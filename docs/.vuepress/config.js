module.exports = {
  locales: {
    '/': {
      lang: 'en-US',
      title: 'Notes',
      description: 'Anthology of Snippets',
    },
  },
  head: [
    [
      'meta',
      {
        name: 'viewport',
        content: 'width=device-width, initial-scale=1, shrink-to-fit=no',
      },
    ],
    ['link', { rel: 'icon', href: '/logo.png' }],
    [
      'link',
      {
        rel: 'icon',
        type: 'image/png',
        sizes: '32x32',
        href: '/icons/favicon-32x32.png',
      },
    ],
    [
      'link',
      {
        rel: 'icon',
        type: 'image/png',
        sizes: '16x16',
        href: '/icons/favicon-16x16.png',
      },
    ],
    [
      'link',
      {
        rel: 'apple-touch-icon',
        sizes: '180x180',
        href: '/icons/apple-touch-icon.png',
      },
    ],
    [
      'link',
      {
        rel: 'apple-touch-icon-precomposed',
        sizes: '180x180',
        href: '/icons/apple-touch-icon-180x180-precomposed.png',
      },
    ],
    [
      'link',
      {
        rel: 'mask-icon',
        color: '#00a300',
        href: '/icons/safari-pinned-tab.svg',
      },
    ],
    ['link', { rel: 'manifest', href: '/manifest.json' }],
    ['meta', { name: 'apple-mobile-web-app-capable', content: 'yes' }],
    [
      'meta',
      { name: 'apple-mobile-web-app-status-bar-style', content: 'black' },
    ],
    ['meta', { name: 'application-name', content: 'Notes' }],
    ['meta', { name: 'msapplication-TileColor', content: '#2bae66' }],
    ['meta', { name: 'theme-color', content: '#3eaf7c' }],
    ['meta', { name: 'msapplication-config', content: '/browserconfig.xml' }],
  ],
  plugins: [
    ['@vuepress/back-to-top', true],
    [
      '@vuepress/pwa',
      {
        serviceWorker: true,
        updatePopup: true,
      },
    ],
    ['@vuepress/medium-zoom', true],
    ['vuepress-plugin-code-copy', true],
  ],
  // evergreen: true,
  themeConfig: {
    logo: '/logo.png',
    nav: [
      {
        text: 'Home',
        link: '/',
      },
      {
        text: 'About',
        link: '/about/',
      },
    ],
    sidebar: 'auto',
    searchPlaceholder: 'Search...',
    smoothScroll: true,
  },
};
