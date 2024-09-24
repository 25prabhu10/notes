<script setup>
import { useData } from "vitepress";

import Card from "./Card.vue";

const { isDark, ...rest } = useData();

function getLightImg(path, isDarkImg = false) {
  if (!isDarkImg) return path;

  const [relPath, type] = path.split(".");

  return `${relPath}${isDark.value ? "" : "-light"}.${type}`;
}

const languages = [
  {
    title: "Markdown",
    href: "/Languages/Markdown/",
    imgPath: getLightImg("/markdown-logo.svg", true),
  },
  {
    title: "Bash",
    href: "/Languages/Shell-Scripting/Bash",
    imgPath: getLightImg("/bash-logo.svg", true),
  },
  {
    title: "Python",
    href: "/Languages/Python/",
    imgPath: getLightImg("/python-logo.svg"),
  },
  {
    title: "HTML",
    href: "/Languages/HTML/",
    imgPath: getLightImg("/html5-logo.svg"),
  },
  {
    title: "CSS",
    href: "/Languages/CSS/",
    imgPath: getLightImg("/css-logo.svg"),
  },
  {
    title: "JavaScript",
    href: "/Languages/JavaScript/",
    imgPath: getLightImg("/javascript-logo.svg"),
  },
  {
    title: "TypeScript",
    href: "/Languages/JavaScript/TypeScript/TypeScript",
    imgPath: getLightImg("/typescript-logo.svg"),
  },
  {
    title: "Angular",
    href: "/Languages/JavaScript/Angular/Angular",
    imgPath: getLightImg("/angular-logo.svg"),
  },
  {
    title: "React",
    href: "/Languages/JavaScript/React/",
    imgPath: getLightImg("/react-logo.svg"),
  },
  {
    title: "Gulp.js",
    href: "/Languages/JavaScript/Tools/Gulp.js/Gulp.js",
    imgPath: getLightImg("/gulp-logo.svg"),
  },
  {
    title: "Vue.js",
    href: "/Languages/JavaScript/Vue.js/",
    imgPath: getLightImg("/vuejs-logo.svg"),
  },
  {
    title: "C#",
    href: "/Languages/C-Sharp/",
    imgPath: getLightImg("/c-sharp-logo.svg"),
  },
  {
    title: "Concepts",
    href: "/Concepts/",
    imgPath: getLightImg("/open-book.svg"),
  },
  {
    title: "Languages",
    href: "/Languages/",
    imgPath: getLightImg("/programming-code.svg"),
  },
  {
    title: "Android",
    href: "/Collection/Android/Uninstall_Android_Apps",
    imgPath: getLightImg("/android-logo.svg"),
  },
  {
    title: "Collection",
    href: "/Collection/",
    imgPath: getLightImg("/collection.svg"),
  },
];
/*README.md
- [Markdown](/Languages/Markdown/) - ![Markdown](/markdown-logo.svg)

- [Bash](/Languages/Shell-Scripting/Bash) - ![Bash](/bash-logo.svg)

- [Python](/Languages/Python/) - ![Python](/python-logo.svg)

- [HTML](/Languages/HTML/) - ![HTML](/html5-logo.svg)

- [CSS](/Languages/CSS/) - ![CSS](/css-logo.svg)

- [JavaScript](/Languages/JavaScript/) - ![JavaScript](/javascript-logo.svg)

- [TypeScript](/Languages/JavaScript/TypeScript/TypeScript) - ![TypeScript](/typescript-logo.svg)

- [Angular](/Languages/JavaScript/Angular/Angular) - ![Angular](/angular-logo.svg)

- [React](/Languages/JavaScript/React/) - ![React](/react-logo.svg)

- [Gulp.js](/Languages/JavaScript/Tools/Gulp.js/Gulp.js) - ![Gulp](/gulp-logo.svg)

- [Vue.js](/Languages/JavaScript/Vue.js/) - ![Vue](/vuejs-logo.svg)

- [C#](/Languages/C-Sharp/) - ![C](/c-sharp-logo.svg)

- [Concepts](/Concepts/) - ![Concepts](/open-book.svg)

- [Languages](/Languages/) - ![Languages](/programming-code.svg)

- [Android](/Collection/Android/Uninstall_Android_Apps) - ![Android](/android-logo.svg)

- [Collection](/Collection/) - ![Collection](/collection.svg)*/
</script>

<template>
  <ul>
    <li v-for="lang in languages">
      <ClientOnly>
        <Card :title="lang.title" :imgPath="lang.imgPath" :href="lang.href" />
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
}

li {
  list-style: none;
}
</style>
