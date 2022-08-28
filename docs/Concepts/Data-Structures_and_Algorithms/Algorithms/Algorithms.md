---
title: Algorithms
description: A process or set of rules to be followed in calculations or other problem-solving operations.
---

# Algorithms

Informally, an **algorithm** is any well-defined computational procedure that takes some value, or set of values, as **input** and produces some value, or set of values, as **output**. An algorithm is thus a sequence of computational steps that transform the input into the output.

An algorithm is said to be **correct** if, for every input instance, it halts with the correct output.

## Big O

_Big O_ notation is special notation that tells how fast an algorithm is.

- Algorithm times are measured in terms of _growth_ of an algorithm.

### Logarithm

"How many 2's do we multiply together to get 128?" --> **log2 128 = 7**

## Data Structures

### Arrays

Array is a data structure consisting of a collection of elements, each element is stored contiguously (right next to each other) in memory.

- They are used when the size of elements is already known, as adding new element requires a free memory next to the last element, else the whole array needs to be moved to a new memory location with enough space. If there is no space to accommodate the whole array, it may cause memory issues.
- As the memory location of each element can be determined easily, it is very fast in getting an element from anywhere in the array.
- All elements in the array should be the same type (all integers or all doubles or all strings and so on).

### Linked Lists

Linked list is a linear collection of data elements, whose order is not given by their physical placement in memory. Instead, each element points to the next.

- They are used when the size of elements is not known or may increase.
- As the memory location of each element is not known beforehand, it is very difficult to find the element. To find an element we need to start from the first element, get the address of the next element and so on, till the element is found.

### Performance

|           | Arrays | Lists |
| :-------- | :----: | ----: |
| Reading   |  O(1)  |  O(n) |
| Insertion |  O(n)  |  O(1) |
| Deletion  |  O(n)  |  O(1) |

### Call Stack

A call stack is a _stack data structure_ that stores information about the active subroutines of a computer program.

- The order in which elements come off a stack gives rise to its alternative name, **LIFO** (last in, first out).

## Coding Techniques

### Recursion

Recursion is when a function calls itself.

Lets us look at two approaches to find a key present in one of the boxes (arranged in _Matryoshka Dolls_ manner).

1. First approach uses `while` loop:

   ```python
   def look_for_key(main_box):
       pile = main_box.make_a_pile_to_look_through()
       while pile is not empty:
           box = pile.grab_a_box()
           for item in box:
               if item.is_a_box():
                   pile.append(item)
               elif item.is_a_key():
                   return "Found the key!"
   ```

2. Second way uses _Recursion_:

   ```python
   def look_for_key(box):
       for item in box:
           if item.is_a_box():
               # Recursion!
               look_for_key(item)
           elif item.is_a_key():
               return "Found the key!"
   ```

_Example:_

```javascript
// node.js traversing filesystem
const fs = require("fs");
const { join } = require("path");

const traverse = (dir) => {
  const subFolders = fs.statSync(dir).isDirectory() && fs.readdirSync(dir);

  if (subFolders) {
    console.log("👟👟👟 Traversing ", dir);

    subFolders.forEach((path) => {
      const fullPath = join(dir, path);

      traverse(fullPath); // recursive function call
    });
  }
};

traverse(process.cwd());
```

When a recursive function is written, we need to tell it to stop recursing.
That's why _every recursive function has two parts: the base case, and the recursive case_.

- The recursive case is when the function calls itself.
- The base case is when the function doesn't call itself (stop).

Recursive functions use the _call stack_ to keep track of function calls and function related variables.

```python
# Factorial Function
def factorial(x):
    # Base case
    if x == 1:
        return 1
    # Recursive case
    else:
        return x * factorial(x - 1)
```

#### Note

- Sometimes loops are better for performance.
- If written incorrectly recursive function results in **infinite loop**.
- Recursive algorithms tend to be **very efficient when traversing tree like data structures**

Using the stack takes up a lot of memory.

- Rewrite the code to use loop instead, to save space.
- Or use something called _tail recursion_. Which is only supported by some languages.

> Quote by Leigh CaldWell on [Stack Overflow](http://stackoverflow.com/a/72694/139117)

### Divide & Conquer

Divide & Conquer is an algorithm design paradigm based on multi-branched recursion. A divide-and-conquer algorithm works by recursively breaking down a problem into two or more sub-problems of the same or related type, until these become simple enough to be solved directly. The solutions to the sub-problems are then combined to give a solution to the original problem.

- Finding the GCD is an use case of D&C.
- Check Euclid's algorithm for GCD.

## Search

### Simple Search

Performance

- **O(n)**

Implementation:

### Binary Search

- **O(log n)**

Implementation

```python
def binary_search(list, item):
    low = 0
    high = len(list) - 1

    while low <= high:
        mid = (low + high)
        guess = list[mid]
        if guess == item:
            return mid
        elif guess > item:
            high = mid - 1
        else:
            low = mid + 1
    return None
```

::: tip Note
Binary Search only works when the list is in **sorted order**.
:::

## NP-Complete Problems

### The Travelling Salesperson problem

Performance:

- **O(n!)**

Implementation

## Sorting

### Selection Sort

Selection sort is an in-place comparison-based algorithm in which the list is divided into two parts, the sorted part at the left end and the unsorted part at the right end. Initially, the sorted part is empty and the unsorted part is the entire list.

The smallest element is selected from the unsorted array and swapped with the leftmost element, and that element becomes a part of the sorted array. This process continues moving unsorted array boundary by one element to the right.

Performance

- **O(n^2)**
- Each element is compared in every operation, with number of operations same as the number of elements. With each operation an element is moved to the new array, so one less element to be compared in the next operation. On an average, (1/2)n elements are compared for each operation. Thus, the runtime is **O(n x (1/2)n)**. But constants like _(1/2)_ are ignored in Big O. So the runtime is written as _O(n^2)_.

Implementation

```python
def find_smallest(arr):
    smallest = arr[0]
    smallest_index = 0
    for i in range(1, len(arr)):
        if arr[i] < smallest:
            smallest = arr[i]
            smallest_index = i
    return smallest_index

# Selection Sort
def selection_sort(arr):
    newArr = []
    for i in range(len(arr)):
        smallest = find_smallest(arr)
        newArr.append(arr.pop(smallest))
    return newArr
```

### Quicksort

- It uses Divide & Conquer technique.
- _Inductive proofs_

### Famous Algorithms

- Dynamic programming
- Greedy algorithm

  - Dijkstra's Shortest Path

- Backtracking

## References

1. _Grokking Algorithms: An illustrated guide for programmers and other curious people_, by Adiya Y. Bhargava.
