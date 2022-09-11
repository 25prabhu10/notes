# Key Words

1. **Predicate Functions**: are functions that return a single TRUE or FALSE

2. **Turing Complete**, **Church-Turing Thesis**: Something is "computable" if and only if it can be computed by a **Turing machine**

   - Conditional branching, as a result it should have the ability to jump ("go to")
   - Arbitrary amount of memory (infinite RAM)

3. **Race Condition**: occurs when two or more threads can access shared data and they try to change it at the same time.

   - Because the thread scheduling algorithm can swap between threads at any time, you don't know the order in which the threads will attempt to access the shared data

   - Therefore, the result of the change in data is dependent on the thread scheduling algorithm, i.e. both threads are **"racing" to access/change the data**.
