import { pwaPlugin } from '@vuepress/plugin-pwa';
import { registerComponentsPlugin } from '@vuepress/plugin-register-components';
import { searchPlugin } from '@vuepress/plugin-search';
import { defaultTheme } from '@vuepress/theme-default';
import { getDirname, path } from '@vuepress/utils';
import { defineUserConfig } from 'vuepress';

const __dirname = getDirname(import.meta.url);

export default defineUserConfig({
  lang: 'en-US',
  title: 'Notes',
  description: 'Anthology of Snippets',
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
    registerComponentsPlugin({
      componentsDir: path.resolve(__dirname, './components'),
    }),
    searchPlugin({
      locales: {
        '/': {
          placeholder: 'Search...',
        },
      },
    }),
    pwaPlugin(),
  ],
  theme: defaultTheme({
    logo: '/logo.png',
    navbar: [
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
    docsRepo: 'https://github.com/25prabhu10/notes',
    docsBranch: 'master',
    docsDir: 'docs',
    editLink: true,
    editLinkPattern: ':repo/edit/:branch/:path',
    contributors: false,
  }),
  markdown: {
    code: { lineNumbers: false },
  },
});
