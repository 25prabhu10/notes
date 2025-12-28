---
title: JSON
description: JavaScript Object Notation
---

# JSON

[JSON](https://www.json.org) (JavaScript Object Notation) is a lightweight data interchange format that is easy for humans to read and write, and easy for machines to parse and generate. It is based on a subset of the JavaScript programming language (1999 version)

- Language-independent data format

## JSON Syntax

JSON is built on two structures:

1. A collection of name/value pairs (often called an _object_, record, struct, dictionary, hash table, keyed list, or associative array)
2. An ordered list of values (often called an _array_, vector, list, or sequence)

_Example:_ a JSON object representing a person

- `name`, `age`, `isStudent`, `courses`, `address`, and `phoneNumbers` are the keys
- The corresponding values are of different data types

```json
{
  "name": "John",
  "age": 30,
  "isStudent": false,
  "courses": ["Math", "Science", "History"],
  "address": {
    "street": "123 Main St",
    "city": "New York",
    "zip": "10001"
  },
  "phoneNumbers": null
}
```

### Data Types

JSON supports the following data types as values:

- String (enclosed in double quotes)
- Number (integer or floating-point)
- Object (enclosed in curly braces `{}`)
- Array (enclosed in square brackets `[]`)
- Boolean (`true` or `false`)
- `null`

For keys in JSON objects, **only strings are allowed**

### Syntax Rules

- Data is represented in name/value pairs
- Objects are enclosed in curly braces (`{}`) and arrays in square brackets (`[]`)
- Name and value are separated by a colon (`:`)
- Each name/value pair is separated by a comma (`,`), except for the last pair (trailing commas are not allowed)
- Strings must be enclosed in double quotes (`"`), single quotes are not allowed
- Whitespace (spaces, tabs, newlines) can be added for readability but is ignored
- JSON is case-sensitive (e.g., `true` is different from `True`)
- Comments are not allowed in JSON
- Keys must be unique within an object
- Numbers cannot have leading zeros (e.g., `01` is invalid)
- Escape special characters in strings using a backslash (`\`)

```json
{
  "quote": "He said, \"Hello, World!\"",
  "backslash": "This is a backslash: \\",
  "newline": "First line.\nSecond line.",
  "unicode": "Unicode character: \u263A"
}
```

## Common Uses

- Data interchange between web applications and servers
- Configuration files (e.g., `package.json`, `tsconfig.json`)
- Storing structured data in NoSQL databases (e.g., MongoDB)
- APIs (e.g., RESTful APIs often use JSON for request and response payloads)

## Parsing and Generating JSON

Most programming languages provide built-in libraries or modules to parse JSON strings into native data structures and to generate JSON strings from native data structures

### `jq`

[`jq`](https://jqlang.org/) (2012) is a lightweight and flexible command-line JSON processor. It allows you to parse, filter, and transform JSON data using a simple and powerful query language

- It is also a **domain-specific language** designed specifically for working with JSON data

Usage example:

```bash
# parse and pretty-print a JSON file
jq '.' data.json

# pipe JSON data to jq
curl 'https://api.github.com/repos/jqlang/jq/commits?per_page=5' | jq '.'

# filter specific fields
curl 'https://api.github.com/repos/jqlang/jq/commits?per_page=5' | jq '.[].commit.author.name'

# transform JSON data
curl 'https://api.github.com/repos/jqlang/jq/commits?per_page=5' | jq '.[] | {author: .commit.author.name, message: .commit.message}'

# more complex queries
curl 'https://api.github.com/repos/jqlang/jq/commits?per_page=5' | jq '[.[] | select(.commit.author.name == "bot")]'

# remove quotes from strings
echo '"Hello, World!"' | jq -r '.'
```

Options:

- `-r/--raw-output`: Output raw strings, not JSON-encoded strings
- `-c/--compact-output`: Output JSON in compact form (no extra whitespace)
- `-s/--slurp`: Read all inputs into an array and process them as a single JSON array
- `-f/--from-file [file]`: Read the jq program from the specified file
- `--arg name value`: Set a variable `$name` to `value`
- `-e/--exit-status`: Set the exit status based on the output (0 if the output is non-empty, 1 otherwise)

Operators and functions:

- `length`: Get the length of an array or string
- `keys`: Get the keys of an object as an array
- `map(f)`: Apply function `f` to each element of an array
- `select(f)`: Filter elements of an array based on the predicate function `f`
- `del(f)`: Delete the field or element specified by `f`
- `has(key)`: Check if an object has the specified key
- `sort_by(f)`: Sort an array based on the value of function `f`

[gojq](https://github.com/itchyny/gojq), [yq](https://github.com/mikefarah/yq) (Go), [jaq](https://github.com/01mf02/jaq) (Rust), [jqjq](https://github.com/wader/jqjq) are ports of `jq`. [gron](https://github.com/tomnomnom/gron) is another tool for working with JSON data

### `fx`

[`fx`](https://github.com/antonmedv/fx) is a command-line JSON viewer and processor written in Go. It provides an interactive interface for exploring and manipulating JSON data
