---
title: Data Structures
description: A data structure is a particular way of organizing data in a computer.
---

# Data Structures

A **data structure is a data organization, management, and storage format** that enables efficient access and modification.

The data structure is a collection of data values, the relationships among them, and the functions or operations applied to the data.

## Introduction

There are two types of Data structures:

1. [Physical](#physical): They define how the **data is arranged** in memory.

   - [Arrays](#arrays)
   - Linked List
   - Matrices

2. [Logical](#logical): They define how the **data can be utilized**.

   - Linear Data Structures:

     - **Stack** (LIFO)
     - **Queues** (FIFO)

   - Non-Linear Data Structures:

     - **Tress**
     - **Graph**

   - Tabular (linear/non-linear):
     - **Hash Table**

### Problem solving vs programming:

1. Problem-solving: It requires math to solve problems. And math does not have loops, it has [Recursion](#recursion). It's a lifetime of work.

2. Programming: Learning the syntax of a language and implementing the solution in it.

## C/C++ Concepts

The main memory can divided into:

1. Heap:

2. Stack:

3. Code Section:

_Example:_

```c
int main()
{
    int A[5];
    int B[5]={2,4,6,8,10};
    int i;
    for(i=0;i<5;i++)
    {
        printf("%d", B[i]);
    }
}
// ARRAYS A AND B WILL APPEAR IN THE STACK AFTER DECLARATION.
```

### Types and objects

- A _type_ defines a set of possible values and a set of operations (for an object).
- An _object_ is some memory that holds a value of a given type.
- A _value_ is a set of bits in memory interpreted according to a type.
- A _variable_ is a named object.
- A _declaration_ is a statement that gives a name to an object.
- A _definition_ is a declaration that sets aside memory for an object.

**Operations on data types**:

![Operations on data types](./operations-on-data-types.jpg)

### Struct (Structure)

_Definition:_ It's a **physically grouped list of dissimilar data items under one name in a block of memory**, allowing the different data items to be **accessed via a single pointer**. It's used for defining user-defined data types, apart from the primitive data types.

In the above example, we defined a `struct` called **Rectangle**.

- `struct` is the keyword used to define a structure.
- `.` (dot operator) is used to access the members of the structure.
- Its size will the **sum of sizes consumed by all of its elements**.
- **Structure Padding** is used to allocate memory for a structure.

_Example:_

```c
// DEFINITION
struct Rectangle
{
  int length;
  int breadth;
}

int main()
{
  // DECLARATION
  struct Rectangle r;
  struct Rectangle r1={10,5};

  // INITIALISATION
  r.length=25;
  printf("Area of the Rectangle is %d", r.length * r.breadth);
}
```

```c
struct Card
{
  int face;
  int shape;
  int color;
}

int main()
{
  struct Card deck[52]={{1,0,0}, {0,0,1}, .... };
  deck[0].face=2;
}
```

### Pointers

_Definition:_ Pointer is **an address variable** that is meant for **storing the address of another variable**.

- The size of a pointer will always be equal to size the of its type.

Pointers are used for:

- Accessing heap memory. The program will not automatically access the heap. Heap memory is external to the program.
- Accessing resources, such as files, keyboard, monitor, etc.:
  - Like access files, files are stored in hard disks and are external to the program. File pointers are used to access these files.
  - Similarly to interact with any external device we use the pointer.
- Functions use Pointers as parameters while using call by reference method.

_Example:_

```c
int main()
{
    // DATA VARIABLE
    int a=10;
    // POINTER VARIABLE
    int *p;

    // SAVE ADDRESS OF a
    p=&a;

    // PRINT DATA PRESENT IN a
    printf("%d", a);
    printf("%d", *p);
    // ALSO KNOW AS DEREFERENCING
}
```

Accessing heap memory:

- In C `malloc` is used to get memory in heap. Its present in `<stdlib.h>` and takes size as a parameter.
- `malloc` returns a `void` pointer (generic pointer), so we have to type-caste it and say it's an `integer` pointer.

_Example:_

```c
#include<stdlib.h>
int main()
{
    int *p;
    p=(int *)malloc(5 * sizeof(int));
    // TYPE-CASTE, malloc WILL NOW PROVIDE MEMORY FOR
    // AN ARRAY OF LENGTH 5 AND EACH ELEMENT OF SIZE INT
}
```

Similarly in C++:

```cpp
#include<stdlib.h>
int main()
{
    int *p;
    p=new int[5];
}
```

Pointer to a [Structure](#Structure):

_Example:_

```c
struct Rectangle
{
    int length;
    int breadth;
}

int main()
{
    struct Rectangle r={10,5};
    struct Rectangle *p=&r;

    r.length=15;
    (*p).breadth=25; // *p IS ENCLOSED INSIDE A BRACKET BECAUSE `.` HAS HIGHER PRIORITY THAN `*`
    p->length=25; // ALTERNATIVE METHOD
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

### Reference

_Definition:_ An alias of a given variable.

- While referencing both the variable and its reference have the same address.

_Example:_

```cpp
int main()
{
    int a=10;
    int &r=a;
    // r IS REFERRING TO a

    cout<<a; // 10
    r++;
    cout<<r; // 11
    cout<<a; // 11
}
```

::: tip NOTE
Reference is not a part of the C language.
:::

### Functions

_Definition:_ A function is **a named sequence of statements**. A function can return a result (also called a return value).

> Also called _subroutine_

_Example:_

```c
// ADDITION FUNCTION
int add(int a, int b) // THIS LINE IS KNOWN AS THE PROTOTYPE OR SIGNATURE OF THE FUNCTION
{
    // int a AND b ARE KNOWN AS FORMAL PARAMETERS
    int c;
    c = a + b;
    return(c);
}

// MAIN FUNCTION
int main()
{
    int x, y, z;
    x = 10;
    y = 5;
    y = add(x, y); // HERE int z AND x ARE KNOWN AS ACTUAL PARAMETERS
    printf("Sum is %d", y);
}
```

#### Parameter Passing

There are three ways of passing the parameters to a function.

1. Pass/Call by Value: In pass by value, changes in formal parameters do not reflect in the actual parameters. Refer to the above example.

2. Pass/Call by Address: In pass by address, changes in formal parameters reflect in actual parameters.

   _Example:_

   ```c
   void swap(int *x, int *y) // TO USE VARIABLE ADDRESS, DEFINE POINTERS
   {
       int temp;
       temp=*x;
       *x=*y;
       *y=temp;
   }

   int main()
   {
       int a;
       int b;
       swap(&a, &b); // PASS THE VARIABLE ADDRESS NOT THE VALUE
       printf("A == %d, B == %d", a, b);
   }
   ```

3. Pass/Call by Reference: In pass by reference also, changes in formal parameters reflect in actual parameters.

   _Example:_

   ```cpp
   void swap(int &x, int &y) // USING & WE REFERENCE THE VARIABLES a AND b
   {
       int temp;
       temp=*x;
       *x=*y;
       *y=temp;
   }

   int main()
   {
       int a;
       int b;
       swap(a, b); // NO CHANGES
       printf("A == %d, B == %d", a, b);
   }
   ```

::: tip NOTE
Pass by Reference should be used very carefully as it converts the modular code into monolithic code.
:::

Arrays as Parameters:

- Arrays cannot be passed by value, they are passed by address.

_Example:_

```c
void fun(int A[], int n) // HERE A[] IS A POINTER TO AN ARRAY, int *A IS THE SAME AS int A[]
{
    int i;
    for(i=0; i<n; i++)
    {
        printf("%d", A[i]);
    }
}

int main()
{
    int A[5] = {1,2,3,4,5};
    fun(A, 5);
}
```

Function that returns a Pointer:

_Example:_

```c
int [] fun(int n)
{
    int *p;
    p = (int *)malloc(n * sizeof(int));
    return(p);
}

int main()
{
    int *A;
    A = fun(5);
}
```

Structure as parameter:

1. Pass/Call by Value:

   _Example:_

   ```c
   struct Rectangle
   {
       int length;
       int breadth;
   }

   int area(struct Rectangle r1)
   {
       return r1.length * r1.breath;
   }

   int main()
   {
       struct Rectangle r = {1, 2};
       printf("Area of the Rectangle is %d", area(r));
   }
   ```

2. Pass/Call by Address:

   _Example:_

   ```c
   struct Rectangle
   {
       int length;
       int breadth;
   }

   int changeLength(struct Rectangle *p, int l)
   {
       p->length = l;
   }

   int main()
   {
       struct Rectangle r = {1, 2};
       changeLength(&r, 20);
   }
   ```

::: tip NOTE
Even when a `struct` has an array member, it can be passed by value even though array alone cannot be passed by value.
:::

::: warning

- Confirm if true or false: C does not have any built-in data structures.
- As part of the code activation record of the function, all the variables are created in the stack.

:::

### Structure of the Code

1. In C, `main()` function should only have variable declarations and function calls.

   These functions must be responsible for initialization, mutation, etc.

   The structure is usually maintained as structs and functions related to them.

   _Example:_

   ```c
   struct Rectangle
   {
       int length;
       int breadth;
   }

   void initialize(struct Rectangle *r, int l, int b)
   {
       r->length = l;
       r->breadth = b;
   }

   int area(struct Rectangle r)
   {
       return r.length * r.breadth;
   }

   void changeLength(struct Rectangle *r1, int l)
   {
       r->length = l;
   }

   int main()
   {
       struct Rectangle r;

       initialize(&r, 10, 5);
       printf("Area of the Rectangle is %d", area(r));
       changeLength(&r, 20);
   }
   ```

2. Similarly in C++, OOP's concepts are used to organize the code.

   All the variables and functions related to them are grouped together as a class.

   _Example:_

   ```cpp
   class Rectangle
   {
       private int length;
       private int breadth;

       // instead OF INITIALIZE FUNCTION WE USE A CONSTRUCTOR TO SET THE VALUES
       Rectangle(int l, int b)
       {
           length = l;
           breadth = b;
       }

       public int area()
       {
           return length * breadth;
       }

       public void changeLength(int l)
       {
           length = l;
       }
   }

   int main()
   {
       Rectangle r(10, 5);
       printf("Area of the Rectangle is %d", r.area());
       r.changeLength(20);
   }
   ```

   _Example:_

   ```cpp
   #include<iostream> // .h DEPENDS ON COMPILER (CHECK)

   using namespace std; // IF ONLY iostream IS USED

   class Rectangle
   {
       private:
           int length;
           int breadth;

       public:
           // DEFAULT CONSTRUCTOR
           Rectangle()
           {
               length = 1;
               breadth = 1;
           }

           // PARAMETERIZED CONSTRUCT (USING CONSTRUCTOR OVERLOADING)
           Rectangle(int l, int b); // PROTOTYPE OR SIGNATURE OF THE FUNCTION

           // BELOW TWO FUNCTIONS ARE FACILITATORS WHICH PERFORM SOME OPERATIONS ON DATA MEMBERS
           int area();
           int perimeter();

           // BELOW TWO FUNCTIONS ARE accessor/getter (get()) and mutator/setter (set()) FUNCTION
           int getLength()
           {
               return length;
           }
           void setLength(int l)
           {
               length = l;
           }

           // DESTRUCTOR (CALL WHENEVER DYNAMIC MEMORY IS ALLOCATED BY THE CLASS)
           ~Rectangle();
   };

   Rectangle::Rectangle(int l, int b)
   {
       length = l;
       breadth = b;
   }

   int Rectangle::area()
   {
       return length * breadth;
   }

   int Rectangle::perimeter()
   {
       return 2 * (length + breadth);
   }

   Rectangle::~Rectangle()
   {
       // FREE THE DYNAMICALLY ALLOCATED MEMORY
   }

   int main()
   {
       Rectangle r(10, 5);
       cout<<r.area();
       cout<<r.perimeter();
       r.setLength(20);
       cout<<r.getLength();

       // NOW DESTRUCTOR WILL AUTOMATICALLY CALLED WHEN THE OBJECT GOES OUTSIDE THE SCOPE
   }
   ```

3. C++ program supports generic(template) functions and generic(template) classes.

   ```cpp
   template <class T>
   class Arithmetic
   {
       private:
           T a;
           T b;

       public:
           Arithmetic(T a, T b);
           T add();
           T sub();
   };

   template <class T>
   Arithmetic<T>::Arithmetic(T a, T b)
   {
       // THIS REFERS TO CLASS MEMBER VARIABLES NOT THE FUNCTION VARIABLES
       this->a = a;
       this->b = b;
   }

   template <class T>
   T Arithmetic<T>::add()
   {
       T c;
       c = a + b;
       return c;
   }

   template <class T>
   T Arithmetic<T>::sub()
   {
       T c;
       c = a - b;
       return c;
   }

   int main()
   {
       Arithmetic<int> ar(10, 5);
       cout<<ar.add();

       Arithmetic<float> ar1(1.5, 2.3);
       cout<<ar1.add();
   }
   ```

### C/C++ Setup

For now, we will use [Dev-C++](https://www.bloodshed.net/dev/devcpp.html). Download the **with Mingw/GCC** version so that compiler will also be included.

Make the below changes in **Tools** --> **Compiler Options**:

1. In the **Compiler** section, tick mark **Add the following commands when calling compiler:** and add `-g` in the text available below. This helps while debugging the code.
2. Now, in **Programs** section, append `-std=c++99` to **gcc:** and **g++:** like `gcc.exe -std=c++11` and `g++.exe -std=c++11`. To use the latest C++ 11 standards.

## Arrays

_Definition:_ Contiguous area of memory consisting of equal-size elements.

_Example:_

```c
int main()
{
    // ARRAY OF INTEGERS OF LENGTH 5
    int A[5];

    // SIZE OF AN ARRAY CAN BE SKIPPED
    int B[] = { 1, 2, 3 }; // SIZE 3
}
```

Indexed by contiguous integers starting with 0 in case of C/C++.

- Arrays have constant-time access to any element and to add/remove at the end. Linear time to add/remove at an arbitrary location.

- To find the address of any element in an array use: `array_starting_address + element_size * (index_of_element - index_of_first_element)`

### Multi-Dimensional Arrays

- Row-major: if we stack all elements of an array as (1,1),(1,2)...,(1,n),(2,1),(2,2)...,(2,n)..., the column values change rapidly, hence Row-Major.
- Column-major: if we stack all elements of an array as (1,1),(2,1)...,(n,1),(1,2),(2,2)...,(n,2)..., the row values change rapidly, hence Column-Major.

### Performance

|     ~     | Add  | Remove |
| :-------: | :--: | :----: |
| Beginning | O(n) |  O(n)  |
|    End    | O(1) |  O(1)  |
|  Middle   | O(n) |  O(n)  |

::: tip NOTE
Most languages use zero-based indexing, some use one as the starting index, and some allow the user to specify the starting index.
:::

## Stack vs Heap

Stack Memory is also known as Static Memory, as the size is fixed and known during compile time.

Heap Memory is known as Dynamic Memory, as the size is known only during run time?.

- Memory is divided into a small addressable unit known as a _byte_.
- Large size memory will be divided into segments, usually of 64Kb.

Steps of execution of a program:

1. The program is copied into the code section of the memory.
2. All the variables will have memory allocation in Stack Frame or Activation Record of the function which is part of the Stack section of the memory. The main function will have the first Stack Frame inside the Stack Memory. The functions called by the main function and subsequent function's activation record will have to be saved as a Stack. Organized memory.

Abstract Data Type (ADT):

- Data Type is defined as:
  - Representation of Data
  - Operations allowed on Data

## Singly-Linked Lists

## References

1. [Udemy - Data Structures](https://tcsglobal.udemy.com/course/datastructurescncpp/learn/lecture/13319372#overview)
2. [Coursera - Data Structures](https://www.coursera.org/learn/data-structures)
3. [Udemy - Data Structures and Algorithms](https://tcsglobal.udemy.com/course/learn-data-structure-algorithms-with-java-interview/learn/lecture/13778082#overview)
4. [Topcoder - The importance of algorithms](https://www.topcoder.com/community/competitive-programming/tutorials/the-importance-of-algorithms/)
