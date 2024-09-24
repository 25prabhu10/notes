---
title: C
description: A general-purpose, procedural computer programming language.
date: 2022-11-21
lastmod: 2024-09-06
---

# C

C is a general-purpose, procedural computer programming language

- Created by [Dennis MacAlistair Ritchie](https://en.wikipedia.org/wiki/Dennis_Ritchie) ([his site](https://www.bell-labs.com/usr/dmr/www/)) and [Kenneth Lane Thompson](https://en.wikipedia.org/wiki/Ken_Thompson)

- C is a **strongly-typed, weakly checked** language

> C is not a big language, and it is not well served by a big book.
>
> -Brian W. Kernighan, Dennis M. Ritchie

## Hello, World

This is the canonical example of a C program:

```c
// hello.c

#include <stdio.h>

int main(void) {
    printf("Hello, World!");
}
```

- Build it:

```bash
gcc -o hello hello.c
# or
clang -o hello hello.c

# run the built file
./hello
```

## Compiling and Linking

C/C++ programs consist of **source files** and **headers**. Source files and headers are usually text files, but need not be

- Much of the text in C/C++ source and header files represents **declarations**

  - The declarations establish the existence of **entities** such as functions, namespaces, objects, templates, types, and values

- C/C++ has no specific rules about which declarations must go into source files and which must go into headers

- For a function, we typically:

  - `declare` it in a header, and...
  - `define` it in a corresponding source file

- However, for a function that's inline, `constexpr`, or `consteval`, then:
  - `define` it in a header file

Steps:

1. Pre-processor:

   - Anything that starts with pound sign, or "octothorpe", (`#`) is something the preprocessor operates on
   - `#include`: This C Preprocessor tells compiler to pull the contents of another file and insert it into the code right there
   - `<stdio.h>`: It is known as a _header_ file (they don't get compiled?)
   - TODO: Check if source files can be generated like `hello.i`

2. Compilation: Compiler produce assembly code, machine code, or whatever anything based on options

   - Solution Configuration: Rules and configurations to build the project
   - Solution Platforms: Platform that is being targeted

   - Only C/C++ files are complied not Header files
   - Every C/C++ file is complied individually into a respective Object file

   - Liker: Stitches all these Object file into an executable file
   - Compiler compiles a C++ file if it only contains function declaration without and definition and is used inside that file.
   - C++ files are called Translation Units (Files have no meaning to C++ Compiler)

   - Use `-E` to Pre-process output

3.

Headers and Namespaces:

- Pre-processor statements:

  - `#pragma once`: Include only once

- Namespace:

  ```cpp
  // sum.h
  #pragma once

  namespace customSum {
      int sum(int a, int b);
  }

  // sum.cpp
  namespace customSum {
      int sum(int a, int b)
      {
        return a + b;
      }
  }


  // Main file
  #include "sum.h"

  int main()
  {
      cout << customSum::sum(10, 20);

      return 0;
  }
  ```

Dynamic type using `auto`

Maps are like JavaScript objects.

## Data Types

### Arrays

_Definition:_ Contiguous area of memory consisting of equal-size elements

- Declared with size inside square brackets `[]`

- It can be declared without size, but in this case it must be initialized with items. The size of the array will be equal to the number of items

- If number of items are less than the declared size of an array, the rest of the places will be filled with `0`

- If an array is declared and never initialized then it will contain garbage values

_Example:_

```c
#include <stdio.h>

int main()
{
    int A[5] = {1, 2, 3, 4, 5};
    int B[] = {1, 2, 3};        // SIZE 3
    int C[5] = {1, 2, 3};       // {1,2,3,0,0}
    int D[2];                   // {3213, 234324}

    for (int i = 0; i < 5; i++)
    {
        printf("%d\n", A[i]);
    }
    printf("Completed");

    return 0;
}
```

## Code Styles

Comments will be completely ignored by the compiler:

```c
/* hello world program
 * multi-line comments
 */

//  single line comment
```

Different styles of writing C code:

```c
// Allman
while (x == y)
{
  func1();
  func2();
}

// Kernighan & Ritchie
while (x == y) {
  func1();
  func2();
}

// GNU
while (x == y)
  {
    func1 ();
    func2 ();
  }

// Whitesmiths
while (x == y)
    {
    func1();
    func2();
    }

// Horstmann
while (x == y)
{
  func1();
  func2();
}

// Haskell style
while (x == y)
  { func1()
  ; func2()
  ;
  }

// Ratliff style
while (x == y) {
    func1();
    func2();
    }

// Lisp style
while (x == y)
  { func1();
    func2(); }
```

## Memory Leaks

```c
#include <stdlib.h>
#include <string.h>


```

## References

Documentation: If you're on a Unix system then run `man 3 printf`

- [C Reference Manual](https://www.bell-labs.com/usr/dmr/www/cman.pdf), that came with 6th Edition Unix (May 1975)

- [C Programming for Everybody (CC4E)](https://www.cc4e.com/book/toc.md)

- [The C Programming Language, Second Edition (og)](https://s3-us-west-2.amazonaws.com/belllabs-microsite-dritchie/cbook/index.html)

  - TODO: Read "The C Programming Language", Second Edition - 1988

- [The C Programming Language, Second Edition (new)](https://www.cs.princeton.edu/~bwk/cbook.html)

- [Beej's Guide to C Programming](https://beej.us/guide/bgc/html/split/index.html)

  - [Beej's Examples](https://beej.us/guide/bgclr/source/)

- [C - book](https://flaviocopes.com/book/c/)

- [International Obfuscated C Code Contest](https://www.ioccc.org/): a wonderful competition wherein the entrants attempt to write the most unreadable C code possible, with often surprising results

  ```c
  // one of the entries in the 2001
  E((ck?main((z?(stat(M,&t)?P+=a+'{'?0:3:
  execv(M,k),a=G,i=P,y=G&255,
  sprintf(Q,y/'@'-3?A(*L(V(%d+%d)+%d,0)
  ```
