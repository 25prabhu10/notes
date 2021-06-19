---
title: C#
description: C# is a general-purpose, multi-paradigm programming language encompassing static typing, lexically scoped, imperative, declarative, functional, generic, object-oriented, and component-oriented programming disciplines.
---

# C Sharp

C# is a general-purpose, multi-paradigm programming language encompassing static typing, lexically scoped, imperative, declarative, functional, generic, object-oriented, and component-oriented programming disciplines.

## Unified type system

- The fundamental building block in C# is an encapsulated unit of data and functions called a type. C# has a unified type system, where all types ultimately share a common base type. This means that all types, whether they represent business objects or are primitive types such as numbers, share the same basic functionality. For example, an instance of any type can be converted to a string by calling its ToString method.

### Interfaces

- An interface is like a class, except that it only describes members. The implementation for those members comes from types that implement the interface.

## Syntax

- Identifiers - `Main`, `name`, ...
- Keywords - `using`, `namespace`, `class`, ...
- Statements - `int i = 10`, `if (i > 5)`, ...
- Literals (data) - `52`, ...
- Punctuators - `{,};`, ...
- Operators - `+`, `*`, `==`, ...
- Comments - `//`, `/* ... */`

## Function Members

1. Properties:

   - Properties are function members that encapsulate a piece of an object’s state, such as a button’s color or a label’s text.

2. Methods

   - Are traditional functions.

3. Events

   - Events are function members that simplify acting on object state changes.

> Functions can be treated as values through the use of **delegates**, C# allows functions to be passed as values to and from other functions.

### Type-Safe

- C# is primarily a type-safe language, meaning that instances of types can interact only through protocols they define, thereby ensuring each type’s internal consistency. For instance, C# prevents you from interacting with a string type as though it were an integer type.

> NOTE: C# also allows parts of your code to be dynamically typed via the dynamic keyword. However, C# remains a predominantly statically typed language.

## Common Language Runtime (CLR)

- C# is one of several managed languages that get compiled into managed code. Managed code is represented in Intermediate Language or IL.
- The CLR converts the IL into the native code of the machine, such as X86 or X64, usually just prior to execution. This is referred to as Just-In-Time (JIT) compilation.

> NOTE: You can examine and disassemble the contents of an IL assembly with Microsoft’s ildasm tool. And with tools such as ILSpy, dotPeek (JetBrains), or Reflector (Red Gate), you can go further and decompile the IL to C#. Because IL is higher-level than native machine code, the decompiler can do quite a good job of reconstructing the original C#.

## Data Types

### Integers

- Numeric literals in C# 7 can include underscores to improve readability. These are called digit separators and are ignored by the compiler:

  ```csharp
  int million = 1_000_000;
  ```

- Binary literals can be specified with the 0b prefix:

  ```csharp
  var b = 0b1010_1011_1100_1101_1110_1111;
  ```

- C# 7 makes it easier to call methods that contain out parameters. First, you can now declare out variables on the fly:

  ```csharp
  bool successful = int.TryParse ("123", out int result);
  Console.WriteLine (result);
  ```

- And when calling a method with multiple out parameters, you can discard ones you’re uninterested in with the underscore character:

  ```csharp
  SomeBigMethod (out _, out _, out _, out int x, out _, out _, out _);
  Console.WriteLine (x);
  ```
