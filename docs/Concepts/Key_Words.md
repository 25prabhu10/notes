# Key Words

1. **Predicate Functions**: are functions that return a single TRUE or FALSE

2. **Turing Complete**, **Church-Turing Thesis**: Something is "computable" if and only if it can be computed by a **Turing machine**
   - Conditional branching, as a result it should have the ability to jump ("go to")
   - Arbitrary amount of memory (infinite RAM)

3. **Race Condition**: occurs when two or more threads can access shared data and they try to change it at the same time
   - Because the thread scheduling algorithm can swap between threads at any time, you don't know the order in which the threads will attempt to access the shared data

   - Therefore, the result of the change in data is dependent on the thread scheduling algorithm, i.e. both threads are **"racing" to access/change the data**

   - Pure functions can help in avoiding race condition issues

4. **Adversity Paradox**: The idea that we get stronger from stresses in our lives

5. The 5 o'clock rule: The level of abstraction for solving a problem will bubble up until it allows the average developer to stop thinking about the problem

6. Working set overflow: The "working set" is short hand for "parts of memory that the current algorithm is using" and is determined by which parts of memory the CPU just happens to access

7. P95 Latency (P% Latency): The P95 Threshold indicates that 5% of transaction durations are greater than the threshold. For example, if the P95 threshold is 50 milliseconds, then 5% of transactions exceeded that threshold, taking longer than 50 milliseconds

8. Software Rot

9. Use-After-Free (UAF) is a vulnerability related to incorrect use of dynamic memory during program operation

10. Write-what-where Condition: Any condition where the attacker has the ability to write an arbitrary value to an arbitrary location, often as the result of a buffer overflow.

11. Global Offset Table (GOT): is a section of a computer program's (executables and shared libraries) memory used to enable computer program code compiled as an ELF file to run correctly, independent of the memory address where the program's code or data is loaded at runtime.

12. Convex hull

Things to learn:

- Dynamic Programming
- Bit Manipulation
- Backtracking
- Monotonic Stacks
- Union Find
- Tries
- Prefix Sum
- Topological Sort

RAII (Resource acquisition is initialization)

## English Words

1. **Autological** (adjective: `Au.to.log.i.cal`): Denoting any word which describes itself

   _Examples_:
   - `Poly.y.syl.lab.ic`: (of a word) having more than one syllable. It is Autological because it has more than one syllable (its own definition)
   - Pronounceable: A word which can be pronounced
   - Unhyphenated: A word which does not contain a hyphen
   - Noun: A word which is a person, place, thing, or idea

2. **Heterological** (adjective: `Het.er.o.log.i.cal`): Denoting any word which does not describe itself
   - Opposite of Autological

   _Examples_:
   - `Mon.o.syl.lab.ic`: (of a word) having only one syllable, but the word itself is polysyllabic

## The Grelling-Nelson Paradox

The Grelling-Nelson Paradox is a self-referential paradox that arises when one considers whether the word "heterological" is heterological. The word "heterological" is defined as a word that does not describe itself. If "heterological" is heterological, then it describes itself, which contradicts its own definition. If "heterological" is not heterological, then it does not describe itself, which means it is heterological. This paradox is similar to the liar paradox, which arises when one considers the sentence "This statement is false."

- Kurt Grelling (1886-1942) and Leonard Nelson (1882-1927) were German philosophers

For any given word 'X':

- The word 'X' describes itself
- The word 'X' does not describe itself

Using the _Principle of Bivalence_, the word 'X' must either be Autological or Heterological

## The Liar Paradox

The Liar Paradox is a self-referential paradox that arises when one considers the sentence "This statement is false." If the statement is true, then it must be false, which contradicts its own truth. If the statement is false, then it must be true, which contradicts its own falsity. This paradox highlights the challenges of self-reference and the limitations of language and logic

## Semantic Versioning (SemVer)

[Semantic Versioning 2.0.0](https://semver.org/): Under this scheme, version numbers and the way they change convey meaning about the underlying code and what has been modified from one version to the next

Given a version number `MAJOR.MINOR.PATCH`, increment the:

1. MAJOR version when you make incompatible API changes
2. MINOR version when you add functionality in a backward compatible manner
3. PATCH version when you make backward compatible bug fixes

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format

- Caret (`^`): All minor and patches OK (`^1.x.x`)
- Tilde (`~`): All patches only (`~1.5.x`)

Not everyone follows SemVer:

- TypeScript does not strictly adhere to Semantic Versioning (SemVer) for its language updates
