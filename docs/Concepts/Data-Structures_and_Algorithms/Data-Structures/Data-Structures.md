---
title: Data Structures
description: A data structure is a particular way of organizing data in a computer.
---

# Data Structures

A **data structure is a data organization, management, and storage format** that enables efficient access and modification.

A data structure is a way to store and organize data in order to facilitate access and modifications. No single data structure works well for all purposes, and so it is important to know the strengths and limitations of several of them.

Data-structures can be envisioned as:

1. Mathematical / Logical models / Abstract data-types (ABTs): Define data and operations but no implementation details. Abstract view.

   - _Example:_ An abstract data-type: List
     - Store a given number of elements of a given data-type
     - Write/Modify elements at a position (index)
     - Read elements by position (index)

2. Implementation: Concrete implementation.

   - _Example:_ For the above mentioned List ABT, it can be implemented using:
     - Arrays
     - Linked Lists

## Introduction

There are two types of Data structures:

1. Physical: They define how the **data is arranged** in memory.

   - [Arrays](#arrays): Fixed length, Can be created in Stack or Heap memory
   - Linked List: Variable length, Created in Heap memory
   - Matrices

2. Logical: They define how the **data can be utilized**.

   - Linear Data Structures:

     - **Stack** (LIFO)
     - **Queues** (FIFO)

   - Non-Linear Data Structures:

     - **Tress**
     - **Graph**

   - Tabular (linear/non-linear):
     - **Hash Table**

### Problem solving vs programming

1. Problem-solving: It requires math to solve problems. And math does not have loops, it has [Recursion](./Recursion). It's a lifetime of work.

2. Programming: Learning the syntax of a language and implementing the solution in it.

## Stack vs Heap

_Stack Memory_ is also known as **Static Memory**, as the size is fixed and known during compile time.

_Heap Memory_ is known as **Dynamic Memory**, as the size is known only during run time?.

- Memory is divided into a small addressable unit known as a _byte_.
- Large size memory will be divided into _segments_, usually of _64Kb_.

_Stack memory allocation:_

1. The program is copied into the _code section_ of the memory.

2. All the variables will have memory allocation in **Stack Frame or Activation Record** of the function which is part of the Stack section of the memory.

3. The main function will have the first Stack Frame inside the Stack Memory. The functions called by the main function will occupy the second Stack Frame and hence subsequent function's activation record will be saved as a Stack. Organized memory.

4. The Stack Frame of each function will be deleted once the function execution completes.

5. The memory allocation and de-allocation is handled, user dose not need to manage it.

_Heap memory:_

- Memory stored as a heap (placed haphazardly on top of each other)
- Used as a resource
- Programs cannot directly access Heap memory, to access it we use [Pointers](#pointers)
- Memory allocation and de-allocation in Heap must be handled by the user.
- If the allocated memory is not released, then it will keep occupying space even when it is not needed. Then eventually the memory will be full and it will cause loss of memory (memory leak).

## Time And Space Complexity

There are often many approaches to solving a problem. How do we choose between them? At the heart of computer program design are two (sometimes conflicting) goals:

1. To design an algorithm that is easy to understand, code, and debug.

2. To design an algorithm that makes efficient use of the computer’s resources.

The method for evaluating the efficiency of an algorithm or computer program is called asymptotic analysis.

- A method for estimating the efficiency of an algorithm or computer program by identifying its growth rate. Asymptotic analysis also gives a way to define the inherent difficulty of a problem. We frequently use the term algorithm analysis to mean the same thing.
- Asymptotic analysis also gives a way to define the inherent difficulty of a problem.

Order of the polynomial equation or Big O: How time scales with respect to some input variables

- Usually `n` is used to denote the variable, any letter can be used

Rules:

1. Different steps get added: O(a) and O(b) will be added to O(a+b)

2. Drop constants: If the complexity is `2n`, the constant `2` is dropped and Big O is represented as O(n)

3. Different inputs should use different variables. So, instead of using `n` for two different arrays use `a` and `b`. So, Big O is O(a \* b) not O(n^2)

4. Drop non-dominate terms: If a function has two complexities such as O(n) and O(n^2). Drop O(n) and just use O(n^2)

- O(n):

  ```c
  // one for loop
  for (int i=0; i<n; i++) {
      /* Code */
      }
  ```

- O(n^2):

  ```c
  // one for loop
  for (int i=0; i<n; i++) {
      for (int i=0; i<n; i++) {
      /* Code */
      }
  }
  ```

Time functions

- Constant time beats linear if data is sufficiently big

Big-O

- How code slows as data grows
- Not the same as running time
- Big trend over time

Terminology:

- O(...n...)
- n: how much data
- O: "Order of"
- Not a function! (It's just a notation)

Terms:

- O(1): constant time (size of data dose not matter)
- O(n): linear
- O(n^2): quadratic
- Big-O:

  - complexity
  - time complexity
  - algorithmic complexity
  - asymptotic complexity

- Complexity is different for small numbers than large numbers
- Amortization:

  - Long-term averaging
  - Operations can take different times

- Worst case:
  - Typical case vs worst case

Static and Global variables:

## Singly-Linked Lists

## References

1. [Udemy - Data Structures](https://tcsglobal.udemy.com/course/datastructurescncpp/learn/lecture/13319372#overview)
2. [Coursera - Data Structures](https://www.coursera.org/learn/data-structures)
3. [Udemy - Data Structures and Algorithms](https://tcsglobal.udemy.com/course/learn-data-structure-algorithms-with-java-interview/learn/lecture/13778082#overview)
4. [Topcoder - The importance of algorithms](https://www.topcoder.com/community/competitive-programming/tutorials/the-importance-of-algorithms/)
