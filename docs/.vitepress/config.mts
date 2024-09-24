import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  lang: "en-US",
  title: "Notes",
  description: "Anthology of Snippets",
  rewrites: {
    "README.md": "index.md",
    "(.*)/README.md": "(.*)/index.md",
  },
  lastUpdated: true,
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: "/logo.png",
    nav: [
      { text: "Home", link: "/" },
      { text: "About", link: "/about" },
    ],
    socialLinks: [
      { icon: "github", link: "https://github.com/25prabhu10/notes" },
    ],
    footer: {
      message:
        'Released under the <a href="https://github.com/25prabhu10/notes/blob/master/LICENSE">MIT License</a>.',
      copyright: `Copyright © 2020-${new Date().getFullYear()} <a href="https://github.com/25prabhu10">Prabhu K Hiremath</a>`,
    },
    editLink: {
      pattern: "https://github.com/25prabhu10/notes/edit/master/:path",
      text: "Edit this page on GitHub",
    },
    lastUpdated: {
      text: "Updated at",
      formatOptions: {
        dateStyle: "full",
        timeStyle: "short",
      },
    },
    search: {
      provider: "local",
    },
  },
  markdown: {
    math: true,
    theme: {
      light: "ayu-dark",
      dark: "ayu-dark",
    },
  },
  head: [
    [
      "meta",
      {
        name: "viewport",
        content: "width=device-width, initial-scale=1.0, viewport-fit=cover",
      },
    ],
    ["link", { rel: "icon", href: "/logo.png" }],
    [
      "link",
      {
        rel: "icon",
        type: "image/png",
        sizes: "32x32",
        href: "/icons/favicon-32x32.png",
      },
    ],
    [
      "link",
      {
        rel: "icon",
        type: "image/png",
        sizes: "16x16",
        href: "/icons/favicon-16x16.png",
      },
    ],
    [
      "link",
      {
        rel: "apple-touch-icon",
        sizes: "180x180",
        href: "/icons/apple-touch-icon.png",
      },
    ],
    [
      "link",
      {
        rel: "apple-touch-icon-precomposed",
        sizes: "180x180",
        href: "/icons/apple-touch-icon-180x180-precomposed.png",
      },
    ],
    [
      "link",
      {
        rel: "mask-icon",
        color: "#00a300",
        href: "/icons/safari-pinned-tab.svg",
      },
    ],
    ["link", { rel: "manifest", href: "/manifest.json" }],
    ["meta", { name: "apple-mobile-web-app-capable", content: "yes" }],
    [
      "meta",
      { name: "apple-mobile-web-app-status-bar-style", content: "black" },
    ],
    ["meta", { name: "application-name", content: "Notes" }],
    ["meta", { name: "msapplication-TileColor", content: "#2bae66" }],
    ["meta", { name: "theme-color", content: "#3eaf7c" }],
    ["meta", { name: "msapplication-config", content: "/browserconfig.xml" }],
  ],
});
