---
title: Sass
description: Sass is a preprocessor scripting language that is interpreted or compiled into Cascading Style Sheets
---

# Sass

Syntactically Awesome Style Sheets (Sass) is a CSS pre-processor, this helps users to use features like variables, nesting, mixins, inheritance, and catch errors during compilation. These features help in writing well structured, readable, maintainable, and scalable CSS.

A stylesheet language initially designed by Hampton Catlin and developed by Nathan Weizenbaum and Chris Eppstein.

## Syntax

Sass can be written using any one of the two different syntax:

1. Sass Syntax - Based on _HAML_ syntax style
2. Sassy CSS (SCSS) - Based on CSS3 syntax style (New)

### Variables

Variables in Sass are used for reusing values. `$` symbol is prefixed to create variable.

- Sass:

  ```scss
  $font-stack: Helvetica, sans-serif
  $primary-color: #333

  body
    font: 100% $font-stack
    color: $primary-color
  ```

- SCSS:

  ```scss
  $font-stack: Helvetica, sans-serif;
  $primary-color: #333;

  body {
    font: 100% $font-stack;
    color: $primary-color;
  }
  ```

- Resulting CSS:

  ```css
  body {
    font: 100% Helvetica, sans-serif;
    color: #333;
  }
  ```

::: tip NOTE
CSS variables are used whenever dynamic styles need to be applied, like under media queries. Mixture of both CSS and Sass variables are used depending on the need. Check CSS variables vs Sass variables.
:::

### Nesting

Sass allows nesting CSS rules, similar to HTML nesting.

- Sass:

  ```scss
  nav
    ul
      margin: 0
      padding: 0
      list-style: none

    li
      display: inline-block

    a
      display: block
      padding: 6px 12px
      text-decoration: none
  ```

- SCSS:

  ```scss
  nav {
    ul {
      margin: 0;
      padding: 0;
      list-style: none;
    }

    li {
      display: inline-block;
    }

    a {
      display: block;
      padding: 6px 12px;
      text-decoration: none;
    }
  }
  ```

- Resulting CSS:

  ```css
  nav ul {
    margin: 0;
    padding: 0;
    list-style: none;
  }
  nav li {
    display: inline-block;
  }
  nav a {
    display: block;
    padding: 6px 12px;
    text-decoration: none;
  }
  ```

> Overly nesting could prove hard to maintain.

## References

- [Sass](https://sass-lang.com/)
- [Another UI Guy - Sass Notes](https://anotheruiguy.gitbooks.io/sassintherealworld_book-i/content/)

- [Sass Guidelines](https://sass-guidelin.es/)
