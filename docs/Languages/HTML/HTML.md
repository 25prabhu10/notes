---
title: HTML
description: Hypertext Markup Language is the standard markup language for documents designed to be displayed in a web browser.
---

# HTML

Hyper-Text Markup Language.

## Accessibility

1. Tab order - Use `inert.js` pollyfill. `tabindex=0`. `document.querySelector('[tabindex="-1"]').focus()`. Don't use tabindex greater than 0.
2. Use native elements instead of creating one using div.
3. Rowing Tabindex technique.

Custom tags:

- To create a custom tag like `radio-button`:

  ```javascript
  class RadioButton extends HTMLElement {
    constructor() {
      super();
    }

    connectedCallback() {
      this.setAttribute("role", "radio");
      this.setAttribute("tabindex", -1);
      this.setAttribute("aria-checked", false);
    }
  }

  window.customElements.define("radio-button", RadioButton);
  ```

- Now create a parent element `radio-group`:

  ```javascript
  const VK_LEFT = 37;
  const VK_UP = 38;
  const VK_RIGHT = 39;
  const VK_DOWN = 40;

  class RadioGroup extends HTMLElement {
    constructor() {
      super();
    }

    connectedCallback() {
      this.setAttribute("role", "radiogroup");
      this.radios = Array.from(this.querySelectorAll("radio-button"));

      // SETUP INITIAL STATE
      if (this.hasAttribute("selected")) {
        let selected = this.getAttribute("selected");
        this._selected = selected;
        this.radios[selected].setAttribute("tabindex", 0);
        this.radios[selected].setAttribute("aria-checked", true);
      } else {
        this._selected = 0;
        this.radios[0].setAttribute("tabindex", 0);
      }

      this.addEventListener("keydown", this.handleKeyDown.bind(this));
      this.addEventListener("click", this.handleClick.bind(this));
    }

    handleKeyDown(e) {
      switch (e.keycode) {
        case VK_UP:
        case VK_LEFT: {
          e.preventDefault();

          if (this.selected === 0) {
            this.selected = this.radios.length - 1;
          } else {
            this.selected--;
          }
          break;
        }
        case VK_DOWN:
        case VK_RIGHT: {
          e.preventDefault();

          if (this.selected === this.radios.length - 1) {
            this.selected = 0;
          } else {
            this.selected++;
          }
          break;
        }
      }
    }

    handleClick(e) {}

    set selected(idx) {
      if (isFinite(this.selected)) {
        // SET THE OLD BUTTON TO TABINDEX -1
        let previousSelected = this.radios[this.selected];
        previousSelected.tabIndex = -1;
        previousSelected.removeAttribute("aria-checked", false);
      }

      // SET THE NEW BUTTON TO TABINDEX 0 AND FOCUS IT
      let newSelected = this.radios[idx];
      newSelected.tabIndex = 0;
      newSelected.focus();
      newSelected.setAttribute("aria-checked", true);

      this.setAttribute("selected", idx);
      this._selected = idx;
    }

    get selected() {
      return this._selected;
    }
  }
  ```

::: tip Learn
SEO
:::

## Lint Guide

Following a set of rules to right HTML helps in readability and maintenance of the code.

### Attribute order

HTML attributes should come in this particular order for easier reading of code:

- `class`
- `id`, `name`
- `data-*`
- `src`, `for`, `type`, `href`, `value`
- `title`, `alt`
- `role`, `aria-*`

Classes make for great reusable components, so they come first. Ids are more specific and should be used sparingly (e.g., for in-page bookmarks), so they come second.

```html
<a class="..." id="..." data-toggle="modal" href="#"> Example link </a>

<input class="form-control" type="text" />

<img src="..." alt="..." />
```
