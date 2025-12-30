// Rules:
//  "@textlint-rule/no-unmatched-pair": true
//
//  common-misspellings: true
//
//  diacritics: true
//
//  spelling:
//    language: "en-gb"
//    skipPatterns: ["/\\d/g"]
//    suggestCorrections: true
//
//  en-capitalization: true
//
//  terminology:
//    defaultTerms: true
//
//  write-good:
//    severity: "warning"
//
// Filters:
//  comments: true

export default {
  filters: {
    comments: true,
  },
  rules: {
    "@textlint-rule/no-unmatched-pair": true,
    "common-misspellings": true,
    diacritics: true,
    //spelling: {
    //  language: "en-gb",
    //  skipPatterns: ["/\\d/g"],
    //  suggestCorrections: true
    //},
    "en-capitalization": true,
    terminology: {
      defaultTerms: true,
    },
    "write-good": {
      severity: "warning",
    },
  },
};
