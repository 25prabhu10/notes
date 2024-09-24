---
aside: false
---

# Notes

Collection of all the information acquired from various sources in one place

- Site is built with [VitePress](https://vitepress.dev)

- Docs written in **Markdown**

<script setup>
import { VPTeamMembers } from 'vitepress/theme'

const members = [
  {
    avatar: 'https://www.github.com/25prabhu10.png',
    name: 'Prabhu Hiremath',
    title: 'Developer',
    links: [
      { icon: 'github', link: 'https://github.com/25prabhu10' },
    ],
    desc: 'React',
    // sponsor: 'Me'
  },
]
</script>

<VPTeamMembers size="small" :members="members" />
