<script setup>
defineProps({
  title: {
    type: String,
    default: "",
  },
  imgPath: {
    type: String,
    default: "./logo.png",
  },
  href: {
    type: String,
    default: "/",
  },
  shadowColor: {
    type: String,
    default: "var(--vp-c-text-1)",
  },
  borderColor: {
    type: String,
    default: "var(--vp-c-text-1)",
  },
});
</script>

<template>
  <article>
    <a :href="href" class="card" :aria-label="title">
      <img :alt="title" :src="imgPath" class="logo" loading="lazy" />{{ title }}</a
    >
  </article>
</template>

<style scoped>
.card {
  aspect-ratio: 1;
  cursor: pointer;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  gap: 1em;
  padding: 2em;
  border: 0.2em solid var(--vp-c-text-3);
  border-radius: 0.5em;
}

.dark .card:hover,
.dark .card:focus-visible {
  border-color: v-bind(borderColor);
  outline: v-bind(borderColor);
}

html:not(.dark) .card:hover,
html:not(.dark) .card:focus-visible {
  box-shadow: 0.5rem 0.5rem 0 0 v-bind(shadowColor);
}

@media (prefers-reduced-motion: no-preference) {
  .card {
    transition:
      box-shadow 0.2s ease-in-out,
      transform 0.2s ease-in-out;
  }

  .card:hover,
  .card:focus-visible {
    transform: translateY(-0.5em);
  }
}

img {
  height: 100px;
  width: 100px;
}
</style>
