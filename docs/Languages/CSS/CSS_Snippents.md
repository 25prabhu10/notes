---
title: CSS Snippets
description: Collection of CSS Snippets
---

# CSS Snippets

## Forms

- Form validation:

  ```html
  <form>
    <div class="form-group">
      <label for="name">Name</label>
      <input
        type="text"
        id="name"
        placeholder="Enter your name"
        required
        aria-errormessage="name-error"
      />
      <div class="error" id="name-error" aria-live="polite">
        Please enter your name.
      </div>
    </div>
    <div class="form-group">
      <label for="email">Email</label>
      <input
        type="email"
        id="email"
        placeholder="Enter your email"
        required
        aria-errormessage="email-error"
      />
      <div class="error" id="email-error" aria-live="polite">
        Please enter a valid email.
      </div>
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input
        type="password"
        id="password"
        placeholder="Enter your password"
        minlength="8"
        araia-errormessage="password-error"
        required
      />
      <div class="hint">Password must be at least 8 characters.</div>
      <div class="error" id="password-error" aria-live="polite">
        Please enter a valid password.
      </div>
    </div>

    <div>
      <label for="items">How many tickets? <span>(max 5)</span></label>
      <input
        type="number"
        id="items"
        value="1"
        min="1"
        max="5"
        placeholder="Enter number of tickets"
        required
      />
    </div>

    <div>
      <label for="color-picker">Choose a color</label>
      <input type="color" id="color-picker" required />
    </div>

    <div>
      <label for="toggle">Toggle</label>
      <input type="checkbox" id="toggle" switch required />
    </div>
  </form>

  <style>
    input {
      outline: 3px solid hsl(203, 30%, 262);
    }

    input:focus:valid,
    input:valid:not(:placeholder-shown) {
      outline-color: green;
    }

    input:invalid:not(:placeholder-shown) {
      outline-color: red;
    }

    input:foucs:invalid:not(:placeholder-shown) {
      outline-color: yellow;
    }

    .error {
      color: red;
    }

    .hint {
      color: gray;
    }

    .error,
    .hint {
      display: none;
    }

    input:not(:focus):invalid:not(:placeholder-shown) ~ .error {
      display: block;

      @media (prefers-reduced-motion: no-preference) {
        animation: form-error 200ms 3;
      }
    }

    input:focus:invalid:not(:placeholder-shown) ~ .hint {
      display: block;
    }

    input[type="number"]:not(:in-range) {
      background-color: hsl(348, 55%, 93%);
      outline: 3px solid hsl(348, 55%, 93%);
    }

    input[type="color"] {
      width: 4rem;
      height: 4rem;
    }

    #toggle {
      appearance: none;
      width: 4rem;
      height: 2rem;
      padding: 0rem;
      background: black;
      border-radius: 100vw;
      border: 5px solid white;
      position: relative;
    }

    #toggle::before {
      content: "";
      position: absolute;
      inset: 5px;
      width: calc(2rem - 20px);
      height: calc(2rem - 20px);
      background: white;
      border-radius: 50%;
      transition: 200ms;
    }

    #toggle:checked {
      background: green;
    }

    #toggle:checked::before {
      translate: 2rem;
    }

    @keyframes form-error {
      25% {
        translate: -5px;
      }
      75% {
        translate: 5px;
      }
    }
  </style>
  ```

- Custom Radio:

  ```html
  <input type="radio" id="radio" name="radio" />
  <label for="radio">Radio</label>
  ```

  ```css
  input[type="radio"] {
    display: none;
  }

  input[type="radio"] + label {
    position: relative;
    padding-left: 2rem;
    cursor: pointer;
  }

  input[type="radio"] + label::before {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    width: 1.5rem;
    height: 1.5rem;
    border: 2px solid #333;
    border-radius: 50%;
    background-color: #fff;
  }

  input[type="radio"]:checked + label::before {
    background-color: #333;
  }
  ```

- Custom Checkbox:

  ```html
  <input type="checkbox" id="checkbox" /> <label for="checkbox">Checkbox</label>
  ```

  ```css
  input[type="checkbox"] {
    display: none;
  }

  input[type="checkbox"] + label {
    position: relative;
    padding-left: 2rem;
    cursor: pointer;
  }

  input[type="checkbox"] + label::before {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    width: 1.5rem;
    height: 1.5rem;
    border: 2px solid #333;
    background-color: #fff;
  }

  input[type="checkbox"]:checked + label::before {
    background-color: #333;
  }
  ```

