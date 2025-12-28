---
title: Text Encoding
description: An overview of text encoding methods, including ASCII, UTF-8, UTF-16, and their applications
---

# Text Encoding

Text encoding is the process of converting characters into a format that can be easily stored and transmitted by computers. Computers use binary code (0s and 1s) to represent data, so text must be encoded into binary for processing and storage

Various encoding methods have been developed over the years to accommodate the growing need for representing diverse characters and symbols from different languages and scripts

- EBCDIC
- FIELDATA
- Baudot Code
- ITA2
- [ASCII (American Standard Code for Information Interchange)](#ascii-encoding)
- [UTF-8 (8-bit Unicode Transformation Format)](#unicode), UTF-16, and UTF-32

## Encoding

The term _encoding_ means the method in which characters are represented as a series of bytes

## ASCII Encoding

**American Standard Code for Information Interchange** (ASCII) (1963), is a character encoding standard for electronic communication

- It was originally based on the English alphabet
- Each character is represented by a 7-bit fixed-width binary number
  - Can encode only **128 characters** (`0000000` to `1111111`)
- It includes:
  - Control characters (non-printable) such as carriage return, line feed, and tab etc. (first 32 characters)
  - Printable characters (letters, digits, punctuation marks, and a few special symbols)
- They used only 7 bits for ASCII, the 8th bit was used for error checking or as a parity bit

_Example:_

- The capital letter _A_ is represented as: `A: 65 = 41 (hex) = 1000001 (binary)`
- The small letter _a_ is represented as:`a: 97 = 61 (hex) = 1100001 (binary)`

[Complete ASCII Table](https://en.wikipedia.org/wiki/ASCII#Printable_character_table)

ASCII is widely used still today in programming, data storage, and communication protocols. It has gone through several revisions and extensions to accommodate more characters and symbols, leading to the development of various character encoding standards such as ISO-8859 and Unicode

Limitations:

- Limited character set (only 128 characters)
- Not suitable for representing characters from non-English languages

## ISO-8856-X

- ASCII compatible
- Used 8-Bit encoding
  - Can encode 256 characters (`00000000` to `11111111`)
- 8859-2: (Central Europe)

## Unicode

[Unicode](https://www.unicode.org/versions/Unicode17.0.0/) (1988) is a **universal character encoding standard** that aims to provide a unique number for every character, regardless of the platform, program, or language

- Each character or symbol is mapped to a numerical value which is referred to as a **code point**
  - It's like a database which gives the relationship between a code point to a character

- Fully ASCII and ISO-8859 compatible
- It uses variable width encoding aka MultiByte character set (MBCS) to represent characters
  - Can use 1 to 4 bytes per character
  - First bit of the byte indicates whether it's a single-byte or multi-byte character, this allows for backward compatibility with ASCII (making use of 1 byte which was not used in ASCII)
    - The first byte of a multi-byte character is known as the lead byte, and the subsequent bytes are known as trail or continuation bytes
    - All the single-byte characters start with `0` in the MSB
    - While multi-byte characters start with `1` in the MSB of the lead byte and `10` in the MSB of the trail bytes

    - `0xxxxxxx`: Single-byte character (ASCII)
    - `110xxxxx 10xxxxxx`: 2-byte character
    - `1110xxxx 10xxxxxx 10xxxxxx`: 3-byte character

This is called UTF-8 encoding (8-bit Unicode Transformation Format), as it uses 8-bit blocks to represent a character

- Almost all modern systems and applications support and use UTF-8 encoding
- If a file is encoded in UTF-8, it should be opened and read using UTF-8 encoding to ensure that the characters are interpreted correctly

We can use 16-bit or 32-bit blocks to represent characters as well, known as UTF-16 and UTF-32 respectively

- Windows internally uses UTF-16 encoding for representing text

### Code Points

- Current version: 17 (~159,801 characters and 172 scripts) as of Oct 2025

- `U+0000` - `U+10FFFF`

- `U+0000` - `U+007F`: ASCII
- `U+0080` - `U+00FF`: ISO

- `U+0000` - `U+FFFF` (BMP: Basic Multilingual Plane) = 65536 characters
- `U+010000` - `U+10FFFF` (Astral Planes) = Over a million

There are code points such as `C0`, `C1`, and `F5` to `FF` which are **not valid** in UTF-8 encoding, if encountered, they are deemed as invalid or malformed sequences and a replacement character (`�` - `FFBFBD`) is used instead as suggested by Unicode standard

Special Code Points:

- Zero-Width Joiner (ZWJ - `U+200D`) and Zero-Width Non-Joiner (ZWNJ - `U+200C`)
  - These are invisible characters that affect the rendering of adjacent characters without adding any visible space
  - Used in scripts like Arabic and Indic to control the joining behaviour of characters
  - Emoji sequences also use ZWJ to create complex emoji by combining multiple characters like the family emoji `👨‍👩‍👧‍👦`. They are known as _grapheme cluster_

- `U+FEFF`: Byte Order Mark (BOM)
  - Used to indicate the endianness of a text file or stream
  - Can also be used to signal that a file is encoded in UTF-8

- `U+FFFD`: Replacement Character
  - Used to replace an unknown, unrecognised, or unrepresentable character

### Normalization

Normalization is the process of converting text to a standard form, ensuring that characters that may have multiple representations are treated as equivalent for comparison and searching purposes

- For example, the character `é` can be represented as a single code point (`U+00E9`) or as a combination of the letter `e` (`U+0065`) and an acute accent (`U+0301`)

Normalization **ensures two strings that may use a different binary representation for their characters have the same binary value after normalization**

- Normalisation algorithms must be idempotent (applying it multiple times has the same effect as applying it once)
- Convert strings to canonical form so that it is standardised

There are two overall types of equivalence between characters:

1. _Canonical Equivalence:_ characters are assumed to have the same appearance and meaning when printed or displayed

2. _Compatibility Equivalence:_ is a weaker equivalence, in that two values may represent the same abstract character but can be displayed differently

There are 4 Normalization algorithms defined by the Unicode standard:

1. **NFD**: _Normalization Form Canonical Decomposition_: Characters are decomposed by canonical equivalence, and multiple combining characters are arranged in a specific order

2. **NFC**: _Normalization Form Canonical Composition_: Characters are decomposed and then recomposed by canonical equivalence

3. **NFKD**: _Normalization Form Compatibility Decomposition_: Characters are decomposed by compatibility, and multiple combining characters are arranged in a specific order

4. **NFKC**: _Normalization Form Compatibility Composition_: Characters are decomposed by compatibility, then recomposed by canonical equivalence
