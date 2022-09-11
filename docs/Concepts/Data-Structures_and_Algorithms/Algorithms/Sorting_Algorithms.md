---
title: Sorting Algorithms
description: Sorting Algorithms
---

# Sorting Algorithms

1. [Bubble](#bubble-sort): `O(n^2)`
2. [Insertion](#insertion-sort): `O(n^2)`
3. [Selection](#selection-sort): `O(n^2)`
4. [Heap Sort]: `O(n log2 n)`
5. [Merge Sort](#merge-sort): `O(n log2 n)`
6. [Quick Sort](#quick-sort): `O(n log2 n)`
7. [Tree Sort]: `O(n log2 n)`
8. [Shell Sort](#shell-sort): `O(n^(3/2))`
9. [Count Sort](#count-sort): `O(n)`
10. [Bucket/Bin Sort] : `O(n)`
11. [Radix Sort] : `O(n)`

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

Selection sort is an in-place comparison-based algorithm in which the list is divided into two parts, the sorted part at the left end and the unsorted part at the right end. Initially, the sorted part is empty and the unsorted part is the entire list.

The smallest element is selected from the unsorted array and swapped with the leftmost element, and that element becomes a part of the sorted array. This process continues moving unsorted array boundary by one element to the right.

- We get smallest number after just one pass

- Each element is compared in every operation, with number of operations same as the number of elements. With each operation an element is moved to the new array, so one less element to be compared in the next operation. On an average, (1/2)n elements are compared for each operation. Thus, the runtime is **O(n x (1/2)n)**. But constants like _(1/2)_ are ignored in Big O. So the runtime is written as _O(n^2)_.

For an array of size `n` at worst case:

- Number of Passes: `n-1`
- Max Number of Comparisons: `(n * (n - 1)) / 2` --> `O(n^2)`
- Max Number of Swaps: `n-1` --> `O(n)`

- Is is not Adaptive
- It is not Stable

_Implementations:_

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

## Quick Sort

- It uses [Divide & Conquer](./Algorithms.md#divide--conquer) technique.

- Partitioning procedure

- Not suited for sorted list or reverse sorted list

- _Inductive proofs_

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
