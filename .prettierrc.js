/**
 * @type {import("prettier").Config}
 */
const config = {
  arrowParens: 'always',
  bracketSpacing: true,
  endOfLine: 'lf',
  htmlWhitespaceSensitivity: 'css',
  insertPragma: false,
  singleAttributePerLine: false,
  bracketSameLine: false,
  jsxSingleQuote: false,
  printWidth: 80,
  proseWrap: 'preserve',
  quoteProps: 'as-needed',
  requirePragma: false,
  semi: true,
  singleQuote: false,
  tabWidth: 2,
  trailingComma: 'es5',
  useTabs: false,
  embeddedLanguageFormatting: 'auto',
  vueIndentScriptAndStyle: false,
  overrides: [
    {
      files: '*.js',
      options: {
        singleQuote: true,
        semi: false,
      },
    },
  ],
  plugins: ['@prettier/plugin-oxc', 'prettier-plugin-packagejson'],
}

export default config
