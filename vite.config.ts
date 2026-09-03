import { defineConfig } from "vite-plus";

export default defineConfig({
  fmt: {
    arrowParens: "always",
    bracketSameLine: false,
    bracketSpacing: true,
    embeddedLanguageFormatting: "auto",
    endOfLine: "lf",
    experimentalSortImports: {
      groups: [
        "type-import",
        ["value-builtin", "value-external"],
        "type-internal",
        "value-internal",
        ["type-parent", "type-sibling", "type-index"],
        ["value-parent", "value-sibling", "value-index"],
        "unknown",
      ],
    },
    experimentalSortPackageJson: true,
    ignorePatterns: ["package-lock.json", ".vitepress/cache", "build", "dist"],
    jsxSingleQuote: false,
    printWidth: 100,
    quoteProps: "as-needed",
    semi: true,
    singleAttributePerLine: false,
    singleQuote: false,
    tabWidth: 2,
    trailingComma: "es5",
    useTabs: false,
  },
  lint: {
    categories: {
      correctness: "error",
      nursery: "warn",
      pedantic: "error",
      perf: "error",
      restriction: "error",
      style: "error",
      suspicious: "error",
    },
    env: {
      browser: true,
      node: true,
    },
    ignorePatterns: ["build", "!.vitepress/**", ".vitepress/cache"],
    jsPlugins: [
      {
        name: "vite-plus",
        specifier: "vite-plus/oxlint-plugin",
      },
    ],
    options: {
      typeAware: true,
      typeCheck: true,
    },
    overrides: [
      {
        files: ["utils/script-runner.ts"],
        rules: {
          "eslint/no-underscore-dangle": "off",
          "eslint/one-var": "off",
          "eslint/require-unicode-regexp": "off",
          "eslint/sort-vars": "off",
          "jsdoc/require-throws-type": "off",
          "node/no-sync": "off",
          "unicorn/prefer-import-meta-properties": "off",
        },
      },
      {
        files: ["docs/**/*.vue"],
        rules: {
          "eslint/one-var": "off",
        },
      },
    ],
    plugins: [
      "eslint",
      "import",
      "jsdoc",
      "node",
      "oxc",
      "promise",
      "typescript",
      "unicorn",
      "vue",
    ],
    rules: {
      "capitalized-comments": "off",
      "eslint/prefer-destructuring": "off",
      "func-style": [
        "error",
        "declaration",
        {
          allowTypeAnnotation: true,
        },
      ],
      "import/consistent-type-specifier-style": "off",
      "import/no-anonymous-default-export": "off",
      "import/no-default-export": "off",
      "import/no-nodejs-modules": "off",
      "import/unambiguous": "off",
      "init-declarations": "off",
      "no-console": [
        "error",
        {
          allow: ["info", "warn", "error"],
        },
      ],
      "no-magic-numbers": "off",
      "no-nested-ternary": "off",
      "no-optional-chaining": "off",
      "no-ternary": "off",
      "no-undef": "off",
      "sort-imports": "off",
      "sort-keys": [
        "error",
        "asc",
        {
          caseSensitive: false,
        },
      ],
      "unicorn/filename-case": "off",
      "unicorn/no-process-exit": "off",
      "vite-plus/prefer-vite-plus-imports": "error",
      "vue/define-props-declaration": "off",
      "vue/max-props": "off",
    },
  },
  staged: {
    "*.md": 'markdownlint-cli2 "#./docs/README.md" "#./docs/about.md"',
    "*.{html,js,mts,ts,vue,json,jsonc,yaml,md}": "vp fmt --no-error-on-unmatched-pattern",
    "*.{js,mts,ts,vue}": "vp lint --type-aware --type-check --deny-warnings",
  },
});
