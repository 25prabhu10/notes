---
title: Graph
description: A collection of nodes that have data and are connected to other nodes
---

# Graph

A collection of nodes that have data and are connected to other nodes

A graph is a data structure (V, E) that consists of:

- A collection of vertices (V) or Nodes
- A collection of edges (E), represented as ordered pairs of vertices (u,v)

## Graph Terminology

- **Adjacency**: A vertex is said to be adjacent to another vertex if there is an edge connecting them

- **Path**: A sequence of edges that allows you to go from vertex A to vertex B is called a path

- **Directed Graph**: A graph in which an edge (u,v) doesn't necessarily mean that there is an edge (v, u) as well. The edges in such a graph are represented by arrows to show the direction of the edge

- Undirected graph
- Neighbor

## Graph Representation

Graphs are commonly represented in 2 ways:

1. Adjacency Matrix: An adjacency matrix is a 2D array of V x V vertices. Each row and column represent a vertex

   - If the value of any element `a[i][j]` is 1, it represents that there is an edge connecting vertex `i` and vertex `j`

   - Edge lookup(checking if an edge exists between vertex A and vertex B) is extremely fast

   - **Requires more space**

2. **Adjacency List**: An adjacency list represents a graph as an array of linked lists

   - The index of the array represents a vertex and each element in its linked list represents the other vertices that form an edge with the vertex

   - An adjacency list is efficient in terms of storage because we only need to store the values for the edges

## Traversal Algorithms

1. Breath first search (BFS):

   - Using Queue

   - Best for finding all possible routes, then use it to find the most efficient

2. Depth first search (DFS):

   - Using Stack

   - Fastest way to find a route

- Both `O(v+e)` hence `O(n)`

## Performance

- `n`: number of nodes
- `e`: number of edges

Time: `O(e)`
Space: `O(n)`

or

- `n`: number of nodes
- `n^2`: number of edges

Time: `O(n^2)`
Space: `O(n)`
