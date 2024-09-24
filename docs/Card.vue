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
});
</script>

<template>
  <article>
    <a :href="href" class="card">
      <img :alt="title" :src="imgPath" class="logo" />
      {{ title }}
    </a>
  </article>
</template>

<style scoped>
.card {
  aspect-ratio: 1;
  min-width: 0;
  cursor: pointer;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 1em;
  padding: 2em;
  border: 0.1em solid var(--vp-c-text-3);
  border-radius: 0.5em;
}

.card:hover {
  box-shadow:
    0 1px 1px var(--vp-c-gray-soft),
    0 2px 2px var(--vp-c-gray-soft),
    0 4px 4px var(--vp-c-gray-soft),
    0 8px 8px var(--vp-c-gray-soft),
    0 16px 16px var(--vp-c-gray-soft);
}

img {
  height: 100px;
  width: 100px;
}
</style>
