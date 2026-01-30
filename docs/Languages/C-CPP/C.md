---
title: C
description: A general-purpose, procedural computer programming language
---

# C

C is a general-purpose, procedural computer programming language

- Created by [Dennis MacAlistair Ritchie](https://en.wikipedia.org/wiki/Dennis_Ritchie) ([his site](https://www.bell-labs.com/usr/dmr/www/)) and [Kenneth Lane Thompson](https://en.wikipedia.org/wiki/Ken_Thompson) at Bell Labs in 1972

- C is a **strongly-typed, weakly checked** language

> "C is not a big language, and it is not well served by a big book." - Brian W. Kernighan, Dennis M. Ritchie

## Hello, World

1. This is the canonical example of a C program:

   ```c
   // hello.c (file name that ends with .c extension)
   #include <stdio.h>

   int main(void) {
       printf("Hello, World!");
   }
   ```

2. Compile the program using `gcc` or `clang`:

   ```bash
   gcc -o hello hello.c
   # or
   clang -o hello hello.c
   ```

3. Run the program:

   ```bash
   ./hello
   ```

> [!NOTE]
> If you get an error like `: permission denied: ./hello` in Linux/Unix, then run `chmod +x hello` to make the file executable

## Syntax of C

The syntax of C is based on the syntax of the B language, which was developed by Ken Thompson in 1970 at Bell Labs. B was a simplified version of the BCPL language developed by Martin Richards in 1966. BCPL was a typeless language, but B introduced types

- C is a case-sensitive language (`Play`, `play`, and `PLAY` are different)

We will follow the [C99](#versions) standard in this guide

### Comments

Comments will be completely ignored by the compiler:

```c
/* hello world program
 * multi-line comments
 */

//  single line comment (standard since C99)
```

### Tokens

A C program consists of various tokens and a token is either a keyword, an identifier, a constant, a string literal, or a symbol

- Tokens are the building blocks of a C program

Types of tokens:

1. **Punctuators**: Punctuators are symbols that have a special meaning in C (like `;`, `{`, `}`, `(`, `)`, etc.)

2. **[Keywords](#reserved-words-keywords)**: Keywords are reserved words that have special meaning in C and cannot be used as identifiers (variable names, function names, etc.)

3. **Operators**: Operators are symbols that perform operations on operands (like `+`, `-`, `*`, `/`, `=`, etc.)

   Depending on the number of operands that an operator can act upon, operators can be classified as follows:
   - **Unary Operators**: Operators that act upon a single operand (like `++`, `--`, `+`, `-`, `!`, etc.)
   - **Binary Operators**: Operators that act upon two operands (like `+`, `-`, `*`, `/`, `%`, `==`, `!=`, `&&`, `||`, etc.)
   - **Ternary Operators**: Operators that act upon three operands (like `? :`)

4. **Identifiers**: Identifiers are names given to various program elements like variables, functions, arrays, etc...
   - An identifier can contain letters, digits, and underscores
   - An identifier must start with a letter (upper-case or lowercase) or an underscore (`_`)
   - An identifier cannot contain spaces or special characters
   - An identifier cannot be a keyword (reserved word)
   - Avoid using underscores (`_`) at the beginning of an identifier as they are reserved for the implementation (compiler, standard library, etc.)

   ```c
   // valid identifiers
   first_name, last_name, age, _salary, _1st_name

   // invalid identifiers
   1st_name, first name, first-name, first@name
   ```

5. **Constants**: Constants are fixed values that do not change during the execution of a program
   - Constants can be of various types like integer constants, floating-point constants, character constants, string constants, etc...

6. **Strings**: Strings are sequences of characters enclosed in double quotes (`" "`) or single quotes (`' '`)
   - Strings are used to store text data

   ```c
   char name[] = "John";
                // ^
                // |
                // string literal
   ```

### Reserved Words (Keywords)

Reserved words in C cannot be used as identifiers (variable names, function names, etc.)

- There are 32 keywords in C

```text
auto        double  int         struct
break       else    long        switch
case        enum    register    typedef
char        extern  return      union
const       float   short       unsigned
continue    for     signed      void
default     goto    sizeof      volatile
do          if      static      while
```

Description of some commonly used keywords:

- `auto`: It is the default storage class variable. It is rarely used in modern C programming

  ```c
  #include <stdio.h>

  void print_value() {
    auto int a = 10;
    printf("Value of a is %d\n", a);
  }
  ```

- `break` and `continue`: `break` is used to exit from a loop, and `continue` is used to skip the current iteration of a loop

- `goto`: Used to transfer control to a labelled statement in a function

  ```c
  #include <stdio.h>

  void print_value() {
    int a = 10;
    if (a == 10) {
      goto print_value;
    }
    printf("Value of a is not 10\n");

  // label
  print_value:
    printf("Value of a is 10\n");
  }
  ```

- `switch`, `case`, and `default`: `switch` is used to select one of many code blocks to be executed, `case` is used to match a value with a label, and `default` is used to specify some code to run if there is no case match

- `char`, `int`, `short`, `long`, `signed`, `unsinged`, `float`, `double`, `void`: These are data types in C

- `struct`, `union`, `enum`: These are user-defined data types in C

- `static`: Used to declare a static variable

- `const`: Used to declare a constant variable

- `extern`: Used to declare a global variable or function in another file

  ```c
  extern int a;
  ```

- `register`: Register variables tell the compiler to store variables in the CPU register instead of memory
  - Frequently used variables are kept in the CPU registers for faster access

  ```c
  register int a = 10;
  ```

- `return`: Used to return a value from a function

- `sizeof`: Used to get the size of a variable

  ```c
  int a = 10;
  printf("Size of a is %d\n", sizeof(a));
  ```

- `for`, `while`, and `do`: These are loop control statements in C

- `if`, `else`: These are conditional statements in C

- `typedef`: Used to create a new data-type, helps in making the code more readable

  ```c
  typedef int marks;
  marks m1, m2;
  ```

- `volatile`: Used to tell the compiler that a variable's value may change at any time without any action being taken by the code
  - Creates volatile objects
  - Objects which are declared volatile are omitted from optimization as their values can be changed by code outside the scope of the current code at any point in time

  ```c
  volatile int a = 10;
  ```

### Structure of the Code

A C program consists of [functions](#functions) and variables, and every C program must have a **`main()` function**, which defines the main entry point for the program that's executed in a _hosted_ environment when the program is invoked from the command line or from another program

- The `main()` function **should only have variable declarations and function calls** as a best practice

- There are two types environments for C programs:
  - **Hosted environment**: Programs that run under an operating system (like Windows, Linux, macOS, etc.)
  - **Freestanding environment**: Programs that run without an operating system (like embedded systems, microcontrollers, etc.)

_Example:_

```c
/* comment
 *
 * Converts distances from miles to kilometres
 */

#include <stdio.h> // preprocessor directive: printf, scanf definitions
//         ^ static header file

#define KMS_PER_MILE 1.609 // preprocessor directive: conversion constant
// ^ constant macro
//           ^ constant identifier

int        // return type
main(void) // function name
{
  double miles, // distance in miles
  // ^ data type
      kms;      // equivalent distance in kilometres
  //   ^ variable identifier

  // Get the distance in miles
  printf("Enter the distance in miles> ");
  scanf("%lf", &miles);
  // ^ standard identifier

  // Convert the distance to kilometers
  kms = KMS_PER_MILE * miles;
  //  ^              ^ operators

  // Display the distance in kilometers
  printf("That equals %f kilometers.\n", kms);

  return (0); // return statement
  // ^ reserved word
}
```

### Scope

Scope refers to the visibility and lifetime of variables and functions in different parts of a program

Types of scope in C:

1. **Block Scope**: If a declaration happens inside a block (enclosed by `{}`) or the parameter list, they are only accessible within that block

   ```c
   #include <stdio.h>

   void function() {
     int x = 10; // x has block scope
     {
       int y = 20;        // y has block scope
       printf("%d\n", x); // valid
       printf("%d\n", y); // valid
     }
     printf("%d\n", y); // invalid, y is out of scope
   }
   ```

2. **Function Scope**: If a declaration happens inside a function's block (enclosed by `{}`), they are only accessible within that function
   - A _label_ only has function scope, where a label is an identifier followed by a colon (`:`) and identify a statement in a function to which control may be transferred. They are used in conjunction with `goto` statements

   ```c
   void function() {
     int x = 10; // x has function scope
     printf("%d\n", x); // valid
   }
   printf("%d\n", x); // invalid, x is out of scope


   void anotherFunction() {
   start:               // label has function scope
     printf("Hello\n");
   goto start;         // valid
   }
   ```

3. **File Scope**: Variables and functions declared outside of any block or parameter list have _file scope_, meaning they are accessible from the point of declaration to the end of the file

   ```c
   int globalVar = 100; // globalVar has file scope
   void function() {
     printf("%d\n", globalVar); // valid
   }
   ```

4. **Function Prototype Scope**: The scope of parameters in a function prototype is limited to the prototype itself

   ```c
   void function(int x); // x has function prototype scope

   void function(int x) {
     printf("%d\n", x); // valid
   }
   ```

Scopes can be _nested_, meaning that a block can be defined within another block, and the _inner_ block can access variables from the _outer_ block

- If a variable is declared in both the inner and outer blocks with the same name, the inner block's variable will _shadow_ the outer block's variable (_hiding_)

```c
#include <stdio.h>

int main() {
  int x = 10;           // outer block variable
  {
    int x = 20;         // inner block variable (shadows outer x)
    printf("%d\n", x);  // prints 20
  }
  printf("%d\n", x);    // prints 10
  return 0;
}
```

### Lifetime

Each object has a **lifetime** that determines how long the object exists in memory during the execution of a program

- Objects must not be referenced outside their lifetime

There are four storage durations are available:

1. `automatic`
2. [`static`](#static-variables)
3. `thread`: Objects that are local to a thread and exist for the lifetime of the thread
4. `allocated`: Objects created with dynamic memory allocation functions like `malloc`, `calloc`, `realloc`, and `free`

> [!NOTE]
> [Scope](#scope) and lifetime are entirely different concepts. Scope applies to identifiers, whereas lifetime applies to objects. The scope of an identifier is the code region where the object denoted by the identifier can be accessed by its name. The lifetime of an object is the time period for which the object exists

- Objects declared in _file scope_ have _static_ storage duration

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
.---------------.
| Pre-processor | <-------- Header files
.---------------.
      |
      | <-------- expanded code
      |
      v
.---------------.
| Compiler      |
.---------------.
      |
      | <-------- Assembly code (.s) file
      |
      v
.---------------.
| Assembler     |
.---------------.
      |
      | <-------- Object code (.o) file
      |
      v
.---------------.
| Linker        | <-------- Libraries
.---------------.
      |
      |
      v
Executable file
```

1. **Pre-processor**:

   _Flag:_ `-E` to Pre-process output to `stdout`
   - Strip out comments and expand macros
     - Replaces all the _macros_ with the actual code

   - Anything that starts with pound sign, or `octothorpe`, (`#`) is something the preprocessor operates on
   - `#include`: This C Preprocessor tells compiler to pull the contents of another file and insert it into the code right there (like `#include <stdio.h>`)
     - `<stdio.h>`: It is known as a _header_ file (they don't get compiled?)

   - `#define`: This C Preprocessor tells compiler to replace all instances of a certain string with another string
   - Conditional compilation: `#if`, `#ifdef`, `#ifndef`, `#else`, `#elif`, `#endif`

2. **Compiler**: Compiler produce **assembly code**, machine code, or whatever anything based on options

   _Flag:_ `-S` to generate assembly code
   - `.s` file is an assembly file or Intermediate Representation (IR) code
     - Solution Configuration: Rules and configurations to build the project
     - Solution Platforms: Platform that is being targeted

   - Only C files are complied not Header files
   - Every C file is complied individually into a respective Object file

   - Compiler compiles a C++ file if it only contains function declaration without and definition and is used inside that file

   - C++ files are called Translation Units (Files have no meaning to C++ Compiler)

   - `nm` tool can be used to see the symbols in the object file
   - `strings` tool can be used to see the printable strings in the object file

3. **Assembler**: Translate assembly code to object file

   _Flag:_ `-c` to compile only
   - `.o` file is an object file
   - It is not an executable file
   - It is the code in machine language (binary) that the computer can understand

4. **Linker**: Combines object files into an executable file

   _Flag:_ `-o` to specify output file name
   - Linking all the source files together, that is all the other object codes in the project
   - Linking function calls with their definitions. The linker knows where to look for the function definitions in the static libraries or dynamic libraries
   - It stitches all these Object file into an executable file

- Running `gcc` or `clang` without any flags will compile and link the code and produce an executable file (`a.out`)
- Use the [Compiler flag](#compiler-flags) `-save-temps` to save temporary files (like `.i`, `.s`, `.o`)
- Some compilers like `clang` produce an intermediate representation (IR) ("pseudo-assembly") code before the assembly code (file extension: `.ll`)
  - To generate the IR code, use the flag `-emit-llvm` like `clang -emit-llvm -S hello.c`

### Example Program

Let's say we are writing a add program, which is split into two files:

- `main.c`: Contains the `main` function and uses methods from `add.c`
- `add.c`: Contains the `add` function

- Create `add.c` and write the `add` function:

  ```c
  // add.c
  int add(int a, int b) {
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

  int main() {
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

  int main() {
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

In the above example we added the function prototype in the main file which helps the compiler to know about the `add` function. But if need to use the `add` function in multiple files, then we have to write the function prototype in all the files. To avoid this, we can create a [header file](#headers-and-preprocessor-directives) and include it in all the files:

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

  int main() {
    printf("Sum: %d\n", add(10, 20));
    return 0;
  }
  ```

We can represent the dependencies between the files in a diagram called a **dependency graph**

### Compiler Flags

Compiler flags are used to specify the behaviour of the compiler and the output that is generated

[Common Compiler Flags](https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html):

- `-std=c99`: Use the C99 standard, or `-std=c2x` for the C2x standard (latest that the compiler supports)
  - `gnu17`: default in GCC and Clang

- `-o`: Output file name
- `-E`: Pre-process output to `stdout`
- `-S`: Generate assembly code
- `-c`: Generate object file
- `-l`: Link with library (like `-l m` for `math.h` library)
- `-g`: [Debugging](#debugging) information to be generated
- `-v`: Display the programs invoked by the compiler
- `-Wall`: Enable all warnings
- `-Werror`: Treat warnings as errors
- `-Wextra`: Enable extra warnings
- `-fsanitize=address`: [Address Sanitiser](#address-sanitiser-asan)
- `-Wdocumentation`: Warn about issues in documentation comments
- `-pedantic`: Issue all warnings demanded by strict ISO C and ISO C++
- `-O0`: No optimization (default)
- `-O1`: Optimize
- `-O2`: More optimization
- `-O3`: Even more optimization
- `-march=native`: Optimize for the current machine
- `-ffast-math`: Assume no NaNs or Infs
- `--save-temps`: Save temporary files (like `.i`, `.s`, `.o`)

### Build Systems

If a project has multiple source files, then we can use a build system to automate the compilation and linking process, like `make`, `CMake`, `ninja`, `Meson`, `Bazel`, etc...

- [`Makefile`](../Makefile.md) is a file that contains rules to build the project using `make` command

## Headers and Preprocessor Directives

Directives are commands to the compiler that start with a `#` symbol and are processed before the actual compilation of the program

- `#include`: Includes a file in the program (like `#include <stdio.h>` for a standard library or `#include "file.h"` for a user-defined file)

- `#define`: Defines a macro (a name that represents a value)
  - It notifies the preprocessor to replace all instances of the identifier by the value

- Pre-processor statements:
  - `#pragma once`: Include the file only once in the compilation process
  - Header guards: `#ifndef`, `#define`, `#endif`

  ```c
  // sum.h
  #pragma once

  int sum(int a, int b);

  // or for older compilers
  #ifndef SUM_H
  #define SUM_H

  int sum(int a, int b);

  #endif
  ```

_"Include hell"_ is a term used to describe a situation where a project has a large number of dependencies, and each dependency has its own dependencies, and so on. This can lead to a situation where a single source file can include hundreds of header files

### Unity Build

Unity build is a technique where you include all your source files into a single file and compile that file. This can speed up the compilation process because the compiler can see all the code at once and optimize it better

It is also known as a "single compilation unit" or "jumbo build"

```c
// unity.c
#include "file1.c"
#include "file2.c"
#include "file3.c"
```

## Memory

Memory is a place where data can be stored and retrieved by the CPU

- Memory is divided into small units called _bits_ and a group of 8-bits is called _bytes_ (a group of 4-bits is called a _nibble_)
- **Each byte has a unique address** and can store a small amount of data
- _Word size_ is the number of bytes that a CPU can process at a time (like 4 bytes for 32-bit and 8 bytes for 64-bit)

Memory is divided into two types: **[Primary Memory](#primary-memory)** and **[Secondary Memory](#secondary-memory)**

### Primary Memory

Primary memory is also known as _main memory_ or _RAM_ (Random Access Memory) and is used to store data and instructions that are currently being used by the CPU

- Primary Memory is volatile, which means it loses its data when the power is turned off

Programs are loaded into the RAM when they are executed and are removed from the RAM when they are closed

- The operating system manages the memory and decides which programs to load into the RAM and which programs to remove from the RAM

There are two types of RAM: **Static RAM (SRAM)** and **Dynamic RAM (DRAM)**

- **SRAM** is faster and more expensive than DRAM and is used in cache memory
- **DRAM** is slower and cheaper than SRAM and is used in most computers

RAM can be divided into two segments:

- **Text Segment**: Contains the executable code of the program
- **Data Segment**: Contains the global and static variables of the program

Data Segment is further divided into four parts:

- **Initialized**
- **Uninitialized**
- **Heap**
- **Stack**

Initialized and Uninitialized are also known as **Static Memory**. Heap and Stack are also known as **Dynamic Memory**

```text
                      RAM

                   ^ .---------------. ^            ^
Higher addresses   | | Stack         | |            |
                   | .---------------. | Dynamic    |
                   | | Heap          | |            |
                   | |               | |            |
                   | |               | v            | Data
                   | .---------------. ^            |
                   | | Uninitialized | |            |
                   | .---------------. | Static     |
                   | | Initialized   | |            |
                   | .---------------. v            v
                   | |               |
                   | | Text          | <--- Executable code
Lower addresses    v  ---------------
```

#### Text Segment

The **text segment** (also known as the **code segment**) is where the compiled code of the program is stored

- It is usually read-only and is stored in the lower part of the memory
- It is shared among all the processes that are running the same program
- The size of the text segment is determined by the number of instructions and the complexity of the program
- Literals are stored in the text segment

#### Data Segment (Static Memory)

The **static memory** (also know as the **data segment**) is where the global and static variables are stored

- It is allocated at compile time
- Lifetime is the entire program runtime
- Allocated by compiler/linker

##### Initialized Data Segment

It stores the initialized global and static variables

- It is directly copied from the program binary to the memory
- It is Fixed in size
- It is read/write memory

```c
int a = 10; // Initialized global variable
static int b = 20; // Initialized static variable
```

##### Uninitialized Data Segment (BSS)

**Uninitialized** also know as **BSS** (_Block Started by Symbol_, named after an ancient assembler operator) stores the uninitialized global and static variables

- These variables are automatically initialized to zero at runtime by the operating system
- It is Fixed in size
- It is read/write memory
- The [`static`](#static-variables) keyword is used to declare static variables

```c
int c; // Uninitialized global variable
static int d; // Uninitialized static variable
```

_Example:_

```c
static int A = 10; // Initialized static global variable
static int B;      // Uninitialized static global variable

int C;      // Uninitialized global variable
int D = 20; // Initialized global variable

int main() {
  static int E = 30; // Initialized static variable
  int F;             // Uninitialized variable

  return 0;
}
```

```c
int g_count = 0; // stored in Static Memory

void increment() {
  int count = 10;
  count++;
  printf("Count is %d\n", count);
}

void s_increment() {
  static int count = 0; // stored in Static Memory
  count++;
  printf("Count is %d\n", count);
}

void g_increment() {
  g_count++;
  printf("Count is %d\n", g_count);
}

int main() {
  printf("\n\n");

  increment();
  increment();

  s_increment();
  s_increment();

  g_increment();
  g_increment();

  return 0;
}
```

- As we see in the above example, the `count` variable in the `increment` function is re-initialized to `0` every time the function is called, but the `count` variable in the `s_increment` function is not re-initialized to `0` every time the function is called because it is stored in static memory and is initialized only once

- Similarly, the `g_count` global variable is stored in static memory and is initialized only once

- Both the static `count` and global `g_count` variables mostly work in same manner, but global variables more readable and maintainable

Check the memory address of the variables using the `&` address-of-operator

- The memory address of the static variables and global variables are stored in the static memory as seen below, they start with the same memory address `0x5b44eb9010` except the local variable which has `0x7ffe5f228e44`

```c
#include <stdint.h>
#include <stdio.h>

static int static_global;
int non_static_global;

int main() {
  printf("\n\n");

  static int static_local;
  int non_static_local;

  printf("static_global: %p\n", &static_global);
  printf("non_static_global: %p\n", &non_static_global);
  printf("static_local: %p\n", &static_local);
  printf("non_static_local: %p\n", &non_static_local);

  return 0;
}

// static_global: 0x5b44eb901030
// non_static_global: 0x5b44eb90102c
// static_local: 0x5b44eb901034
// non_static_local: 0x7ffe5f228e44
```

##### Static Variables

`static` keyword is used to declare static variables

```c
// file: main.c
#include <stdint.h>
#include <stdio.h>

int very_important_number = 42;

// static int very_important_number = 42;

int incredible_function() { return very_important_number; }

int main() {
  printf("\n\n");

  printf("Incredible function returned: %d\n", incredible_function());

  return 0;
}

// file: add.c
#include <stdint.h>

int very_important_number = 42;

// static int very_important_number = 42;

int another_incredible_function() { return very_important_number; }

// output:
// /usr/bin/ld: build/main.o:(.bss+0x0): multiple definition of `__odr_asan.very_important_number'; build/add.o:(.bss+0x0): first defined here
// collect2: error: ld returned 1 exit status
```

- In the above example we have two files `main.c` and `add.c` which have the same global variable `very_important_number`
  - Compiling the files separately will not give any error but when we try to link the files we get an error `multiple definition of 'very_important_number'` because the global variable is defined in both files

- Making the global variable `static` in both files will solve the error, because the `static` keyword restricts the variable to the file scope and the variable is not visible outside the file

- We can mark the global variable as `extern` in one file and define it in another file

```c
// file: main.c
#include <stdint.h>

extern int very_important_number;

// file: add.c
#include <stdint.h>

int very_important_number = 42;
```

#### Dynamic Memory

Dynamic memory is memory that is allocated at runtime and is used to store data that is not known at compile time

##### Heap Memory

The **heap memory** is where the dynamic memory is allocated

- It is variable in size, it can grow or shrink as needed
- It is read/write memory
- It is slower than the stack memory
- The heap area begins at the end of the BSS segment and grows towards the larger addresses from there
- User has to manage the memory (allocate and deallocate)
- User has to avoid memory leaks and dangling pointers
- Used for dynamic memory allocation, like `malloc`, `calloc`, `realloc`, and `free`, which in turn may use the `brk` and `sbrk` system calls to adjust its size
- The heap segment is shared by all shared libraries and dynamically loaded modules in a process
- Data types like arrays, structures, and pointers are stored in the heap memory whose size is not known at compile time

```c
#include <stdlib.h>

int main() {
  int *A = (int *)malloc(sizeof(int)); // Allocate Heap memory

  *A = 10; // Store value

  free(A); // Deallocate memory

  return 0;
}
```

##### Stack Memory

The **stack memory** is where the local variables are stored and function calls are managed

- It is fixed in size
- It is read/write memory
- It is faster than the heap memory
- It is automatically managed by the operating system
- Each time a function is called, a **stack frame** is created to store local variables, function parameters, and return addresses
- It is used for static memory allocation, like arrays, structures, and pointers whose size is known at compile time
- Stack data is stored in a LIFO (Last In First Out) order
- The stack segment is generally located in the higher addresses of the memory and grows opposite to heap
- When a function is called, the local variables are pushed onto the stack, and when the function returns, the local variables are popped off the stack
- Stack pointer is used to keep track of the stack memory

```c
int add(int a, int b) {
  int c = a + b; // Local variable

  return c;
}

int main() {
  int x = 10; // Local variable
  int y = 20; // Local variable

  int z = add(x, y); // Local variable

  return 0;
}
```

### Secondary Memory

Secondary memory is also known as _auxiliary memory_ or _storage memory_ and is used to store data

### Alignment

Memory alignment refers to the way data is arranged and accessed in memory. It is important for performance and correctness of the program

An _alignment_ represents the number of bytes between successive addresses at which a given object can be allocated

- Most computer architectures require that data be aligned in memory according to its size
- For example, a 4-byte integer should be aligned on a 4-byte boundary (addresses that are multiples of 4), and an 8-byte double should be aligned on an 8-byte boundary (addresses that are multiples of 8)
- Misaligned data can lead to performance penalties and even crashes on some architectures

_Example:_ A misaligned [struct](#struct-structure) may hold less data than an aligned struct due to padding bytes added for alignment

```c
#include <stdint.h>
#include <stdio.h>

struct Misaligned {
  char c; // 1 byte
  int i;  // 4 bytes
};

struct Aligned {
  char c;          // 1 byte
  char padding[3]; // 3 bytes padding
  int i;           // 4 bytes
};

int main() {
  printf("Size of Misaligned: %zu\n", sizeof(struct Misaligned)); // 8 bytes (1 + 3 padding + 4)
  printf("Size of Aligned: %zu\n", sizeof(struct Aligned));       // 8 bytes (1 + 3 padding + 4)

  return 0;
}
```

Compilers automatically align data based on the architecture and data type, but we can also manually specify alignment using attributes or pragmas

- In `C11`, we can use the `_Alignas` (header `stdalign.h`) specifier to specify alignment and Alignments are represented as values of the type `size_t`

```c
#include <stdalign.h>
#include <stdio.h>

struct AlignedInt {
  _Alignas(16) int i; // Align to 16 bytes
};

int main() {
  printf("Alignment of AlignedInt: %zu\n", alignof(struct AlignedInt)); // 16 bytes

  return 0;
}

struct S {
  int i;
  double d;
  char c;
};

void func(void) {
  unsigned char bad_buff[sizeof(struct S)];
  _Alignas(struct S) unsigned char good_buff[sizeof(struct S)];

  struct S *bad_s_ptr = (struct S *)bad_buff;   // wrong pointer alignment
  struct S *good_s_ptr = (struct S *)good_buff; // correct pointer alignment
}
```

### Memory Leaks

```c
#include <stdlib.h>
#include <string.h>
```

### Memory Corruption

Memory corruption occurs when a program writes data outside the boundaries of allocated memory. Your program may overwrite important data structures, including control structures used by the memory manager

- This can lead to unpredictable behaviour, crashes, and security vulnerabilities

#### Address Sanitiser (ASAN)

ASAN is a runtime memory error detector for C/C++ programs. It finds:

- Use after free (dangling pointer dereference)
- Heap buffer overflow
- Stack buffer overflow
- Global buffer overflow
- Use after return
- Use after scope
- Initialization order bugs
- [Memory leaks](#memory-leaks)

Tools for detecting memory corruption:

- [google/sanitizers](https://github.com/google/sanitizers)
- [AddressSanitizer](https://clang.llvm.org/docs/AddressSanitizer.html) is a fast memory error detector

## Data Types

A _type_ defines a **set of possible values** and **a set of operations** that can be performed on those values

- C Standard (`ISO/IEC 9899:2018`): "region of data storage in the execution environment, the contents of which can represent values. When referenced, an object can be interpreted as having a particular type"
  - An _object_ is storage in which you can represent values
  - An _object_ is **some memory that holds a value of a given type**

- A _value_ is a **set of bits in memory interpreted according to a type**
- A _variable_ is a **named identifier** that refers to a value in memory
  - _Variables_ have a declared _type_ that tells you the kind of object its value represents

The number `1` is represented in IEEE 754 (the IEEE Standard for Floating-Point Arithmetic) by the bit pattern `0x3f800000` for a `float` (32-bit single precision) and by the bit pattern `0x3ff0000000000000` for a `double` (64-bit double precision). But if interpreted as an `int`, the bit pattern `0x3f800000` represents the integer value `1065353216`, and the bit pattern `0x3ff0000000000000` represents the integer value `4607182418800017408` instead of `1`

- A _declaration_ is a statement that **introduces an identifier (name)** and **describes its type**, be it a type or a function (describing its _signature_: return type, name, and parameters)
  - The compiler uses the declaration to determine how much memory to allocate for the identifier, how to interpret the bits stored there, and to check that the operations performed on the identifier are valid
  - It can be done multiple times
  - It can be done without _initialization_
  - It does not allocate memory

  > This thing exists somewhere

  ```c
  int a; // declaration: int is the type, a is the identifier
  char c; // declaration: char is the type, c is the identifier

  int add(int a, int b); // declaration: int is the return type,
                         // add is the identifier, int a, int b are the parameters
  ```

- A _definition_ actually instantiates/implements the identifier, the compiler asks memory manager to **set aside memory for that value or function**
  - It can be done only once
  - The function definition includes the function body

  > This thing exists here; make memory for it

  ```c
  int a = 10; // definition: int is the type, a is the identifier, 10 is the value
  char c = 'A'; // definition: char is the type, c is the identifier, 'A' is the value

  int add(int a, int b) { // definition: int is the return type,
                          // function body
     return a + b;        // add is the identifier, int a, int b are the parameters
  }
  ```

- An _initialization_ is a declaration with an initial value (definition + definition)
  - It can be done only once
  - It allocates memory and assigns a value

  > Here is the initial value for this thing

  ```c
  int a = 10; // initialization: int is the type, a is the identifier, 10 is the value
  char c = 'A'; // initialization: char is the type, c is the identifier, 'A' is the value
  ```

- A _constant_ is a value that cannot be changed
  - It is a _literal_ value
  - It is a _compile-time_ value

  ```c
  const int a = 10; // constant: int is the type, a is the identifier, 10 is the value

  #define PI 3.14 // constant: PI is the identifier, 3.14 is the value
  ```

- A _literal_ is a value that appears directly in the code
  - It is a _compile-time_ value

  ```c
  int a = 10; // 10 is a literal
  char c = 'A'; // 'A' is a literal
  ```

If a variable is declared but not initialized, then it will contain a _garbage value_ (whatever was in that memory location before)

- Compilers can initialize variables to zero, but it is not guaranteed

The **size of the data types is compiler dependent** especially before C99 standard, but after C99 standard there are fixed-width integer types in `stdint.h` such as `int8_t`, `int16_t`, etc...

> [!NOTE]
> If something is declared but not defined, then the linker doesn't know what to link references to and complains about a missing symbols. If you define something more than once, then the linker doesn't know which of the definitions to link references to and complains about duplicated symbols

Dynamic type using `auto`

Maps are like JavaScript objects

### Character

Character data types are used to store characters (letters, digits, symbols)

3 types of character data types in C:

1. `char`: Usually used to store a single character
2. `signed char`: Used to store a signed character
3. `unsigned char`: Used to store an unsigned character

Compiler will define char to have the same alignment, size, range, representation, and behaviour as either `signed char` or `unsigned char`. `char` is a distinct type from both and is incompatible

Object of type `char` must be able to represent the minimum set of characters required in the execution environment (known as _basic execution character set_), including upper- and lower-case letters, 10 digits, punctuation symbols, and control characters like newline (`\n`)

- `char` keyword is used to declare a character variable
- A `'` (single quote) is used to represent an ASCII character (like `'A'`, `'B'`, `'1'`, `'2'`, `'!'`, `'@'`, etc.)
- Numbers from `0` to `127` can also be stored in a `char` variable

```c
char letter = 'A';
char digit = '1';
char symbol = '@';
```

Due to its small size, it can store only a limited number of characters (like ASCII characters) and cannot store Unicode characters. To store Unicode characters, we can use `wchar_t` (wide character type):

```c
#include <wchar.h>

int main() {
  wchar_t str[] = L"Hello, 世界!";
  printf("The length of the wide string is: %zu\n", wcslen(str));

  return 0;
}
```

#### String Representation

In C, a string is represented as an array of characters terminated by a `null` character (`\0` ASCII value `0`)

- A string is stored in a contiguous memory location
- C doesn't have a built-in string data type

```c
char name[6] = {'J', 'o', 'h', 'n', '\0'};
char name[] = "John";
```

There are two ways to represent a string in C:

1. Using a character array:
   - A string is represented as an array of characters terminated by a `null` character (`\0` ASCII value `0`)

   ```c
   char name[6] = {'J', 'o', 'h', 'n', '\0'};
   char name[] = "John";
   ```

2. Using a character pointer:
   - A string is stored in a contiguous memory location

   ```c
   char *name = "John";
   ```

The difference between a character array and a character pointer is that a character array is a fixed-size memory location, whereas a character pointer is a variable-size memory location

### Integer

Integer data types are used to store whole numbers (positive, zero, and negative numbers)

Signed integer types include: `signed char`, `short int`, `int`, `long int`, and `long long int` (we can omit `int` and just write `short`, `long`, etc.)

For each signed integer type, there is corresponding unsigned integer type: `unsigned char`, `unsigned short int`, `unsigned int`, `unsigned long int`, and `unsigned long long int`. They can only represent zero and positive values

Compilers may implement integer types with different sizes and ranges based on the architecture and platform. `int` on a 32-bit system is typically 4 bytes (32 bits) and on a 64-bit system is typically 8 bytes (64 bits), but this is not guaranteed

Better data types for fixed-width integers using `stdint.h` (`C99` standard) or `inttypes.h`:

- Like size of `int` is not fixed, it depends on the compiler/target (it should be at least 16 bits)

  | `C89`            | `C99`      | Windows   | Linux     |
  | ---------------- | ---------- | --------- | --------- |
  | `signed char`    | `int8_t`   |           |           |
  | `long int`       |            | `int32_t` | `int64_t` |
  | `long long`      | `int64_t`  |           |           |
  | `unsigned short` | `uint16_t` |           |           |
  | `char`           | Any size   |           |           |

- `int8_t`, `int16_t`, `int32_t`, `int64_t`, `uint8_t`, `uint16_t`, `uint32_t`, `uint64_t` etc...
- `uintmax_t` and `intmax_t` for the largest unsigned and signed integer types respectively
- **`uintptr_t`** ensures that the variable is large enough to hold a pointer

The minimum and maximum values for each integer type can be found in the header file `limits.h`

```c
#include <limits.h>
#include <stdio.h>

int main() {
  printf("Minimum value of int: %d\n", INT_MIN);
  printf("Maximum value of int: %d\n", INT_MAX);
  printf("Minimum value of long: %ld\n", LONG_MIN);
  printf("Maximum value of long: %ld\n", LONG_MAX);

  return 0;
}
```

Sample ranges for integer data types (may vary based on the compiler and architecture):

| Data Type                 |               Range               |
| ------------------------- | :-------------------------------: |
| `short` (aka `short int`) |        `-32,768 .. 32,767`        |
| `unsigned short`          |           `0 .. 65,535`           |
| `int`                     | `-2,147,483,648 .. 2,147,483,647` |
| `unsigned`                |       `0 .. 4,294,967,295`        |
| `long`                    | `-2,147,483,648 .. 2,147,483,647` |
| `unsigned long`           |       `0 .. 4,294,967,295`        |

#### Floating Point Numbers

Floating-point data types are used to store real numbers (positive or negative)

1. `float` keyword is used to declare a single-precision [floating-point variable](#ieee-754-floating-point-standard)
2. `double` keyword is used to declare a double-precision [floating-point variable](#ieee-754-floating-point-standard)
3. `long double` keyword is used to declare an extended-precision

| Data Type     | Significant Digits |            Range (approx.) |
| ------------- | -----------------: | -------------------------: |
| `float`       |                  6 |     `±3.4E-38 .. ±3.4E+38` |
| `double`      |                 15 |   `±1.7E-308 .. ±1.7E+308` |
| `long double` |                 19 | `±3.4E-4932 .. ±1.1E+4932` |

#### Integer Padding

All integer types except `char`, `signed char`, and `unsigned char` may contain unused bits, called _padding_, to satisfy the alignment requirements of the target architecture

The number of bits used to represent a value of a given type, excluding ­padding but including the sign, is called the _width_ and is often denoted by `N`

#### Precision

The _precision_ is the number of bits used to represent values, excluding sign and padding bits

When working with floating-point numbers, the operations are not always exact and can have some loss of accuracy or _round-off errors_ (or _representational error_) due to the way floating-point numbers are stored in memory (binary representation)

- _Precision_: The number of digits that can be stored in a floating-point number
- _Accuracy_: The closeness of the measured value to the true value

```c
#include <stdio.h>

int main() {
  float a = 1.0;
  float b = 10.0;
  float c = a / b;

  printf("%.10f\n", c); // 0.1000000015

  return 0;
}
```

In the above example, the result of `a / b` is `0.1000000015` instead of `0.1` due to the loss of accuracy in floating-point numbers (round-off error)

- When a very large number is added to a very small number, the small number is lost due to the limited precision of floating-point numbers. It is called _catastrophic cancellation_ (or _cancelation error_)
  - To avoid this, use a _tolerance_ value when comparing floating-point numbers (like `1e-6`) instead of exact equality

- When two very small numbers are multiplied, the result may be too small to be represented accurately. It will be represented as `0`, which is called _arithmetic underflow_

- When two very large numbers are multiplied, the result may be too large to be represented accurately. It will be represented as `infinity`, which is called _arithmetic overflow_

- When a number is divided by `0`, the result is `INFINITY` (present in `math.h`) (printed as `inf`), which is called _division by zero_ (or _singularity_) error

#### IEEE 754 Floating Point Standard

_IEEE 754_: Floating point number specification

- It is a compression algorithm

| Bits      | Precision           |
| --------- | ------------------- |
| _16 bit_  | Half Precision      |
| _32 bit_  | Single Precision    |
| _64 bit_  | Double Precision    |
| _128 bit_ | Quadruple Precision |
| _256 bit_ | Octuple Precision   |

Floating point numbers in 16 Bit System:

- The floating point number's binary representation is split into 3-parts:

1. _Sign (1 Bit)_:
   - Number is Positive or Negative

2. _Exponent (5 Bits)_:
   - Represents a range

   | Exponent (`n`) | Power Range (`2^n`) | Numerical Range |
   | :------------: | :-----------------: | :-------------: |
   |      `0`       |      `[0, 1]`       |    `[1, 2]`     |
   |      `1`       |      `[1, 2]`       |    `[2, 4]`     |
   |      `2`       |      `[2, 3]`       |    `[4, 8]`     |
   |      `3`       |      `[3, 4]`       |    `[8, 16]`    |
   |      `4`       |      `[4, 5]`       |   `[16, 32]`    |

3. _Mantissa (10 Bits)_:
   - `(Number - lower bound) / (upper bound - lower bound)`

- For 64 Bit system:
  - _Sign (1 Bit)_
  - _Exponent (11 Bits)_
  - _Mantissa (52 Bits)_

Formula that represents a floating point number:

- **`N = (-1)^sign * 1.mantissa * 2^(exponent - 15)`**

According to IEEE 754 spec:

- `-0` if _`sign=1`_, _`exponent=00000`_, and _`mantissa=0000000000`_

- `INFINITY` if _`exponent=11111`_ and _`mantissa=0000000000`_
  - `-INFINITY` if _`sign=1`_

- `NaN` if _`exponent=11111`_ and _`mantissa=someValue`_
  - There are man `NaN`

- `2^0`: de-normalized number

_Example:_

```text
The number: 25.1 (decimal) is stored as:

- Sign:       0       (Positive)
- Exponent:   131     (1000 0011)
- Mantissa:   4771021 (1001 0001 1001 1001 1001 101)

Value actually stored in float:   25.1000003814697265625
Error due to conversion:          0.0000003814697265625
Binary Representation:            0100 0001 1100 1000 1100 1100 1100 1101
Hexadecimal Representation:       41C8CCCD
```

References:

- [Floating Point Arithmetic](https://en.wikipedia.org/wiki/Floating-point_arithmetic)

- [16 Bit Floats](https://en.wikipedia.org/wiki/Half-precision_floating-point_format)

- [IEEE 754 Spec](https://ieeexplore.ieee.org/document/30711)

- [IEEE-754 Floating Point Converter](https://www.h-schmidt.net/FloatConverter/IEEE754.html)

- [Fabien Sanglard's awesome blog on the subject](https://fabiensanglard.net/floating_point_visually_explained/)

- [Denormalised Numbers](https://en.wikipedia.org/wiki/Denormal_number)

- [Low Level JavaScript: GitHub Repo](https://github.com/LowLevelJavaScript/Floating-Point-Implemented-In-JS)

- [Floating Point Math](https://0.30000000000000004.com/)

### Boolean

Boolean data-type was introduced in `C99` standard using the `_Bool` keyword (existing programs may have defined their own identifiers named `bool` or `boolean`, hence the underscore prefix)

They only store two values: `0` (false) and `1` (true)

- The header file `stdbool.h` defines the macros `bool`, `true`, and `false` for better readability

```c
#include <stdbool.h>
#include <stdio.h>

int main() {
  bool isTrue = true;   // expands to 1
  bool isFalse = false; // expands to 0

  if (isTrue) {
    printf("isTrue is true\n");
  }

  if (!isFalse) {
    printf("isFalse is false\n");
  }

  return 0;
}
```

### `enum`

An _enumeration_, or `enum`, allows you to define a type that assigns names (enumerators) to integer values in cases with an enumerable set of constant values

- If the first enumerator does not have an explicit value, it is assigned the value `0`
- Each subsequent enumerator without an explicit value is assigned the value of the previous enumerator plus `1`

```c
  enum day { sun, mon, tue, wed, thu, fri, sat };
  //          0    1    2    3    4    5    6

  enum cardinal_points { north = 0, east = 90, south = 180, west = 270 };
  enum months {
    jan = 1,
    feb,
    mar,
    apr,
    may,
    jun,
    jul,
    aug,
    sep,
    oct,
    nov,
    dec
  };
```

### Void

The keyword `void` (by itself) means "cannot hold any value"

It can be used to specify that a function does not return a value, or as a sole parameter to indicate that a function does not take any arguments

The _derived type_ `void *` means that the pointer can point to a value of any _object_

- It is used to specify that a function does not take any parameters

```c
void printMessage() {
  printf("Hello, World!");
}

// use `void` to specify that the function does not take any parameters
// it is recommended to use `void` in the parameter list
void printMessageWithVoid(void) {
  printf("Hello, World!");
}

int main() {
  void *ptr;

  printMessage(25); // warning: Too many arguments in call to 'print_hello' [warn_call_wrong_number_of_arguments]

  printMessageWithVoid(25); // error: Too many arguments to function call, expected 0, have 1 [typecheck_call_too_many_args]
  return 0;
}
```

### Arrays

_Definition:_ Contiguous area of memory consisting of equal-size elements

In C, an array is indistinguishable from a [pointer](#pointers) to its first element, so the name of the array acts like a pointer to the first element of the array

- Declared with size inside square brackets `[]`
- It can be declared without size, but in this case it must be initialized with items. The size of the array will be equal to the number of items
- If number of items are less than the declared size of an array, the rest of the places will be filled with `0`
- If an array is declared and never initialized then it will contain garbage values
- Accessed using index starting from `0` (zero based indexing) to `size-1`

_Example:_

```c
#include <stdio.h>

int main()
{
    // array declarations
    int A[5] = {1, 2, 3, 4, 5};
    int B[] = {1, 2, 3};        // SIZE 3
    int C[5] = {1, 2, 3};       // {1,2,3,0,0}
    int D[2];                   // {3213, 234324}: garbage values

    for (int i = 0; i < 5; i++)
    {
        // accessing array elements using index
        printf("%d\n", A[i]);
    }
    printf("Completed");


    // arrays can also be created using pointers
    int *intArray = (int *)malloc(5 * sizeof(int)); // dynamic array of size 5

    return 0;
}
```

If you try to access an array element outside its bounds, it will lead to **undefined behaviour**

```c
#include <stdio.h>

int main()
{
    int A[5] = {1, 2, 3, 4, 5};

    // accessing array element outside its bounds
    printf("%d\n", A[9]); // undefined behaviour

    return 0;
}
```

- We can use runtime bounds checking to catch such errors

```c
typedef struct {
    int32_t *items;
    int32_t length;
    int32_t capacity;
} Int32Array;


int Int32Array_Get(Int32Array *array, int32_t index, int32_t *out_value) {
    if (index < 0 || index >= array->length) {
        return -1; // Index out of bounds
                   // you can attach a debugger or use platform-specific function to automatically break here
                   // `raise(SIGTRAP);` on POSIX systems
    }
    *out_value = array->items[index];
    return 0; // Success
}

void IterateArray(Int32Array *array) {
    for (int32_t i = 0; i < array->length; i++) {
        int32_t value;
        if (Int32Array_Get(array, i, &value) == 0) {
            // Use value
        } else {
            // Handle error
        }
    }
}
```

- This way we can catch out-of-bounds access at runtime and handle it gracefully, we can use macros to create such functions for different data types

```c
#define GET(array, index, out_value) Array_Get(array, sizeof(*(array)), (sizeof(array) / sizeof(*(array))), index, out_value)

void* Array_Get(void* array, size_t element_size, size_t length, size_t index) {
    if (index >= length) {
        return NULL; // Index out of bounds
    }
    return (char*)array + (index * element_size);
}
```

## Struct (Structure)

_Definition:_ It's a **physically grouped list of dissimilar data items under one name in a block of memory**, allowing the different data items to be **accessed via a single pointer**. It's used for defining user-defined data types, apart from the primitive data types

- Group of related data items

### Syntax

`struct` is the **keyword** used to define a structure

```c
struct struct_name
{
  data_type member1;
  data_type member2;
  //...
} structure_variables;
```

- **`struct` only have data** they do not have member functions

### Initialization

It can be done at the time of declaration

```c
struct struct_name variable_name = {value1, value2, ...};
```

- It can be done after declaration

```c
struct struct_name variable_name;
variable_name.member1 = value1;
variable_name.member2 = value2;
```

The order of the elements in a structure is important (it is not a key-value pair)

```c
struct Rectangle
{
  int8_t length; // 1 byte
  int8_t breadth; // 1 byte
} r1, r2;

// the order of the elements in a structure is important
// below is an example of positional initialization
struct Rectangle r = {10, 5}; // 10 is assigned to length and 5 is assigned to breadth
```

Types of initialization:

- **Zero initialization**: If you only pass `{0}` then all the members will be initialized to `0`

  ```c
  struct struct_name variable_name = {value1}; // rest of the members will be initialized to 0
  ```

- **Positional initialization**: You can initialize all the members of a structure in the order they are declared

  ```c
  struct struct_name variable_name = {value1, value2, ...}; // order is important
  ```

- **Designated initialization**: Members can be initialized in any order by specifying the member name prefixed by a `.` (dot operator)
  - **Introduced in C99 standard**

  ```c
  struct struct_name variable_name = {.member2=value2, .member1=value1};
  ```

Initialization must not be empty, else garbage values will be assigned or zero initialization will be done

- Also, do not do partial initialization as it will lead to garbage values

```c
struct struct_name variable_name = {};
```

- You can use `typedef` to define a new data type for a structure
  - In this way you do not need to use the `struct struct_name` every time you use the structure

  ```c
  typedef struct Rectangle
  {
    int8_t length;
    int8_t breadth;
  } Rectangle;

  int main()
  {
    Rectangle r = {10, 5};

    printf("Area of the Rectangle is %d", r.length * r.breadth);

    return 0;
  }
  ```

```c
struct Card
{
  int face;
  int shape;
  int color;
};

int main()
{
  struct Card deck[52]={{1,0,0}, {0,0,1}, .... };
  deck[0].face=2;
}
```

### Accessing Members

`.` (dot operator) is used to **access the members of the structure**

- If a structure is a pointer, then `->` (arrow operator) is used to access the members of the structure

```c
struct Rectangle
{
  int8_t length; // 1 byte
  int8_t breadth; // 1 byte
} r1, r2;

int main()
{
  struct Rectangle r = {.length=10, .breadth=5}; // size of r = 2 bytes

  r.length = 25;
  printf("Area of the Rectangle is %d", r.length * r.breadth);

  return 0;
}
```

### Memory Allocation

All the members of a structure are stored in contiguous memory locations

```text
                     r (2 bytes)
                         |
                         V
Member Name      length    breadth
                .--------.---------.
Data            | 25     | 5       |  <- r.length = 25, r.breadth = 5
                '------------------'
Memory Address    1000     1001
```

- In the above example if `length` is stored at the memory location `1000` then `breadth` is stored at the memory location `1001`

- This is the reason why the order of the elements in a structure is important

- Its size will the **sum of sizes consumed by all of its elements**

#### Struct Padding

**Data structure alignment** is the way data is arranged and accessed in computer memory. It consists of three separate but related issues: **data alignment**, **data structure padding**, and **packing**

**Structure Padding** is used to allocate memory for a structure

- Padding aligns structure members to "natural" address boundaries
- Padding can differ between compilers and system architectures

There are different complicated rules and heuristics that different compilers use to determine how to layout structures in memory

_Example:_ Let use consider a oversimplified scenario, define a `struct` called _Rectangle_ with _length_ as `int8_t` (1 byte) and _breadth_ as `int16_t` (2 bytes)

- Take the size of the largest data type in the structure `breadth` (2 bytes)
- Now, calculate the padding required for each member of the structure
  - `breadth - length = 2 - 1 = 1`, so the offset of _breadth_ will be `1`

- The size of the structure will be `4 bytes`

  ```text
  (largest data type size) + (member 1 size + padding) ... = size of the structure

  2 + (1 + 1) = 4
  ```

```c
struct Rectangle {
  int8_t length;   // 2 byte (1 byte + 1 padding byte)
  int16_t breadth; // 2 bytes
} r1, r2;

int main() {
  struct Rectangle r = {10, 5}; // size of r = 4 bytes

  printf("Size of the Rectangle is %zu", sizeof(r));

  return 0;
}
```

> [!TIP] RULE OF THUMB
> Ordering the members from largest to smallest will help the compiler to minimize padding

- [The Lost Art of Structure Packing](http://www.catb.org/esr/structure-packing/)

#### Packing

**Structure Packing** is used to remove padding from a structure

- It is used to reduce the size of the structure
- Unaligned memory access is _slower_ on architectures that allow it (like x86 and x86-64)

```c
struct __attribute__((__packed__)) Rectangle {
{
  int8_t length; // 1 byte
  int16_t breadth; // 2 bytes
};

int main()
{
  struct Rectangle r = {10, 5}; // size of r = 3 bytes

  printf("Size of the Rectangle is %d", sizeof(r));

  return 0;
}
```

## Pointers

_Definition:_ Pointer is **an address variable** that is meant for **storing the address of an object or function**

[Memory](#memory) of a variable `int a = 10` is divided into two parts:

| Variable | Address  | Value |
| -------- | -------- | ----- |
| `a`      | `0x6ABD` | 10    |

When we declare a variable, the compiler allocates some memory for that variable, and the memory location is identified by the variable name

- The memory location is called the **address of the variable**
- We can store the address of a variable in another variable called a **pointer variable**
- The `&` (address-of-operator or ampersand character) is used to get the address of a variable
- The `*` (indirection or dereference operator) is used to declare a pointer variable and to dereference them

```c
int a = 10;

int *p; // pointer variable declaration

p = &a; // store the address of `a` in `p`
```

| Variable | Address  | Value    |
| -------- | -------- | -------- |
| `a`      | `0x6ABD` | 10       |
| `p`      | `0x6ABD` | `0x6ABD` |

- As mentioned the `*` (dereference operator) is used to get the value of the variable whose address is stored in the pointer variable

```c
int a = 10;

int *p;             // pointer variable

p = &a;             // store the address of `a` in `p`

printf("%d", *p);   // 10
```

Pointers are used for:

- **Accessing heap memory**. The program will not automatically access the heap. Heap memory is external to the program

- Accessing resources, such as files, keyboard, monitor, etc.:
  - Like access files, files are stored in hard disks and are external to the program. File pointers are used to access these files
  - Similarly to interact with any external device we use the pointer

- Functions use Pointers as parameters while using call by reference method

_Example:_

```c
int main()
{
    // data variable
    int a=10;

    // pointer variable
    int *p;

    // save address of `a`
    p=&a;

    // print data present in `a`
    printf("%d", a);
    printf("%d", *p); // also know as dereferencing
}
```

Array variable actually points to the first element of the array:

```c
int main()
{
    int A[5]={2,4,6,8,10};
    int *p;

    // A ITSELF POINTS TO THE FIRST ELEMENT OF THE ARRAY
    p=A;

    printf("%d", *p); // 2
    printf("%d", *A); // 2

}
```

> [!NOTE]
> Pointers consume the same amount of memory (8 bit) irrespective of the type of pointer

**Accessing heap memory**:

- In C `malloc` is used to get memory in heap. Its present in `<stdlib.h>` and takes size as a parameter
- `malloc` returns a `void` pointer (generic pointer), so we have to type-caste it and say it's an `integer` pointer
- We need to **free the memory allocated to the variables** after they are no more required using `free()` in C and `delete` in C++
- **Heap memory must be de-allocated**

_Example:_

```c
// REQUIRED FOR malloc
#include<stdlib.h>
int main()
{
    int *p;
    p=(int *)malloc(5 * sizeof(int));
    // TYPE-CASTE AS malloc RETURNS A void POINTER, malloc WILL NOW PROVIDE MEMORY FOR
    // AN ARRAY OF LENGTH 5 AND EACH ELEMENT OF SIZE INT

    free(p); // CLEARING MEMORY ALLOCATED TO p
}
```

In C++:

```cpp
int main()
{
    int *p;
    p=new int[5]; // SIMILAR TO USING malloc

    delete [] p; // CLEARING MEMORY ALLOCATED TO p
    // ADD EMPTY [] AS p IS POINTING TO AN ARRAY
}
```

Pointer to a [Structure](#struct-structure):

_Example:_

```c
struct Rectangle
{
    int length;
    int breadth;
};

int main()
{
    struct Rectangle r={10,5};
    struct Rectangle *p=&r;

    r.length=15;

    (*p).breadth=25;    // *p IS ENCLOSED INSIDE A BRACKET BECAUSE `.` HAS HIGHER PRIORITY THAN `*`
    p->length=25;       // ALTERNATIVE METHOD

    printf("%d %d\n", r.length, r.breadth);         // 25 25
    printf("%d %d\n", (*p).length, (*p).breadth);   // 25 25
    printf("%d %d\n", p->length, p->breadth);       // 25 25
}
```

Dynamic allocation of Pointer (in heap memory):

_Example:_

```c
// struct FROM THE ABOVE EXAMPLE
int main()
{
    struct Rectangle *p;

    p=(struct Rectangle *)malloc(sizeof(struct Rectangle));

    p->length=22;
    p->breadth=10;
}
```

- Void Pointer: Type-less memory

  ```c
  int main()
  {
    int a=4;
    int *pA = &a;

    printf("%d\n", *pA);

    void *vA = &a;

    printf("%d\n", *vA); // Error
  }
  ```

## Functions

Functions are a block of code that performs a specific task and can be reused multiple times

- Functions may accept input parameters and may return output values

C distinguishes between _parameters_, which are objects declared as part of the function declaration that acquire a value on entry to the function, and _arguments_, which are comma separated expressions you include in the function call expression

### Function Declaration

A function declaration tells the compiler about a function's name, return type, and parameters

```c
// syntax
return_type function_name(parameter1_type parameter1_name, parameter2_type parameter2_name, ...);

// Example
int add(int a, int b);
void printMessage(void);
```

### Function Definition

A function definition provides the actual body of the function

```c
// syntax
return_type function_name(parameter1_type parameter1_name, parameter2_type parameter2_name, ...) {
  // function body
  return return_value;
}

// Example
int add(int a, int b) {
  return a + b;
}
```

### Function Call

A function call is used to invoke a function and execute its code

```c
// syntax
function_name(argument1, argument2, ...);

// Example
int result = add(10, 20);
```

### Call by Value vs Call by Reference

- **Call by Value**: In call by value, a copy of the actual parameter's value is passed to the function. Changes made to the parameter inside the function do not affect the original argument

  ```c
  #include <stdio.h>

  void swap(int a, int b) {
    int t = a;
    a = b;
    b = t;
    printf("swap: a = %d, b = %d\n", a, b);
  }

  int main() {
    int a = 21;
    int b = 17;
    swap(a, b);
    printf("main: a = %d, b = %d\n", a, b);
    return 0;
  }
  ```

- **Call by Reference** (_pass by reference_): In call by reference, the address of the actual parameter is passed to the function. Changes made to the parameter inside the function affect the original argument
  - [Pointers](#pointers) are used to implement call by reference in C

  ```c
  #include <stdio.h>

  void swap(int *pa, int *pb) {
    int t = *pa;
    *pa = *pb;
    *pb = t;
    return;
  }

  int main() {
    int a = 21;
    int b = 17;
    swap(&a, &b);
    printf("main: a = %d, b = %d\n", a, b);
    return 0;
  }
  ```

## Standard Functions and Libraries

A C compiler comes with a set of standard libraries that provide useful functions for various tasks like input/output, string manipulation, mathematical calculations, etc...

Some commonly used standard libraries in C are:

- [`nothings/stb`](https://github.com/nothings/stb): A collection of single-file public domain libraries for C/C++ (like `stb_image.h` for image loading, `stb_truetype.h` for font rendering, etc.)

### `printf`

`printf` is a standard library function in C that prints formatted output to the standard output stream (`stdout`)

- It is defined in the `stdio.h` header file
- It returns the number of characters printed (excluding the `null` byte)
- It is a _variadic_ function, which means it can take a variable number of arguments
- A format specifiers (conversion specifiers) start with a `%` symbol, The format specifiers are replaced by the values of the arguments
- This function returns the total number of characters printed, or a negative value if an output error occurs

- The format specifiers are:
  - `%d`: Integer
  - `%f`: Float
  - `%c`: Character
  - `%s`: String
  - `%p`: Pointer
  - `%x`: Hexadecimal
  - `%zu`: `sizeof` value (size_t)

- The format string can contain escape sequences:
  - `\n` (newline)
  - `\t` (tab)
  - `\\` (backslash)
  - `\"` (double quote)
  - `\'` (single quote)

- The format string can contain width specifiers:
  - `%5d` (5 characters wide)
  - `%10.2f` (10 characters wide with 2 decimal places)

- The format string can contain flags:
  - `+` (always show sign)
  - `-` (left-justify)
  - `0` (pad with zeros)
  - `#` (alternate form)
  - space (space if positive)

- The format string can contain length modifiers:
  - `h` (short)
  - `l` (long)
  - `ll` (long long)
  - `j` (intmax_t)
  - `z` (size_t)
  - `t` (ptrdiff_t)
  - `Le` (long double)

- The format string can contain conversion specifiers:
  - `d` (decimal)
  - `i` (integer)
  - `o` (octal)
  - `u` (unsigned decimal)
  - `x` (hexadecimal)
  - `X` (upper-case hexadecimal)
  - `f` (float)
  - `e` (scientific notation)
  - `E` (scientific notation)
  - `g` (shortest representation)
  - `G` (shortest representation)
  - `a` (hexadecimal float)
  - `A` (hexadecimal float)
  - `c` (character)
  - `s` (string)
  - `p` (pointer)
  - `n` (number of characters written so far)
  - `%` (percent sign)

```c
#include <stdio.h>

int main()
{
    int a = 10;
    float b = 20.5;
    char c = 'A';
    char s[] = "Hello, World!";
    void *p = &a;

    printf("Integer: %d\n", a);
    printf("Float: %f\n", b);
    printf("Character: %c\n", c);
    printf("String: %s\n", s);
    printf("Pointer: %p\n", p);
    printf("Hexadecimal: %x\n", a);

    return 0;
}
```

| Placeholder | Type     | Function Use     |
| ----------- | -------- | ---------------- |
| `%c`        | `char`   | `printf`/`scanf` |
| `%d`        | `int`    | `printf`/`scanf` |
| `%f`        | `double` | `printf`         |
| `%lf`       | `double` | `scanf`          |

When using `scanf`, be careful with the format specifiers. For example, `%f` is used for `float` in `scanf`, but it is used for `double` in `printf`. Similarly, `%lf` is used for `double` in `scanf`, but it is not used in `printf`

> [!WARNING] SECURITY
> Take care not to pass user-supplied data as part of the first argument to the `printf` function, because doing so can result in a formatted output security vulnerability (Seacord 2013)

#### `puts`

`puts` is a standard library function in C that prints a string to the standard output stream (`stdout`) followed by a newline character

- It is defined in the `stdio.h` header file
- It returns a non-negative value on success and `EOF` on error

```c
#include <stdio.h>
#include <stdlib.h>

int main(void) {
  char s[] = "Hello, World!";

  puts(s); // prints "Hello, World!" followed by a newline

  if (puts("Hello, world!") == EOF) { // `EOF` (a negative integer) if a write error occurs
    return EXIT_FAILURE;
  }
  return EXIT_SUCCESS;
}
```

### `sizeof`

`sizeof` is an operator in C that returns the size of a variable or a data type

- It returns `size_t` which is an unsigned integer type of at least 16 bits
- Use `%zu` format specifier to print the `sizeof` value

```c
#include <stdio.h>

int main()
{
  int a;
  float b;
  char c;
  double d;

  printf("Size of int: %zu\n", sizeof(a));   // 4 bytes
  printf("Size of float: %zu\n", sizeof(b)); // 4 bytes
  printf("Size of char: %zu\n", sizeof(c)); // 1 byte
  printf("Size of double: %zu\n", sizeof(d)); // 8 bytes

  return 0;
}
```

## Debugging

There are several tools available for debugging C programs:

- `gdb`: GNU Debugger
- [`raddebugger`](https://github.com/EpicGamesExt/raddebugger): A simple cross-platform graphical debugger
- [`RemedyBG`](https://remedybg.itch.io/remedybg): Graphical Debugger for Windows
- `valgrind`: Memory leak detector
- `strace`: System call tracer
- `ltrace`: Library call tracer
- `addr2line`: Convert addresses to file names and line numbers
- `objdump`: Display information about object files

### `gdb`

`gdb` is a powerful command-line debugger for C programs

- Compile the program with `-g` flag to include debugging information

  ```bash
  gcc -g -o main main.c
  # or
  clang -g -o main main.c
  ```

- Start `gdb` with the executable

  ```bash
  gdb ./main
  ```

Common `gdb` commands:

| Command                                            | Description                                                              |
| -------------------------------------------------- | ------------------------------------------------------------------------ |
| `[r]un [args]`                                     | Runs the program with the given arguments                                |
| `[b]reak [file:line number]`                       | Set a breakpoint at the specified line                                   |
| `[b]reak [function name]`                          | Set a breakpoint at the specified function                               |
| `[c]lear [file:line number]`                       | Clear the breakpoint at the specified line                               |
| `[c]lear [function name]`                          | Clear the breakpoint at the specified function                           |
| `[d]elete [breakpoint number]`                     | Delete the specified breakpoint                                          |
| `[n]ext`                                           | Execute the next line of code                                            |
| `[n]ext[i]`                                        | Execute the next instruction (assembly level)                            |
| `[s]tep`                                           | Step into a function                                                     |
| `[s]tep[i]`                                        | Step into the next instruction (assembly level)                          |
| `[c]ontinue`                                       | Continue execution until the next breakpoint                             |
| `[p]rint/x [expression]`                           | Print the value of a variable                                            |
| `[d]isplay [variable]`                             | Display the value of a variable every time the program stops             |
| `[l]ist`                                           | List the source code around the current line                             |
| `[b]ack[t]race`                                    | Show the call stack                                                      |
| `[f]inish`                                         | Run until the current function returns                                   |
| `[x]/(number)(format)(unit_size) [address]`        | Examine memory at the specified address as instructions                  |
| `[i]nfo [[f]rame,[s]tack,[r]egisters,[fu]nctions]` | Show information about the current frame, stack, registers, or functions |
| `where`                                            | Show the current stack frame                                             |
| `layout/lay next`                                  | Show the next layout (source, assembly, etc.)                            |
| `layout/lay prev`                                  | Show the previous layout (source, assembly, etc.)                        |
| `ref`                                              | Refresh the current layout                                               |
| `[q]uit`                                           | Exit `gdb`                                                               |

## Versions

1. 1972: First release
2. 1978: `K&R C`
3. 1989: `C89`/`C90` (ANSI C or ISO C)
   - **Most of the C code written** today is based on the ANSI C standard
   - Almost every C compiler available today is ANSI C compliant
   - Every platform/target
   - Can be compiled with a C++ compiler (with no or minimal changes)

4. 1999: `C99` (ISO/IEC 9899:1999)
   - Added several new features to the C language
   - Standardized `//` comments
   - Local variable can be declared anywhere in the block:

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

   - Better data types for fixed-width integers using `stdint.h`, like `int32_t`, `int64_t`, etc...
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

5. 2011: `C11` (ISO/IEC 9899:2011)
   - Added `_Generic` for generic selection
   - `static_assert` for compile-time assertions
   - Atomic complex numbers
   - [C11 final draft](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf)

6. 2018: `C17` (ISO/IEC 9899:2018)
   - Added `alignas` and `alignof` for alignment control
   - Added `noreturn` for functions that never return
   - Added `thread_local` for thread-local storage

7. 2024: `C23` (ISO/IEC 9899:2024)

[Modern C Features](https://github.com/AnthonyCalandra/modern-c-features)

## Code Style

### Code Formatting

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

## Function Overloading

C does not support function overloading like C++, but we can achieve similar functionality using different techniques:

- Using different function names:

```c
#include <stdio.h>

void printInt(int a) {
  printf("Integer: %d\n", a);
}

void printFloat(float b) {
  printf("Float: %f\n", b);
}

int main() {
  printInt(10);
  printFloat(20.5);
  return 0;
}
```

- Using `void` pointers:

```c
#include <stdio.h>

void printValue(void *value, char type) {
  switch (type) {
    case 'i':
      printf("Integer: %d\n", *(int *)value);
      break;
    case 'f':
      printf("Float: %f\n", *(float *)value);
      break;
    default:
      printf("Unknown type\n");
  }
}

int main() {
  int a = 10;
  float b = 20.5;

  printValue(&a, 'i');
  printValue(&b, 'f');

  return 0;
}
```

- Using macros with `_Generic` (introduced in C11):

```c
#include <stdio.h>

#define printValue(value) _Generic((value), \
    int: printInt, \
    float: printFloat \
)(value)

void printInt(int a) {
  printf("Integer: %d\n", a);
}

void printFloat(float b) {
  printf("Float: %f\n", b);
}

int main() {
  printValue(10);
  printValue(20.5f);
  return 0;
}
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

- [Malloc: Allocating Memory in C](https://www.codequoi.com/en/malloc-allocating-memory-in-c/)
