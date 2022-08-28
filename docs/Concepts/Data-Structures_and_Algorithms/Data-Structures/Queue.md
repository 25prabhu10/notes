---
title: Queue
description: Queue
---

# Queue

A Queue is an abstract data type that serves as a collection of elements, with two main principal operations:

1. **Enqueue**: Which adds an element to the collection

2. **Dequeue**: Which removes the most recently added element that was not yet removed

**FIFO**: First-in First-out it is the order in which elements are pushed and popped. Similar to a real life queue, new element is inserted at the rear end of the queue and an element is only removed at the front end of the queue.

_Queue representation:_ :)

```c
//       |   |--> out
//       | 4 |
//       | 6 |
//       | . |
//       | . |
//       | . |
//       | 9 |
//       | 7 |
// in -->|   |
```

## Abstract Data Type

Data:

- Space for storing elements
- Front pointer: for deletion
- Rear pointer: for Insertion

Operations:

- Enqueue
- Dequeue
- isEmpty
- isFull
- First: check the first element
- Last: check the last element

The queue can be implemented using:

- [Arrays](#arrays)
- [Linked List](#linked-list)

### Arrays

1. Queues using single pointer:

   - New element will be inserted at the rare: Operation `O(1)`
   - Element will be removed from the front `A[0]` and all the remaining elements will be shifted to one position lower i.e. `A[i] = A[i + 1]`: Operation `O(n)`

   _Example:_

   ```c
   struct Queue
   {
       int size;
       int rear;
       int *A;
   };

   void Display(struct Queue queue)
   {
       int i;

       for (i = 0; i <= queue.rear; i++)
           printf("%d ", queue.A[i]);
   }

   void Enqueue(struct Queue *queue, int x)
   {
       if (queue->rear >= queue->size - 1)
           printf("Stack-overflow!!!");

       queue->rear++;
       queue->A[queue->rear] = x;
   }

   int Dequeue(struct Queue *queue)
   {
       int x, i;

       if (queue->rear < 0)
       {
           printf("Stack-underflow!!!");
           return -1;
       }

       x = queue->A[0];

       for (i = 0; i < queue->rear; i++)
           queue->A[i] = queue->A[i + 1];

       queue->A[i] = 0;
       queue->rear--;

       return x;
   }

   int isEmpty(struct Queue *queue)
   {
       return queue->rear == -1;
   }

   int isFull(struct Queue *queue)
   {
       return queue->rear == queue->size - 1;
   }
   ```

2. Queues using two pointer:

   - New element will be inserted at the rare: Operation `O(1)`
   - An element deletion will remove the first element: Operation `O(1)`

   _Example:_

   ```c
   struct Queue
   {
       int size;
       int front;
       int rear;
       int *A;
   };

   void Display(struct Queue queue)
   {
       int i;

       for (i = queue.front + 1; i <= queue.rear; i++)
           printf("%d \n", queue.A[i]);
   }

   void Enqueue(struct Queue *queue, int x)
   {
       if (queue->rear >= queue->size - 1)
           printf("Stack-overflow!!!");

       queue->rear++;
       queue->A[queue->rear] = x;
   }

   int Dequeue(struct Queue *queue)
   {
       int x;

       if (queue->rear == queue->front)
       {
           printf("Stack-underflow!!!");
           return -1;
       }

       queue->front++;

       x = queue->A[queue->front];
       queue->A[queue->front] = 0;

       return x;
   }

   int isEmpty(struct Queue *queue)
   {
       return queue->rear == queue->front;
   }

   int isFull(struct Queue *queue)
   {
       return queue->rear == queue->size - 1;
   }
   ```

Drawbacks of using Arrays:

- If rare of the Queue is at the last element and front is larger than 0 that means that array has some empty space at the start. So, even though there the array has empty space we cannot add new elements as `rare == size` and new elements are added from the rare.
- Every space in an array is only used once.

Workaround:

- **Resetting Pointers**: While dequeueing if front and rear are same then reset both and make them `-1`. Not always front and rear are equal, hence this method is good only when all elements are deleted.
- **[Circular Queue](#circular-queue)**

## Circular Queue

- Front and rear move in a circular way and array is not circular.

## Using Linked List

## Double Ended Queue (DEQueue)

- It strictly doesn't follow FIFO. FIFO can be used
- Both front and rear can be used for insertion and deletion

| Operation | Queue | DEQueue |
| --------- | ----- | ------- |
| Insert    | rear  | Both    |
| Delete    | front | Both    |

Variants of DEQueue:

1. Input Restricted: Insertion can only happen from rear

   |       | Insert | Delete |
   | ----- | ------ | ------ |
   | front | -      | Y      |
   | rear  | Y      | Y      |

2. Output Restricted: Deletion can only happen from front

   |       | Insert | Delete |
   | ----- | ------ | ------ |
   | front | Y      | Y      |
   | rear  | Y      | -      |

## Priority Queues

1. Limited set of Priorities:

   - Useful in OS

2. Element Priority

   - Two ways:
     - Insert in same order as they come and delete max-priority by search: Operation: Insert - `O(1)`, Delete - `O(n)`
     - Insert in increasing/decreasing order of Priority and Delete last/first element: Operation: Insert - `O(n)`, Delete - `O(1)`

## Queue using 2 Stacks
