---
title: Lua
description: Lua is a powerful, efficient, lightweight, embeddable scripting language.
date: 2024-12-05
---

# Lua

Lua is a powerful, efficient, lightweight, embeddable scripting language. It supports procedural programming, object-oriented programming, functional programming, data-driven programming, and data description

It is elegant

- Lua uses "Mechanisms over Policies" i.e. it provides a small set of general mechanisms that can be used to implement a variety of policies.

## Syntax

```lua
-- This is a comment
--[[ This is a multi-line
     comment
-- ]]

print("Hello, World!")
```

## Data Types

```lua
local num = 42

local str = "Hello, World!"
local str2 = 'also works'
local multiline = [[
  This is a
  multi-line string
]]

local truth, lies = true, false

local nothing = nil
```

- Lua is dynamically typed
- Lua's only data structure is a table
  - It can be used as an array, maps, hash table, dictionary, collection, stack, queue, etc.

```lua
-- As a list ...
local list = {
  "first",
  2,
  false,
  function()
    return "Forth!"
  end,
}

print("Yup, 1-indexed:", list[1])
print("Fourth is 4 ... :", list[4]())

-- As a map ...
local t = {
  literal_key = "a string",
  ["an expression"] = "also works",
  [function() end] = true,
}

print("literal_key", t.literal_key)
print("an expression", t["an expression"])
print("a function", t[function() end])
```

- Thread and Userdata are also data types in Lua

### Tables

#### Metatables

```lua
local vector_mt = {}

vector_mt.__add = function(left, right)
  return setmetatable({ left[1] + right[1], left[2] + right[2] }, vector_mt)
end

local v1 = setmetatable({ 1, 2 }, vector_mt)
local v2 = setmetatable({ 3, 4 }, vector_mt)
local v3 = v1 + v2

print(v3[1], v3[2]) -- 4 6
print(v3 + v3) -- table: 0x7f8f3b402f90

local fib_mt = {
  __index = function(self, key)
    if key < 2 then
      return 1
    end
    -- update the table, to save the intermediate results
    self[key] = self[key - 2] + self[key - 1]
    -- return the result
    return self[key]
  end,
}

local fib = setmetatable({}, fib_mt)

print(fib[5]) -- 8
print(fib[50]) -- 20365011074

-- `__index` is a fallback for table lookups
-- `__add` is a fallback for the `+` operator
-- `__newindex(self, key, value)` is a fallback for table updates
-- `__call(self, ...)` is a fallback for function calls
```

## Functions

```lua
local function hello(name)
  print("Hello, ", name)
end

local hello = function(name)
  -- .. is string concatenation operator
  print("Hello, " .. name)
end

hello "Lua"
```

- Functions are first-class values in Lua

```lua
local higher_order = function(value)
  return function(another_value)
    return value + another_value
  end
end

local add_one = higher_order(1)
print(add_one(2)) -- 3
```

- Functions can return multiple values

```lua
local returns_four_values = function()
  return 1, 2, 3, 4
end

local first, second, last = returns_four_values()

print("first:", first)
print("second:", second)
print("last:", last)
-- the `4` is discarded here
-- `first` is 1, `second` is 2, `last` is 3
```

- Functions with only one argument with a string literal or a table can be called without parentheses

```lua
local print_hello = function(name)
  print("Hello, " .. name)
end

print_hello "Lua"

local setup = function(opts)
  if opts.default == nil then
    opts.default = 17
  end

  print(opts.default, opts.other)
end

setup { other = 42 }
setup { default = 42, other = false }
```

- Colon syntax is used to define methods

```lua
local mytable = {}

function mytable.something(self, ...) end

-- this is equivalent to the above
-- it's just a syntactic sugar
-- `self` is a reference to the table
-- `...` is a vararg
function mytable:anotherthing(...) end
```

## Control Structures

### Loops

- `for` loop

```lua
local favorite_accounts = { "3Blue1Brown", "Vsause", "MinutePhysics" }

for index = 1, #favorite_accounts do
  print(index, favorite_accounts[index])
end

for index, value in ipairs(favorite_accounts) do
  print(index, value)
end

local reading_scores = { Blue1Brown = 3, Vsause = 5, MinutePhysics = 1 }

for index = 1, #reading_scores do
  print(reading_scores[index])
end

-- Doesn't print anything - the "length" operator of tables only works for arrays

-- `pairs` is used to iterate over key-value pairs
for key, value in pairs(reading_scores) do
  print(key, value)
end
```

### Conditionals

- `if` statement

```lua
local function action(loves_coffee)
  if loves_coffee then
    print "Check out `ssh terminal.shop` - it's a great place to get coffee."
  else
    print "Check out `ssh terminal.shop` - it's a great place to get tea."
  end
end

-- "falsey": nil, false
action() -- Same as: action(nil)
action(false)

-- Everything else is "truthy"
action(true)
action(0)
action {}
```

- `if-else` statement

```lua
local function action(loves_coffee)
  if loves_coffee == nil then
    print "Check out `ssh terminal.shop` - it's a great place to get tea."
  elseif loves_coffee == false then
    print "Check out `ssh terminal.shop` - it's a great place to get tea."
  else
    print "Check out `ssh terminal.shop` - it's a great place to get coffee."
  end
end
```

## Modules

Modules are a way to organize code in Lua. They are just tables with functions and variables.

- There isn't anything special about modules
- Modules are just files that return a table

```lua
-- foo.lua
local M = {}
M.cool_function = function()
  print "cool function"
end

return M

-- bar.lua
local foo = require("foo")
foo.cool_function()
```
