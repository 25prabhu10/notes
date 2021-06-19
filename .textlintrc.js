module.exports = {
  rules: {
    '@textlint-rule/no-unmatched-pair': true,
    'common-misspellings': true,
    spellchecker: true,
    diacritics: true,
    'en-capitalization': {
      allowHeading: false,
    },
    terminology: {
      terms: `${__dirname}/.textlint.terms.json`,
    },
    'write-good': {
      severity: 'warning',
    },
  },
  filters: {
    comments: true,
  },
};