- Custom Select:

  ```html
  <select>
    <option value="1">Option 1</option>
    <option value="2">Option 2</option>
    <option value="3">Option 3</option>
  </select>

  <style>
    select {
      appearance: none;
      padding: 0.5rem;
      border: 1px solid #333;
      border-radius: 0.25rem;
    }
  </style>
  ```

- Form with floating label:

  ```html
  <div class="form-group white">
    <input type="text" id="name" required />
    <label for="name">Name</label>
  </div>

  <style>
    .form-group {
      position: relative;
      margin-bottom: 1rem;
    }

    input {
      width: 100%;
      padding: 0.5rem;
      border: 1px solid #333;
      border-radius: 0.25rem;
    }

    label {
      position: absolute;
      top: 0.5rem;
      left: 0.5rem;
      color: #333;
      pointer-events: none;
      transition: 0.3s;
    }

    input:focus + label,
    input:valid + label {
      top: -0.5rem;
      left: 0;
      font-size: 0.75rem;
      color: #333;
    }
  </style>
  ```

## Scroll

- Smooth Scroll:

  ```css
  html {
    @media (prefers-reduced-motion: no-preference) {
      /* styles to apply if a user's device settings are set to reduced motion */
      scroll-behavior: smooth;
    }
  }
  ```

- Scroll margin and padding:

  ```css
  .container {
    scroll-margin: 100px; /* top */
    scroll-padding: 100px; /* top */
  }
  ```

- Scroll with animation:

  ```css
  :target {
    scroll-margin: 10rem;

    h2 {
      animation: target 1s;
    }
  }

  @keyframes target {
    0% {
      background-color: transparent;
    }
    100% {
      background-color: yellow;
    }
  }
  ```

- Scroll Snap:

  ```css
  .container {
    display: flex;
    overflow-x: scroll;
    scroll-snap-type: x mandatory;
  }

  .item {
    scroll-snap-align: start;
  }
  ```

- Custom Scrollbar:

  ```css
  /* width */
  ::-webkit-scrollbar {
    width: 10px;
  }

  /* Track */
  ::-webkit-scrollbar-track {
    background: #f1f1f1;
  }

  /* Handle */
  ::-webkit-scrollbar-thumb {
    background: #888;
  }

  /* Handle on hover */
  ::-webkit-scrollbar-thumb:hover {
    background: #555;
  }
  ```

## Display

- Centred always:

  ```html
  <div class="parent blue">
    <div class="box coral" contenteditable>:)</div>
  </div>

  <style>
    .parent {
      display: grid;
      place-items: center;
    }
  </style>
  ```

- Auto vertical to horizontal display:

  ```html
  <div class="parent white">
    <div class="box green">1</div>
    <div class="box green">2</div>
    <div class="box green">3</div>
  </div>

  <style>
    .parent {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
    }

    .box {
      /* flex: <flex-grow> <flex-shrink> <baseWidth> */

      flex: 1 1 150px; /*  Stretching: fill space*/
      flex: 0 1 150px; /*  No stretching: */
      margin: 5px;
    }
  </style>
  ```

- Side-bars:

  ```html
  <div class="parent">
    <div class="section yellow" contenteditable>Min: 150px / Max: 25%</div>
    <div class="section purple" contenteditable>
      This element takes the second grid position (1fr), meaning it takes up the
      rest of the remaining space.
    </div>
  </div>

  <style>
    .parent {
      display: grid;

      /* grid-template-columns: minmax(<min>, <max>) ...; */
      grid-template-columns: minmax(150px, 25%) 1fr;
    }
  </style>
  ```

- Pancake Stack: Header - Main - Footer

  ```html
  <div class="parent">
    <header class="blue section" contenteditable>Header</header>
    <main class="coral section" contenteditable>Main</main>
    <footer class="purple section" contenteditable>Footer Content</footer>
  </div>

  <style>
    .parent {
      display: grid;
      grid-template-rows: auto 1fr auto;
    }
  </style>
  ```

- Holy Grail Layout:

  ```html
  <div class="parent">
    <header class="pink section">Header</header>
    <div class="left-side blue section" contenteditable>Left Sidebar</div>
    <main class="section coral" contenteditable>Main Content</main>
    <div class="right-side yellow section" contenteditable>Right Sidebar</div>
    <footer class="green section">Footer</footer>
  </div>

  <style>
    .parent {
      display: grid;
      grid-template: auto 1fr auto / auto 1fr auto;
    }

    header {
      padding: 2rem;
      grid-column: 1 / 4;
    }

    .left-side {
      grid-column: 1 / 2;
    }

    main {
      grid-column: 2 / 3;
    }

    .right-side {
      grid-column: 3 / 4;
    }

    footer {
      grid-column: 1 / 4;
    }
  </style>
  ```

