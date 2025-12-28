---
title: Dynamic Programming
description: Dynamic Programming
date: 2023-08-06
---

# Dynamic Programming

Dynamic programming is an optimization technique that solves complex problems by solving smaller sub-problems once and reusing their solutions instead of recomputing them. It is used to solve problems that can be broken down into overlapping sub-problems

1. Solve a problem
2. Store the results of sub-problems
3. Reuse stored results

_Example:_ Fibonacci series

- It is a sequence of numbers in which each number is the sum of the two preceding ones, starting from `0` and `1` (`0`, `1`, `1`, `2`, `3`, `5`, `8`, `13`, `21`, ...)

Recursive solution:

- Time complexity: `O(2^n)` (exponential)
- This solution is not efficient because it recalculates the same sub-problems multiple times
- `fibonacciSequence(1)` is called `5` times for `fibonacciSequence(10)`

```javascript
function fibonacciSequence(num) {
  if (num < 2) return num;

  return fibonacciSequence(num - 1) + fibonacciSequence(num - 2);
}
```

Dynamic programming solution:

- Time complexity: `O(n)`
- Overlapping sub-problems: All `fibonacciSequence(n)` for `n` are calculated multiple times in the recursive solution hence it has overlapping sub-problems

```javascript
function genFibonacciSeries(num, memo) {
  // 0, 1
  if (num <= 1) return num;

  if (memo[num] != undefined) {
    return memo[num];
  }

  const fibNum = genFibonacciSeries(num - 1, memo) + genFibonacciSeries(num - 2, memo);

  memo[num] = fibNum;

  return fibNum;
}

function fibonacciSequence(num) {
  const memo = {};

  return genFibonacciSeries(num, memo);
}

console.log("0", fibonacciSequence(0));
console.log("1", fibonacciSequence(1));
console.log("2", fibonacciSequence(2));
console.log("3", fibonacciSequence(3));
console.log("4", fibonacciSequence(4));
console.log("5", fibonacciSequence(5));
console.log("6", fibonacciSequence(6));
console.log("7", fibonacciSequence(7));
```

## Core Properties

1. **Optimal Substructure**: An optimal solution can be constructed from optimal solutions of its sub-problems

2. **Overlapping Sub-problems**: A problem is said to have **overlapping sub-problems** if the problem can be broken down into sub-problems which are reused several times
