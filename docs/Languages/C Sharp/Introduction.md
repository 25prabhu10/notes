---
title: C Sharp and ASP.NET Core
description: C# is a general-purpose programming language and ASP.NET Core is a free and open-source web framework.
---

# C Sharp and ASP.NET Core

## Overview

**C#** is a general-purpose, type-safe, object-oriented programming language.

## Object Orientated Paradigm

### Encapsulation

- Encapsulation means creating a boundary around an object, to separate its external (public) behavior from its internal (private) implementation details.

## Class

- **Methods** are what an _object_ **does** (object's behavior). **Fields** are what the _object_ **knows**.

  > _Objects_ are stored in computer's memory in **heap**.

- Class can be split up into different files by using **partial** keyword in the same _namespace_.

  File1.cs

  ```csharp
  namespace Pets {
      partial class Cat {
          public void Purr() {
              // statements
          }
      }
  }
  ```

  File2.cs

  ```csharp
  namespace Pets {
      partial class Cat {
          public void Meow() {
              // statements
          }
      }
  }
  ```

### static

- The **static** modifier makes an **item non-instantiable**.

- If **static** is applied to a **class** then that class **cannot be instantiated** using the _new_ keyword.

- If **static** is applied to a **var, method or property** of class then they can be **accessed without creating object** of the class, just use _className.propertyName_, _className.methodName_.

- **static class** [^task] must have **all** of it's **methods** to be **static** too.

  > _static method_ can only access other _static items_. and instance of a _non-static class_ cannot use its _static members_.

---

## Data Type

- int, long, float, double, decimal, char, string, byte, bool

### Variable

- Same as _java_, _c++_ etc.

### Type Casting

- Changing an expression from one data type to another.

  ```csharp
  decimal myDecimal = 10;
  int myInt = (int)myDecimal;
  ```

- When a big value is cast into smaller one, C# will automatically wrap the value around.

  ```csharp
  int myDecimal = 365;
  byte myInt = (byte)myDecimal;
  // myInt will become 109 instead of 365, as byte can only hold upto 256
  ```

  > Note: To get wrapped value. Open calculator, switch to Scientific mode, and calculate 365 _Mod_ 256

- **+** (plus) operator when used between a _string_ and any _other type_, it converts the **other type** to **string**.

---

## Loops

### for

- for loop is used when the number of **iterations** are **known**.

  ```csharp
  // initialization; condition; iteration
  for (int i = 0; i < length; i++) {
      // statements
  }
  ```

### While

- while loop is used when the number of **iterations** are **unknown**.

  ```csharp
  // check the condition first
  while (x > 5) {
      // statements
  }
  ```

### do-while

- do-while executes statements **at least once** and afterwards it behaves like _while_ loop.

  ```csharp
  // execute at least once
  do {
      // statements
  } while (x > 5); // now check condition
  ```

---

## Conditional

### if/else

- It is used to execute certain statements only when the **conditions** that are set up **true**.

  ```csharp
  // if someValue is 24 then execute statement-1 else execute statement-2
  if (someValue == 24){
      // statement-1
  } else {
      // statement-2
  }
  ```

  > Note: When **conditional operators** (<, ==,...) are used to test two _variables_ or _values_, it's called performing a **conditional test**.

[^task]: _Learn about static constructor_
