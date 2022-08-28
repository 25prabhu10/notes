---
title: Trees
description: Trees
---

# Trees

1. Root
2. Parent
3. Child
4. Siblings
5. Descendants
6. Ancestors
7. Degree of a node
8. Internal / External nodes
9. Levels
10. Height
11. Forest

## Binary Tree

A Binary Tree is a tree with degree of node _2_.

- Every node can have a maximum 2 children. It can have 0, 1, or 2 children.

### Number Of Binary Tress

1. For Unnamed Nodes the number of Binary Tress that can be generated using `n` Node is calculated using _Catalan Number_:

   - `T(n) = (2nCn)/(n + 1)`

     - `T(3) = 5`
     - `T(4) = 14`
     - `T(5) = 42`

   - `T(n) = [(i=1) SUMATION n] T(i - 1) * T(n - i)`

   - Number of Binary Tress with Max height containing `n` Node: `2^n-1`

2. For Named Nodes the number of Binary Tress that can be generated using `n` Node is calculated using:

   - `T(n) = ((2nCn)/(n + 1)) * n!`

### Height vs Nodes Of Binary Tree

- For Height `h` the:

  - Min number of Nodes required: `min(n) = h + 1`
  - Max number of Nodes required: `max(n) = 2^(h + 1) - 1` (Sum of G-P Series with `a=1` and `r=2`)

- For `n` Nodes the:

  - Min Height: `min(n) = (log2 (n + 1)) - 1`
  - Max Height: `max(h) = n - 1`

- Relation between Degrees:
  - `deg(0) = deg(2) + 1`

## Strict / Proper / Complete Binary Tree

A Binary Tree is a Strict Binary Tree if every node has either degree 0 or 2. Should not contain nodes with degree 1 (node with 1 child).

### Height vs Nodes

- For Height `h` the:

  - Min number of Nodes required: `min(n) = (2 * h) + 1`
  - Max number of Nodes required: `max(n) = 2^(h + 1) - 1` (Sum of G-P Series with `a=1` and `r=2`)

- For `n` Nodes the:

  - Min Height: `min(h) = (log2 (n + 1)) - 1`
  - Max Height: `max(h) = (n - 1)/2`

- External Binary Nodes to Internal Binary Nodes: `e = i + 1`

## N-Array Tree

### Strict N-Array Tree

#### Height vs Nodes Of Strict N-Array Tree

- For Height `h` with degree `m` the:

  - Min number of Nodes required: `min(n) = (m * h) + 1`
  - Max number of Nodes required: `max(n) = (m^(h + 1) - 1)/(m - 1)` (Sum of G-P Series with `a=1` and `r=m`)

- For `n` Nodes with degree `m` the:

  - Min Height: `min(h) = logm [n(m - 1) + 1] - 1`
  - Max Height: `max(h) = (n - 1)/m`

- External Binary Nodes to Internal Binary Nodes with degree `m`: `e = (m - 1)*i + 1`

## Array Representation

## Linked List Representation

## Full vs Complete Binary Tree

## Strict vs Complete Binary Tree

## Tree Traversal

Tree traversing means visiting all the nodes.

1. Pre-order:

   - Visit (node)
   - Pre-order (left sub-tree)
   - Pre-order (right sub-tree)

2. In-order:

   - In-order (left sub-tree)
   - Visit (node)
   - In-order (right sub-tree)

3. Post-order:

   - Post-order (left sub-tree)
   - Post-order (right sub-tree)
   - Visit (node)

4. Level-Order: Level by Level

Generating Tree if Traversal is provided:

1. If only Pre-order or In-order or Post-order is provided: Not possible to reproduce
2. If only Pre-order and Post-order are provided: Not possible to reproduce
3. If only Pre-order and In-order or Post-order and In-order are provided: It is **possible to reproduce**

## Binary Search Tree (BST)

- No Duplicates
- In-order Traversal will give sorted order
- Number of BST for `n` nodes: `(2nCn)/(n+1)`
- Usually represented using Doubly Linked List

Drawbacks of Binary Search Tree:

- No control over the height of the BST as it depends on the order of input.

## AVL Tree

Height balanced Binary Search Tress.

It uses balance factor to balance the height:

- balance factor = height of left subtree - height of right subtree
- Balance factor is calculated at each node
- The balance factor must be any one of these: `{ -1, 0 1 }`
- `bf = |hl - hr| <= 1` it is balanced
- If `bf = |hl - hr| > 1` then it is imbalanced

### Rotations At the time on insertion

1. LL - Rotation
2. RR - Rotation
3. LR - Rotation
4. RL - Rotation

### Generating AVL Tree

### Deletion

1. L1 - Rotation --> (LL Rotation)
2. L-1 - Rotation --> (LR Rotation)
3. L0 - Rotation --> (LL or LR Rotation)
4. R1 - Rotation --> (RR Rotation)
5. R-1 - Rotation --> (RL Rotation)
6. R0 - Rotation --> (RR or RL Rotation)

### Height vs Nodes of AVL Tree

- For Height `h` the if `h` starts from 1:

  - Min number of Nodes required: (Fibonacci Series)

    - For 0: 0
    - For 1: 1
    - For >1: `min(n) = min(h - 2) + min(h - 1) + 1`

  - Max number of Nodes required: `max(n) = 2^h - 1` (Sum of G-P Series with `a=1` and `r=2`)

- For `n` Nodes the:

  - Min Height: `min(h) = log2 (n + 1)`
  - Max Height: `max(h) = 1.44 log2 (n + 2)`

- External Binary Nodes to Internal Binary Nodes: `e = i + 1`

## 2 - 3 Trees

- Multiway Search Tree (m-way)
- Degree 3
- Height Balanced Tree (B-tree)
- All leaf nodes at same level
- Every node must have `n/2` children
- No duplicates

- B Trees or B+ Trees
- Used largely in DBMS

### Height vs Nodes Of 2-3 Trees

- For Height `h` the if `h` starts from 1:

  - Min number of Nodes required: `max(n) = 2^(h + 1) - 1`
  - Max number of Nodes required: `max(n) = (3^(h + 1) - 1)/2`

- For `n` Nodes the:

  - Min Height: `min(h) = (log2 (n - 1)) - 1`
  - Max Height: `max(h) = (log3 (2n + 1)) - 1`

- External Binary Nodes to Internal Binary Nodes: `e = i + 1`

## 2 - 3 - 4 Trees

- B-Tree of degree = 4
- Every node must have `n/2 = 4/2 = 2` children
- All leaf at same level

- Can be split as Left biased or Right biased if even number of keys are present

## Red - Black Trees

- Its a height balanced Binary Search Tree
- Every node is either **Red** or **Black**
- Root of a Tree is Black
- NULL is also Black
- Number of Blacks on Paths from Root to leaf are same
- No 2 consecutive Red, Parent and Children of Red are Black
- New Inserted Node is Red
- Height in `log n <= h <= 2 * log n`

- Recolour if Red-Red conflict where Parent and Uncle are Red
- Do Zig-Zig (LL/RR) or Zig-Zag (LR/RL) Rotation if Red-Red conflict where Parent is Red and Uncle are Black

## Binary Heap

- Complete Binary Tree is called a Heap
- Duplicates are allowed
- Min Heap: Where the every node is smaller than or equal to its dependents
- Max Heap: Where the every node is greater than or equal to its dependents

Placement in an Array:

- Node at `i`
- Left child at `2 * i`
- Right child at `2 * i + 1`

- In-place replacement

- We can only delete root node

### Heapify

Faster way to create Heap

### Binary Heap As Priority Queue
