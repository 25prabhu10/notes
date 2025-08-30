<script setup>
import { useData } from "vitepress";

import Card from "./Card.vue";

const { isDark } = useData();

const getLightImg = (path) => {
  if (typeof path === "object" && path !== null) {
    return isDark.value ? path.dark : path.light;
  }

  return path;
};

const languages = [
  {
    title: "Markdown",
    href: "/Languages/Markdown/",
    imgPath: { dark: "/markdown.svg", light: "/markdown-light.svg" },
  },
  {
    title: "HTML",
    href: "/Languages/HTML/",
    imgPath: "/html5.svg",
    shadowColor: "#e34f26",
    borderColor: "#e34f26",
  },
  {
    title: "CSS",
    href: "/Languages/CSS/",
    imgPath: "/css.svg",
    shadowColor: "#ad91c8",
    borderColor: "#ad91c8",
  },
  {
    title: "JavaScript",
    href: "/Languages/JavaScript/",
    imgPath: "/javascript.svg",
    shadowColor: "#f0db4f",
    borderColor: "#f0db4f",
  },
  {
    title: "TypeScript",
    href: "/Languages/JavaScript/TypeScript/TypeScript",
    imgPath: "/typescript.svg",
    shadowColor: "#669cd5fc",
    borderColor: "#669cd5fc",
  },
  {
    title: "React",
    href: "/Languages/JavaScript/React/",
    imgPath: { dark: "/react.svg", light: "/react-light.svg" },
    shadowColor: "#087ea4fe",
    borderColor: "#58c4dcfe",
  },
  {
    title: "C#",
    href: "/Languages/C-Sharp/",
    imgPath: "/csharp.svg",
    shadowColor: "#a179dc",
    borderColor: "#a179dc",
  },
  {
    title: "Python",
    href: "/Languages/Python/",
    imgPath: "/python.svg",
    shadowColor: "#3773a5fe",
    borderColor: "#ffd343fe",
  },
  {
    title: "Git",
    href: "/Languages/Git/Git",
    imgPath: "/git.svg",
    shadowColor: "#f34f29",
    borderColor: "#f34f29",
  },
  {
    title: "Angular",
    href: "/Languages/JavaScript/Angular/Angular",
    imgPath: "/angular.svg",
    shadowColor: "#f32bbffd",
    borderColor: "#f32bbffd",
  },
  {
    title: "SQLite",
    href: "/Concepts/Databases/SQLite",
    imgPath: "/sqlite.svg",
    shadowColor: "#43a2dcfe",
    borderColor: "#43a2dcfe",
  },
  {
    title: "PostgreSQL",
    href: "/Concepts/Databases/PostgreSQL",
    imgPath: "/postgresql.svg",
    shadowColor: "#346791",
    borderColor: "#fbfcfd",
  },
  {
    title: "MongoDB",
    href: "/Concepts/Databases/MongoDB/MongoDB",
    imgPath: "/mongodb.svg",
    shadowColor: "#00ED64",
    borderColor: "#00ED64",
  },
  {
    title: "Redis",
    href: "/Concepts/Databases/Redis",
    imgPath: "/redis.svg",
    shadowColor: "#c6312cfd",
    borderColor: "#c6312cfd",
  },
  {
    title: "C",
    href: "/Languages/C-CPP/C",
    imgPath: "/c.svg",
    shadowColor: "#669ad2fe",
    borderColor: "#669ad2fe",
  },
  {
    title: "Docker",
    href: "/Languages/CI-CD/Docker/Docker",
    imgPath: "/docker.svg",
    shadowColor: "#1d63ed",
    borderColor: "#1d63ed",
  },
  {
    title: "Bash",
    href: "/Languages/Shell-Scripting/Bash",
    imgPath: { dark: "/bash.svg", light: "/bash-light.svg" },
  },
  {
    title: "Linux",
    href: "/Concepts/Linux",
    imgPath: "/linux.svg",
    shadowColor: "#efb03ae2",
    borderColor: "#efb03ae2",
  },
  {
    title: "Lua",
    href: "/Languages/Lua",
    imgPath: "/lua.svg",
    shadowColor: "#000080",
    borderColor: "#4c4ca7",
  },
  {
    title: "Gulp.js",
    href: "/Languages/JavaScript/Tools/Gulp.js/Gulp.js",
    imgPath: "/gulp.svg",
    shadowColor: "#da4648fe",
    borderColor: "#da4648fe",
  },
  {
    title: "Vue.js",
    href: "/Languages/JavaScript/Vue.js/",
    imgPath: "/vue.svg",
    shadowColor: "#41b883fe",
    borderColor: "#41b883fe",
  },
  {
    title: "NeoVim",
    href: "/Collection/Editors/Vim-Neovim",
    imgPath: "/neovim.svg",
    shadowColor: "#6cae4cfb",
    borderColor: "#6cae4cfb",
  },
  {
    title: "Concepts",
    href: "/Concepts/",
    imgPath: { dark: "/concept.svg", light: "/concept-light.svg" },
  },
  {
    title: "Languages",
    href: "/Languages/",
    imgPath: { dark: "/code-xml.svg", light: "/code-xml-light.svg" },
  },
  {
    title: "Collection",
    href: "/Collection/",
    imgPath: { dark: "/collection.svg", light: "/collection-light.svg" },
  },
];
</script>

<template>
  <ul>
    <li v-for="lang in languages" :key="lang.title">
      <ClientOnly>
        <Card
          :title="lang.title"
          :imgPath="getLightImg(lang.imgPath)"
          :href="lang.href"
          :shadowColor="lang.shadowColor"
          :borderColor="lang.borderColor"
        />
      </ClientOnly>
    </li>
  </ul>
</template>

<style scoped>
ul {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 3rem;
  padding: 0;
}

li:has(article) {
  margin-top: 0;
  list-style: none;
}

@media (max-width: 768px) {
  ul {
    gap: 2rem;
  }
}
</style>
