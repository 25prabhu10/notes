---
title: HTML
description: Hypertext Markup Language is the standard markup language for documents designed to be displayed in a web browser.
---

# HTML

Hyper-Text Markup Language.

## HTML Forms

An HTML form is used to collect user input. The user input is most often sent to a server for processing.

_Example_:

```html
<form action="" method="get" class="form-example">
  <div class="form-example">
    <label for="name">Enter your name: </label>
    <input type="text" name="name" id="name" required />
  </div>
  <div class="form-example">
    <label for="email">Enter your email: </label>
    <input type="email" name="email" id="email" required />
  </div>
  <div class="form-example">
    <input type="submit" value="Subscribe!" />
  </div>
</form>
```

### Form Element

The form elemet `<form>` is used to create an HTML form for user input:

```html
<form>...</form>
```

It's Attributes:

- `autocomplete`: Indicates whether input elements can by default have their values automatically completed by the browser

  - `off`: No autofill (expect for username and password)
  - `on`: The browser may automatically complete entries

- `name`: The name of the form. Must **not be empty string** and must **be unique among other form elements**

- `rel`: Specifies the relationship between the current document and the linked document

Attributes for form submission:

- `action`: The URL that processes the form submission. This value can be overridden by a formaction attribute on a `<button>`, `<input type="submit">`, or `<input type="image">` element.

- `enctype`: If the value of the **method attribute is post, enctype is the MIME type** of the form submission.

  - `application/x-www-form-urlencoded`: The default value.
  - `multipart/form-data`: Use this if the form contains `<input>` elements with type=file.
  - `text/plain`: Introduced by HTML5 for debugging purposes.
  - This value can be overridden by `formenctype` attributes on `<button>`, `<input type="submit">`, or `<input type="image">` elements.

- `method`: The HTTP method to submit the form with.

  - `post`: The **POST method**; form data sent as the request body.
  - `get`: The **GET method**; form data appended to the action URL with a `?` separator. Use this method when the form has no side-effects.
  - `dialog`: When the form is inside a `<dialog>`, closes the dialog on submission.
  - This value is overridden by `formmethod` attributes on `<button>`, `<input type="submit">`, or `<input type="image">` elements.

- `novalidate`: This Boolean attribute indicates that the form shouldn't be validated when submitted. If this attribute is not set (and therefore the form is validated), it can be overridden by a `formnovalidate` attribute on a `<button`>, `<input type="submit">`, or `<input type="image"`> element belonging to the form.

- `target`: Indicates where to display the response after submitting the form. In HTML5, it is a name/keyword for a browsing context (for example, tab, window, or iframe). The following keywords have special meanings:

  - `_self (default)`: Load into the same browsing context as the current one.
  - `_blank`: Load into a new unnamed browsing context.
  - `_parent`: Load into the parent browsing context of the current one. If no parent, behaves the same as `_self.`
  - `_top`: Load into the top-level browsing context (i.e., the browsing context that is an ancestor of the current one and has no parent). If no parent, behaves the same as `_self.`
  - This value can be overridden by a formtarget attribute on a `<button>`, `<input type="submit">`, or `<input type="image">` element.

::: tip NOTE

- Setting target="\_blank" on <form> elements implicitly provides the same rel behavior as setting rel="noopener" which does not set window.opener.
- It is possible to use the `:valid` and `:invalid` CSS pseudo-classes to style a `<form>` element based on whether or not the elements inside the form are valid.

:::

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
