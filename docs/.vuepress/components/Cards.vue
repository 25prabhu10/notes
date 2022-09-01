<template>
  <article class="row">
    <a
      v-bind:href="topic.url"
      :class="`card card__` + topic.id"
      v-for="topic in topics"
    >
      <img
        v-bind:src="topic.imgScr"
        v-bind:alt="topic.title"
        class="card__img"
      />
      <div :class="`card__text--container card__text--container-` + topic.id">
        <h3 class="card__text">{{ topic.title }}</h3>
      </div>
    </a>
  </article>
</template>
<script>
export default {
  data() {
    return {
      topics: [
        {
          id: 1,
          title: "Markdown",
          url: "/Languages/Markdown/",
          imgScr: "/markdown-logo.svg",
        },
        {
          id: 2,
          title: "Bash",
          url: "/Languages/Shell-Scripting/Bash",
          imgScr: "/bash-logo.svg",
        },
        {
          id: 3,
          title: "Python",
          url: "/Languages/Python/",
          imgScr: "/python-logo.svg",
        },
        {
          id: 4,
          title: "HTML",
          url: "/Languages/HTML/",
          imgScr: "/html5-logo.svg",
        },
        {
          id: 5,
          title: "CSS",
          url: "/Languages/CSS/",
          imgScr: "/css-logo.svg",
        },
        {
          id: 6,
          title: "JavaScript",
          url: "/Languages/JavaScript/",
          imgScr: "/javascript-logo.svg",
        },
        {
          id: 7,
          title: "TypeScript",
          url: "/Languages/JavaScript/TypeScript/TypeScript",
          imgScr: "/typescript-logo.svg",
        },
        {
          id: 8,
          title: "Angular",
          url: "/Languages/JavaScript/Angular/Angular",
          imgScr: "/angular-logo.svg",
        },
        {
          id: 9,
          title: "React",
          url: "/Languages/JavaScript/React/",
          imgScr: "/react-logo.svg",
        },
        {
          id: 10,
          title: "Gulp.js",
          url: "/Languages/JavaScript/Tools/Gulp.js/Gulp.js",
          imgScr: "/gulp-logo.svg",
        },
        {
          id: 11,
          title: "Vue.js",
          url: "/Languages/JavaScript/Vue.JS/",
          imgScr: "/vuejs-logo.svg",
        },
        {
          id: 12,
          title: "C#",
          url: "/Languages/C-Sharp/",
          imgScr: "/c-sharp-logo.svg",
        },
        {
          id: 13,
          title: "Concepts",
          url: "/Concepts/",
          imgScr: "/open-book.svg",
        },
        {
          id: 14,
          title: "Languages",
          url: "/Languages/",
          imgScr: "/programming-code.svg",
        },
        {
          id: 15,
          title: "Android",
          url: "/Collection/Android/Uninstall_Android_Apps",
          imgScr: "/android-logo.svg",
        },
        {
          id: 16,
          title: "Collection",
          url: "/Collection",
          imgScr: "/collection.svg",
        },
      ],
    };
  },
};
</script>
