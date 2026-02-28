<script setup lang="ts">
import { useData } from "vitepress";

import Card from "./Card.vue";

const { isDark } = useData();

type ImgPath = string | { dark: string; light: string };

function getLightImg(path: ImgPath): string {
  if (typeof path === "object" && path !== null) {
    return isDark.value ? path.dark : path.light;
  }

  return path;
}

const languages = [
  {
    borderColor: "#f0db4f",
    href: "/Languages/JavaScript/",
    imgPath: "/javascript.svg",
    shadowColor: "#f0db4f",
    title: "JavaScript",
  },
  {
    borderColor: "#669cd5fc",
    href: "/Languages/JavaScript/TypeScript/TypeScript",
    imgPath: "/typescript.svg",
    shadowColor: "#669cd5fc",
    title: "TypeScript",
  },
  {
    borderColor: "#58c4dcfe",
    href: "/Languages/JavaScript/React/",
    imgPath: { dark: "/react.svg", light: "/react-light.svg" },
    shadowColor: "#087ea4fe",
    title: "React",
  },
  {
    borderColor: "#f32bbffd",
    href: "/Languages/JavaScript/Angular/Angular",
    imgPath: "/angular.svg",
    shadowColor: "#f32bbffd",
    title: "Angular",
  },
  {
    borderColor: "#41b883fe",
    href: "/Languages/JavaScript/Vue.js/",
    imgPath: "/vue.svg",
    shadowColor: "#41b883fe",
    title: "Vue.js",
  },
  {
    borderColor: "#e34f26",
    href: "/Languages/HTML/",
    imgPath: "/html.svg",
    shadowColor: "#e34f26",
    title: "HTML",
  },
  {
    borderColor: "#ad91c8",
    href: "/Languages/CSS/",
    imgPath: "/css.svg",
    shadowColor: "#ad91c8",
    title: "CSS",
  },
  {
    borderColor: "#ffd343fe",
    href: "/Languages/Python/",
    imgPath: "/python.svg",
    shadowColor: "#3773a5fe",
    title: "Python",
  },
  {
    borderColor: "#a179dc",
    href: "/Languages/C-Sharp/",
    imgPath: "/csharp.svg",
    shadowColor: "#a179dc",
    title: "C#",
  },
  {
    borderColor: "#669ad2fe",
    href: "/Languages/C-CPP/C",
    imgPath: "/c.svg",
    shadowColor: "#669ad2fe",
    title: "C",
  },
  {
    borderColor: "#fbfcfd",
    href: "/Concepts/Databases/PostgreSQL",
    imgPath: "/postgresql.svg",
    shadowColor: "#346791",
    title: "PostgreSQL",
  },
  {
    borderColor: "#00ED64",
    href: "/Concepts/Databases/MongoDB/MongoDB",
    imgPath: "/mongodb.svg",
    shadowColor: "#00ED64",
    title: "MongoDB",
  },
  {
    borderColor: "#c6312cfd",
    href: "/Concepts/Databases/Redis",
    imgPath: "/redis.svg",
    shadowColor: "#c6312cfd",
    title: "Redis",
  },
  {
    borderColor: "#43a2dcfe",
    href: "/Concepts/Databases/SQLite",
    imgPath: { dark: "/sqlite.svg", light: "/sqlite-light.svg" },
    shadowColor: "#43a2dcfe",
    title: "SQLite",
  },
  {
    borderColor: "#f34f29",
    href: "/Concepts/Git/Git",
    imgPath: "/git.svg",
    shadowColor: "#f34f29",
    title: "Git",
  },
  {
    borderColor: "#1d63ed",
    href: "/Concepts/CI-CD/Docker",
    imgPath: "/docker.svg",
    shadowColor: "#1d63ed",
    title: "Docker",
  },
  {
    borderColor: "#efb03ae2",
    href: "/Concepts/Linux",
    imgPath: "/linux.svg",
    shadowColor: "#efb03ae2",
    title: "Linux",
  },
  {
    href: "/Languages/Shell-Scripting/Bash",
    imgPath: { dark: "/bash.svg", light: "/bash-light.svg" },
    title: "Bash",
  },
  {
    borderColor: "#4c4ca7",
    href: "/Languages/Lua",
    imgPath: "/lua.svg",
    shadowColor: "#000080",
    title: "Lua",
  },
  {
    borderColor: "#6cae4cfb",
    href: "/Collection/Editors/Vim-Neovim",
    imgPath: "/neovim.svg",
    shadowColor: "#6cae4cfb",
    title: "NeoVim",
  },
  {
    borderColor: "#339933",
    href: "/Languages/JavaScript/Node.js/",
    imgPath: "/nodejs.svg",
    shadowColor: "#339933",
    title: "Node.js",
  },
  {
    borderColor: "#00ADD8",
    href: "/Languages/Go",
    imgPath: { dark: "/go.svg", light: "/go-light.svg" },
    shadowColor: "#00ADD8",
    title: "Go",
  },
  {
    borderColor: "#FF9900",
    href: "/Concepts/AWS/",
    imgPath: { dark: "/aws.svg", light: "/aws-light.svg" },
    shadowColor: "#FF9900",
    title: "AWS",
  },
  {
    borderColor: "#326CE5",
    href: "/Concepts/CI-CD/Kubernetes",
    imgPath: "/kubernetes.svg",
    shadowColor: "#326CE5",
    title: "Kubernetes",
  },
  {
    borderColor: "#e34f26",
    href: "/Concepts/Application_Security/",
    imgPath: "/security.svg",
    shadowColor: "#e34f26",
    title: "App Security",
  },
  {
    href: "/Concepts/Kafka",
    imgPath: { dark: "/kafka.svg", light: "/kafka-light.svg" },
    title: "Kafka",
  },
  {
    href: "/Languages/Markdown/",
    imgPath: { dark: "/markdown.svg", light: "/markdown-light.svg" },
    title: "Markdown",
  },
  {
    href: "/Concepts/",
    imgPath: { dark: "/concept.svg", light: "/concept-light.svg" },
    title: "Concepts",
  },
  {
    href: "/Languages/",
    imgPath: { dark: "/code.svg", light: "/code-light.svg" },
    title: "Languages",
  },
  {
    href: "/Collection/",
    imgPath: { dark: "/collection.svg", light: "/collection-light.svg" },
    title: "Collection",
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