- 12-Span Grid:

  ```html
  <div class="parent white">
    <div class="span-12 green section">Span 12</div>
    <div class="span-6 coral section">Span 6</div>
    <div class="span-4 blue section">Span 4</div>
    <div class="span-2 yellow section">Span 2</div>
  </div>

  <style>
    .parent {
      display: grid;
      grid-template-columns: repeat(12, 1fr);
    }

    .span-12 {
      grid-column: 1 / span 12;
    }

    .span-6 {
      grid-column: 1 / span 6;
    }

    .span-4 {
      grid-column: 4 / span 4;
    }

    .span-2 {
      grid-column: 3 / span 2;
    }

    /* centering text */
    .section {
      display: grid;
      place-items: center;
      text-align: center;
    }
  </style>
  ```

- RAM (Repeat, Auto, Minmax):

  ```html
  <div class="parent white">
    <div class="box pink">1</div>
    <div class="box purple">2</div>
    <div class="box blue">3</div>
    <div class="box green">4</div>
  </div>

  <style>
    .parent {
      display: grid;
      grid-gap: 1rem;

      /* grid-template-columns: repeat(auto-fill, minmax(<base>, 1fr)) */
      grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    }
  </style>
  ```

- Min and max size:

  ```html
  <div class="parent white">
    <div class="card purple">
      <h1>Title Here</h1>
      <div class="visual yellow"></div>
      <p>
        Descriptive Text. Lorem ipsum dolor sit, amet consectetur adipisicing
        elit. Sed est error repellat veritatis.
      </p>
    </div>
  </div>
  <style>
    .parent {
      display: grid;
      place-items: center;
    }

    .card {
      /* clamp(<min>, <actual>, <max>)*/
      width: clamp(23ch, 50%, 46ch);
      display: flex;
      flex-direction: column;
      padding: 1rem;
    }

    .visual {
      height: 125px;
      width: 100%;
    }
  </style>
  ```

- Maintain Aspect ratio:

  ```html
  <div class="parent white">
    <div class="card blue">
      <h1>Video Title</h1>
      <div class="visual green"></div>
      <p>Descriptive text for aspect ratio card demo.</p>
    </div>
  </div>
  <style>
    parent {
      display: grid;
      place-items: center;
    }

    .visual {
      /* aspect-ratio: <width> / <height> */
      aspect-ratio: 16 / 9;
    }

    .card {
      width: 50%;
      display: flex;
      flex-direction: column;
      padding: 1rem;
    }
  </style>
  ```

## Text

- Truncate Text:

  ```css
  .box {
    display: -webkit-box;
    -webkit-line-clamp: 1; /* number of lines */
    -webkit-box-orient: vertical;
    overflow: hidden;
  }
  ```

- Gradient Text:

  ```css
  h1 {
    background: linear-gradient(to right, rgb(67, 124, 205), rgb(69, 214, 202));
    background-clip: text;
    -webkit-background-clip: text;
    color: transparent;
  }
  ```

- Vertical Text:

  ```css
  h1 {
    writing-mode: vertical-lr;
  }
  ```

- Blend Modes:

  ```css
  h1 {
    background: black;
    color: blue;
    // mix-blend-mode: screen; // white is cutout and black is opaque
    mix-blend-mode: multiply; // black is cutout and white is opaque
  }
  ```

- Text (or any content) as background:

  ```css
  body {
    background: url('data:image/svg+xml,\
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">\
      <style>@keyframes foo %7Bto %7B transform: rotate(-20deg)}}</style>\
      <text y="1em" font-size="100" style="animation: foo 1s infinite alternate">🚀</text>\
      </svg>');
    background-size: 100px 100px;
  }
  ```

## Carousel

- Snap:

  ```css
  .container {
    width: 20rem;
    height: 20rem;
    background-color: #fff;
    display: flex;
    overflow-x: scroll;
    scroll-snap-type: x proximity; /* mandatory */
  }

  .item {
    min-width: 20rem;
    display: flex;
    justify-content: center;
    align-items: center;
    scroll-snap-align: center;
  }
  ```

## SVG

- Animated border:

  ```css
  <svg>
  <style>
  @keyframes marching-ants {to{stroke-dashoffset: -15px;}}
  </style>
  <rect width="100%" height="100%" style="stroke: black; stroke-widthL 4px; fill: none; stroke-dasharray: 10px 5px; animation: marching-ants 1s infintie linear;" />
  </svg>
  ```

## References

- [10 Modern CSS layout and sizing techniques](https://1linelayouts.glitch.me/)
