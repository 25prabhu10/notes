<script setup lang="ts">
interface Props {
  borderColor?: string;
  href?: string;
  imgPath?: string;
  shadowColor?: string;
  title?: string;
}

const {
  title = "",
  imgPath = "./logo.png",
  href = "/",
  shadowColor = "var(--vp-c-text-1)",
  borderColor = "var(--vp-c-text-1)",
} = defineProps<Props>();
</script>

<template>
  <article>
    <a :href="href" class="card">
      <img :alt="title" :src="imgPath" class="logo" loading="lazy" width="100" height="100" />
      <span class="title">{{ title }}</span>
    </a>
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
  text-decoration: none;
  color: inherit;
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

.logo {
  height: 100px;
  width: 100px;
  object-fit: contain;
}

.title {
  font-weight: bold;
  text-align: center;
}
</style>
