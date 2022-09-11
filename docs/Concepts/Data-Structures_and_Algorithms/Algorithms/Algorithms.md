---
title: Algorithms
description: A process or set of rules to be followed in calculations or other problem-solving operations.
---

# Algorithms

Informally, an **algorithm** is any well-defined computational procedure that takes some value, or set of values, as **input** and produces some value, or set of values, as **output**. An algorithm is thus a sequence of computational steps that transform the input into the output.

An algorithm is said to be **correct** if, for every input instance, it halts with the correct output.

## Asymptotic Notation

The efficiency of an algorithm depends on the amount of time, storage and other resources required to execute the algorithm. The efficiency is measured with the help of asymptotic notations.

The study of change in performance of the algorithm with the change in the order of the input size is defined as **asymptotic analysis**.

**Asymptotic notations** are the mathematical notations used to describe the running time of an algorithm when the input tends towards a particular value or a limiting value.

- Algorithm times are measured in terms of _growth_ of an algorithm.

### Logarithm

"How many 2's do we multiply together to get 128?" --> **log2 128 = 7**

### Big O

_Big O_ notation is special notation that tells how fast an algorithm is.

- **Dominant term** of the function is taken for consideration

- Big-O notation represents the upper bound of the running time of an algorithm.

- Thus, it gives the **worst-case complexity** of an algorithm.

"Big O notation is a mathematical notation that describes the limiting behavior of a function when the argument tends towards a particular value or infinity. It is a member of a family of notations invented by Paul Bachmann, Edmund Landau, and others, collectively called Bachmann–Landau notation or asymptotic notation."

### Other Notations

1. Big O: `"f(n) is O(g(n))"` iff (if and only if) for some constants `c` and `N₀`, `f(N) ≤ cg(N)` for all `N > N₀`

   - **Big O (`O()`)** describes the **upper bound** of the complexity.

2. Omega: `"f(n) is Ω(g(n))"` iff for some constants c and `N₀`, `f(N) ≥ cg(N)` for all `N > N₀`

   - **Omega (`Ω()`)** describes the **lower bound** of the complexity.

   - Omega notation represents the lower bound of the running time of an algorithm.

   - Thus, it provides the **best case complexity** of an algorithm.

3. Theta: `"f(n) is Θ(g(n))"` iff `f(n)` is `O(g(n))` and `f(n)` is `Ω(g(n))`

   - **Theta (`Θ()`)** describes the **exact bound** of the complexity.

   - Theta notation encloses the function from above and below.

   - Since it represents the upper and the lower bound of the running time of an algorithm, it is used for analyzing the **average-case complexity** of an algorithm.

4. Little O: `"f(n) is o(g(n))"` iff `f(n)` is `O(g(n))` and `f(n)` is not `Θ(g(n))`

   - **Little O (`o()`)** describes the **upper bound excluding the exact bound**.

_Example:_

The function `g(n) = n² + 3n` is:

- `O(n³)`
- `o(n⁴)`
- `Θ(n²)`
- `Ω(n)`

But you would still be right if you say it is `Ω(n²)` or `O(n²)`

## Data Structures

Check out [Data Structures](./../Data-Structures/)

## Call Stack

A call stack is a [_stack data structure_](../Data-Structures/Stack.md) that stores information about the active subroutines of a computer program.

- The order in which elements come off a stack gives rise to its alternative name, **LIFO** (last in, first out).

## Coding Techniques

- Master Theorem

### Divide & Conquer

A **divide and conquer algorithm** is a strategy of solving a large problem by

1. Breaking the problem into smaller sub-problems
2. Solving the sub-problems, and
3. Combining them to get the desired output.

Divide & Conquer is an algorithm design paradigm based on multi-branched [Recursion](./Recursion.md).

A divide-and-conquer algorithm works by recursively breaking down a problem into two or more sub-problems of the same or related type, until these become simple enough to be solved directly.

The solutions to the sub-problems are then combined to give a solution to the original problem.

It's applications:

- [Binary Search](./Searching_Algorithms.md#binary-search)
- [Merge Sort](./Sorting_Algorithms.md#merge-sort)
- [Quick Sort](./Sorting_Algorithms.md#quick-sort)
- Finding the GCD is an use case of D&C.
- Check Euclid's algorithm for GCD.
- Strassen's Matrix multiplication
- Karatsuba Algorithm

## NP-Complete Problems

### The Traveling Salesperson problem

Performance:

- **O(n!)**

Implementation

## Famous Algorithms

- Dynamic programming
- Greedy algorithm

  - Dijkstra's Shortest Path algorithm

- Backtracking

## References

1. _Grokking Algorithms: An illustrated guide for programmers and other curious people_, by Adiya Y. Bhargava.
