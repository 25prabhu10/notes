import { defineConfig } from "vitepress";

/**
 * @see https://vitepress.dev/reference/site-config
 */
export default defineConfig({
  description: "Anthology of Snippets",
  head: [
    [
      "meta",
      {
        content: "width=device-width, initial-scale=1.0, viewport-fit=cover",
        name: "viewport",
      },
    ],
    ["link", { href: "/logo.png", rel: "icon" }],
    [
      "link",
      {
        href: "/icons/favicon-32x32.png",
        rel: "icon",
        sizes: "32x32",
        type: "image/png",
      },
    ],
    [
      "link",
      {
        href: "/icons/favicon-16x16.png",
        rel: "icon",
        sizes: "16x16",
        type: "image/png",
      },
    ],
    [
      "link",
      {
        href: "/icons/apple-touch-icon.png",
        rel: "apple-touch-icon",
        sizes: "180x180",
      },
    ],
    [
      "link",
      {
        href: "/icons/apple-touch-icon-180x180-precomposed.png",
        rel: "apple-touch-icon-precomposed",
        sizes: "180x180",
      },
    ],
    [
      "link",
      {
        color: "#3eaf7c",
        href: "/icons/safari-pinned-tab.svg",
        rel: "mask-icon",
      },
    ],
    ["link", { href: "/manifest.json", rel: "manifest" }],
    ["meta", { content: "yes", name: "mobile-web-app-capable" }],
    ["meta", { content: "black", name: "apple-mobile-web-app-status-bar-style" }],
    ["meta", { content: "Notes", name: "application-name" }],
    ["meta", { content: "#3eaf7c", name: "msapplication-TileColor" }],
    ["meta", { content: "#3eaf7c", name: "theme-color" }],
    ["meta", { content: "/browserconfig.xml", name: "msapplication-config" }],
  ],
  lang: "en-IN",
  lastUpdated: true,
  markdown: {
    math: true,
    theme: {
      dark: "vitesse-dark",
      light: "github-light",
    },
  },
  rewrites: {
    "(.*)/README.md": "(.*)/index.md",
    "README.md": "index.md",
  },
  themeConfig: {
    editLink: {
      pattern: "https://github.com/25prabhu10/notes/edit/master/docs/:path",
      text: "Edit this page on GitHub",
    },
    footer: {
      copyright: `Copyright © 2020-${new Date().getFullYear()} <a href="https://github.com/25prabhu10">Prabhu K Hiremath</a>`,
      message:
        'Released under the <a href="https://github.com/25prabhu10/notes/blob/master/LICENSE">MIT License</a>.',
    },
    lastUpdated: {
      formatOptions: {
        dateStyle: "full",
        timeStyle: "short",
      },
      text: "Updated at",
    },
    logo: "/logo.png",
    nav: [
      { link: "/", text: "Home" },
      { link: "/about", text: "About" },
    ],
    outline: "deep",
    search: {
      provider: "local",
    },
    siteTitle: "Notes",
    socialLinks: [{ icon: "github", link: "https://github.com/25prabhu10/notes" }],
  },
  title: "Notes",
  vite: {
    build: {
      emptyOutDir: true,
    },
  },
});
