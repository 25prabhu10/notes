---
title: C
description: A general-purpose, procedural computer programming language
date: 2022-11-21
---

# C

C is a general-purpose, procedural computer programming language

- Created by [Dennis MacAlistair Ritchie](https://en.wikipedia.org/wiki/Dennis_Ritchie) ([his site](https://www.bell-labs.com/usr/dmr/www/)) and [Kenneth Lane Thompson](https://en.wikipedia.org/wiki/Ken_Thompson)

- C is a **strongly-typed, weakly checked** language

> "C is not a big language, and it is not well served by a big book." - Brian W. Kernighan, Dennis M. Ritchie

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

```text
Source code (.c) file
      |
      v
Pre-processor <-------- Header files
      |
      v
Compiler
      |
      .--------------.
                     |
                     v
          Assembly code (.s) file
                     |
      .--------------.
      |
      v
Assembler
      |
      .--------------.
                     |
                     v
          Object code (.o) file
                     |
      .--------------.
      |
      v
Linker  <-------- Libraries
      |
      v
Executable file
```

1. **Pre-processor**:

   - _Flag:_ `-E` to Pre-process output to `stdout`
   - Strip out comments
   - Anything that starts with pound sign, or "octothorpe", (`#`) is something the preprocessor operates on
   - `#include`: This C Preprocessor tells compiler to pull the contents of another file and insert it into the code right there
   - `#define`: This C Preprocessor tells compiler to replace all instances of a certain string with another string
   - Replaces all the _macros_ with the actual code
   - `<stdio.h>`: It is known as a _header_ file (they don't get compiled?)
   - TODO: Check if source files can be generated like `hello.i`

2. **Compiler**: Compiler produce **assembly code**, machine code, or whatever anything based on options

   - _Flag:_ `-S` to generate assembly code
   - `.s` file is an assembly file or Intermediate Representation (IR) code
   - Solution Configuration: Rules and configurations to build the project
   - Solution Platforms: Platform that is being targeted

   - Only C/C++ files are complied not Header files
   - Every C/C++ file is complied individually into a respective Object file

   - Liker: Stitches all these Object file into an executable file
   - Compiler compiles a C++ file if it only contains function declaration without and definition and is used inside that file.
   - C++ files are called Translation Units (Files have no meaning to C++ Compiler)

3. **Assembler**: Translate assembly code to object file

   - _Flag:_ `-c` to compile only
   - `.o` file is an object file
   - It is not an executable file
   - It is the code in machine language (binary) that the computer can understand

4. **Linker**: Combines object files into an executable file

   - _Flag:_ `-o` to specify output file name
   - Linking all the source files together, that is all the other object codes in the project.
   - Linking function calls with their definitions. The linker knows where to look for the function definitions in the static libraries or dynamic libraries

- Running `gcc` or `clang` without any flags will compile and link the code and produce an executable file (`a.out`)
- Use the [Compiler flag](#compiler-flags) `-save-temps` to save temporary files (like `.i`, `.s`, `.o`)
- Some compilers like `clang` produce an intermediate representation (IR) ("pseudo-assembly") code before the assembly code (file extension: `.ll`)

  - To generate the IR code, use the flag `-emit-llvm` like `clang -emit-llvm -S hello.c`

### Example

Let's say we are writing a add program, which is split into two files:

- `main.c`: Contains the `main` function and uses methods from `add.c`
- `add.c`: Contains the `add` function

- Create `add.c` and write the `add` function:

  ```c
  // add.c
  int add(int a, int b)
  {
      return a + b;
  }
  ```

- Compile the add file to object file:

  ```bash
  gcc -c add.c

  # output: add.o
  ```

- Now, create `main.c` and use the add function in the main file:

  ```c
  // main.c
  #include <stdio.h>

  int main()
  {
      printf("Sum: %d\n", add(10, 20));
      return 0;
  }
  ```

- Compile the main file to object file:

  ```bash
  gcc -c main.c

  # output:
  # ./main.c:6:25: error: implicit declaration of function ‘add’
  ```

- The compiler is not able to find the `add` function because it is in a different file, so we need let the compiler know about the `add` function by defining the function prototype in the main file:

  ```c
  // main.c
  #include <stdio.h>

  int add(int a, int b);

  int main()
  {
      printf("Sum: %d\n", add(10, 20));
      return 0;
  }
  ```

- Compile the main file again:

  ```bash
  gcc -c main.c

  # output: main.o
  ```

- Create the executable file:

  ```bash
  gcc -o main main.o

  # output:
  # main.c:(.text+0x1a): undefined reference to `add'
  ```

- The linker is not able to find the `add` function, so we need to link the `add.o` file with the `main.o` file:

  ```bash
  gcc -o main main.o add.o

  # output: main
  ```

- We have successfully compiled and linked the program. Now, run the executable file:

  ```bash
  ./main

  # output: Sum: 30
  ```

In the above example we added the function prototype in the main file which helps the compiler to know about the `add` function. But if need to use the `add` function in multiple files, then we have to write the function prototype in all the files. To avoid this, we can create a [header file](#headers-and-namspaces) and include it in all the files:

- Create a header file `add.h` and write the function prototype:

  ```c
  // add.h
  int add(int a, int b);
  ```

- Include the header file in the main file, or any other file where you want to use the `add` function:

  ```c
  // main.c
  #include <stdio.h>
  #include "add.h"

  int main()
  {
      printf("Sum: %d\n", add(10, 20));
      return 0;
  }
  ```

We can represent the dependencies between the files in a diagram called a **dependency graph**

## Headers and Namespaces

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

_"Include hell"_ is a term used to describe a situation where a project has a large number of dependencies, and each dependency has its own dependencies, and so on. This can lead to a situation where a single source file can include hundreds of header files

Dynamic type using `auto`

Maps are like JavaScript objects.

### Unity Build

Unity build is a technique where you include all your source files into a single file and compile that file. This can speed up the compilation process because the compiler can see all the code at once and optimize it better

It is also known as a "single compilation unit" or "jumbo build"

```c
// unity.c
#include "file1.c"
#include "file2.c"
#include "file3.c"
```

### Address Sanitizer (ASAN)

ASAN is a runtime memory error detector for C/C++ programs. It finds:

- Use after free (dangling pointer dereference)
- Heap buffer overflow
- Stack buffer overflow
- Global buffer overflow
- Use after return
- Use after scope
- Initialization order bugs
- Memory leaks

[AddressSanitizer](https://clang.llvm.org/docs/AddressSanitizer.html)

### Runtime Bounds Checking

Checks for buffer overflows and underflows at runtime

```bash
gcc -o test test.c -fsanitize=address -fsanitize=bounds
```

### Compiler Flags

Compiler flags are used to specify the behaviour of the compiler and the output that is generated

[Common Compiler Flags](https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html):

- `-std=c99`: Use the C99 standard

  - `gnu17`: default in GCC and Clang

- `-o`: Output file name
- `-E`: Pre-process output to `stdout`
- `-S`: Generate assembly code
- `-c`: Generate object file
- `-l`: Link with library (like `-l m` for `math.h` library)
- `-g`: Debugging information
- `-v`: Display the programs invoked by the compiler
- `-Wall`: Enable all warnings
- `-Werror`: Treat warnings as errors
- `-Wextra`: Enable extra warnings
- `-fsanitize=address`: [Address Sanitizer](#address-sanitizer-asan)
- `-Wdocumentation`: Warn about issues in documentation comments
- `-pedantic`: Issue all warnings demanded by strict ISO C and ISO C++
- `-O0`: No optimization (default)
- `-O1`: Optimize
- `-O2`: More optimization
- `-O3`: Even more optimization
- `-O4`: All optimization
- `-march=native`: Optimize for the current machine
- `-ffast-math`: Assume no NaNs or Infs

- `--save-temps`: Save temporary files (like `.i`, `.s`, `.o`)

## Data Types

The size of the data types is compiler dependent especially before C99 standard

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

## Versions

1. 1972: First release
2. 1978: K&R C
3. 1989: C89 (ANSI C)

   - Most of the C code written today is based on the ANSI C standard
   - Almost every C compiler available today is ANSI C compliant
   - Every platform/target
   - Can be compiled with a C++ compiler (with no or minimal changes)

4. 1999: C99

   - Added several new features to the C language
   - Standardized `//` comments
   - Local variable declarations:

   ```c
   // C89
   int main(void) {
     // All variables must be declared at the beginning of the block
     int i;
     for (i = 0; i < 10; i++) {
       printf("%d", i);
     }
     // i is still in scope here
   }


   // C99
   int main(void) {
     for (int i = 0; i < 10; i++) {
       printf("%d", i);
     }
     // i is not in scope here
   }
   ```

   - Initializing structure members:

   ```c
   typedef struct {
     int id;
     int age;
     char* name;
   } User;

   // C89
   // Order of initialization must match the order of the structure members
   // You can't skip any member
   User rick = {
     557,
     30,
     "Rick"
   };

   // C99: Designated initializers
   // You can initialize the structure members in any order
   // You can skip any member
   User rick = {
     .name = "Rick",
     .id = 557,
     .age = 30
   };
   ```

   - Better data types for fixed-width integers using `stdint.h`:

     - Like size of `int` is not fixed, it depends on the compiler/target (it should be at least 16 bits)

     | C89              | C99        | Windows   | Linux     |
     | ---------------- | ---------- | --------- | --------- |
     | `signed char`    | `int8_t`   |           |           |
     | `long int`       |            | `int32_t` | `int64_t` |
     | `long long`      | `int64_t`  |           |           |
     | `unsigned short` | `uint16_t` |           |           |
     | `char`           | Any size   |           |           |

     - `int8_t`, `int16_t`, `int32_t`, `int64_t`, `uint8_t`, `uint16_t`, `uint32_t`, `uint64_t`
     - `uintptr_t` ensures that the variable is large enough to hold a pointer
     - Constants like `INT32_MAX`

   - Compound literals:

     - A compound literal is an unnamed object that is created on the fly
     - It is a way to create an object of a structure or array type without giving it a name
     - It is useful when you need to pass a structure

   ```c
   // C89
   Point point = {1, 2};
   draw_point(point);

   // C99
   draw_point((Point){1, 2});
   ```

5. 2011: C11
6. 2018: C17
7. 2024: C23

[Modern C Features](https://github.com/AnthonyCalandra/modern-c-features)

## Code Styles

Comments will be completely ignored by the compiler:

```c
/* hello world program
 * multi-line comments
 */

//  single line comment
```

Using `clang-format`, you can format your code:

```bash
clang-format -style=llvm -dump-config > .clang-format
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
