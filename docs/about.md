---
aside: false
---

# Notes

A comprehensive knowledge base containing programming notes, code snippets, and solutions collected from various sources.

## Purpose

This site serves as a personal reference library for programming concepts, implementations, and best practices. The goal is to create a searchable, well-organized repository of practical knowledge that can be quickly accessed when needed.

## Technology

- Built with [VitePress](https://vitepress.dev) - A static site generator designed for technical documentation
- Content written in **Markdown** for simplicity and portability
- Organized by technology domains and concepts

## Contribute

Found this resource helpful? Contributions, corrections, and suggestions are welcome through GitHub.

<script setup>
import { VPTeamMembers } from "vitepress/theme";
import { VPTeamPage, VPTeamPageTitle, VPTeamPageSection } from "vitepress/theme";

const members = [
  {
    avatar: "https://www.github.com/25prabhu10.png",
    name: "Prabhu Kallayya Hiremath",
    title: "Full Stack Developer",
    links: [
      { icon: "github", link: "https://github.com/25prabhu10" },
      { icon: "linkedin", link: "https://www.linkedin.com/in/prabhuhiremath" },
    ],
    desc: "React, ASP.NET Core, Docker",
    // sponsor: 'Me'
  },
];
</script>

<VPTeamPage>
  <VPTeamPageSection>
    <template #title>Author</template>
    <template #members>
      <VPTeamMembers size="small" :members="members" />
    </template>
  </VPTeamPageSection>
</VPTeamPage>
