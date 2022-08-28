---
title: Sorting Techniques
description: Sorting Techniques
---

# Sorting Techniques

1. [Bubble](#bubble-sort) - `O(n^2)`
2. [Insertion](#insertion-sort) - `O(n^2)`
3. [Selection](#selection-sort) - `O(n^2)`
4. [Heap Sort](#heap-sort) - `O(n log2 n)`
5. [Merge Sort](#merge-sort) - `O(n log2 n)`
6. [Quick Sort](#quick-sort) - `O(n log2 n)`
7. [Tree Sort](#tree-sort) - `O(n log2 n)`
8. [Shell Sort](#shell-sort) - `O(n^(3/2))`
9. [Count Sort](#count-sort) - `O(n)`
10. [Bucket/Bin Sort](#bucket-bin-sort) - `O(n)`
11. [Radix Sort](#radix-sort) - `O(n)`

- In the above list 1-8 are called _Comparison based Sorts_
- And 9-11 are called _Index based Sorts_

## Criteria For Analysis

1. Number of Comparisons
2. Number of Swaps
3. Adaptive: Less time to sort an already sorted list
4. Stable
5. Extra Memory

## Bubble Sort

For an array of size `n` at worst case:

- Number of Passes: `n-1`
- Max Number of Comparisons: `(n * (n - 1)) / 2` --> `O(n^2)`
- Max Number of Swaps: `(n * (n - 1)) / 2` --> `O(n^2)`

It can be used to get some number of elements sorted, like finding the largest number Bubble Sort with 1 pass. The last element will be the largest element.

```c
void Bubble_Sort(int A[], int n)
{
    int i, j, temp = 0;
    int flag;                           // For making the sort Adaptive

    for (i = 0; i < n - 1; i++)
    {
        flag = 0;

        for (j = 0; j < n - i - 1; j++)
        {
            if (A[j] > A[j + 1])
            {
                temp = A[j + 1];
                A[j + 1] = A[j];
                A[j] = temp;

                flag = 1;
            }
        }

        if (flag == 0)
            break;
    }
}
```

- By using a flag we can make it Adaptive.
- For an Adaptive sort it will perform:
  - Comparisons: `n-1`
  - Swaps: `0`
  - Performance: `O(n)`

Bubble Sort takes:

- Min: `O(n)`
- Max: `O(n^2)`

Bubble sort is Adaptive and Stable

## Insertion Sort

For an array of size `n` at worst case:

- Number of Passes: `n-1`
- Max Number of Comparisons: `(n * (n - 1)) / 2` --> `O(n^2)`
- Max Number of Swaps: `(n * (n - 1)) / 2` --> `O(n^2)`

Insertion is better for Linked List than Arrays.

If the list is already sorted:

- Max Number of Comparisons: `n - 1` --> `O(n)`
- Max Number of Swaps: `0` --> `O(1)`

- By nature it is Adaptive
- It is Stable

|                | Bubble Sort | Insertion Sort |             Cases |
| -------------- | ----------: | -------------: | ----------------: |
| Min Comparison |        O(n) |           O(n) |    Already Sorted |
| Max Comparison |      O(n^2) |         O(n^2) | Sorted in Reverse |
| Min Swap       |        O(1) |           O(1) |    Already Sorted |
| Max Swap       |      O(n^2) |         O(n^2) | Sorted in Reverse |
| Adaptive       |         Yes |            Yes |                   |
| Stable         |         Yes |            Yes |                   |
| Linked List    |           - |            Yes |                   |
| k Passes       |         Yes |             No |                   |

## Selection Sort

- We get smallest number after just one pass

For an array of size `n` at worst case:

- Number of Passes: `n-1`
- Max Number of Comparisons: `(n * (n - 1)) / 2` --> `O(n^2)`
- Max Number of Swaps: `n-1` --> `O(n)`

- Is is not Adaptive
- It is not Stable

## Quick Sort

- Partitioning procedure

- Not suited for sorted list or reverse sorted list

- Randomized Quick Sort

- Selection Exchange Sort
- Partition Exchange Sort

## Merge Sort

Merging 2 Sorted Arrays to create a new sorted array.

- `O(n log2 n)`

## Count Sort

- Index based sorting

## Bucket/Bin Sort

## Shell Sort

Uses [Insertion Sort](#insertion-sort)
