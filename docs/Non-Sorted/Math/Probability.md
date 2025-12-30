---
title: Probability
description: Probability is the logic of uncertainty
---

# Probability

Probability is branch of mathematics that deals with the likelihood of a given event occurring. It is a measure of the likelihood that a given event will occur. The probability of an event is a number between 0 and 1, where, roughly speaking, 0 indicates impossibility of the event and 1 indicates certainty. The higher the probability of an event, the more likely it is that the event will occur

It is the foundation of statistical inference, where we infer the properties of a population from a sample of data. It is also used in decision theory, where we try to maximize the expected utility of an action

## Sets

A set is a **collection of distinct objects**, considered as an object in its own right. Objects are called the **elements** or **members** of the set

Sets are one of the most fundamental concepts in mathematics. They are used to define the concepts of functions, relations, and probability

If $S$ is a set and $x$ is an element of $S$, we write $x \in S$. If $x$ is not an element of $S$, we write $x \notin S$

- A set can have no elements, which is called the **empty set** and is denoted by $\emptyset$ or $\{\}$

_Example_: A set containing finite number of elements, say $x_1, x_2, \ldots, x_n$ is denoted by:

$$ S = \{x_1, x_2, \ldots, x_n\} $$

- The set of possible outcomes of a die roll is $\{1, 2, 3, 4, 5, 6\}$

1. **Countably Infinite Set**: A set is countably infinite if its elements can be put in one-to-one correspondence with the set of natural numbers $\mathbb{N}$

   $$ S = \{x_1, x_2, \ldots\} $$

   _Example_: The set of even integers is countably infinite, can be written as:

   $$ S = \{2, -2, 4, -4, \ldots\} $$

2. **Uncountably Infinite Set**: A set is uncountably infinite if its elements cannot be put in one-to-one correspondence with the set of natural numbers $\mathbb{N}$

   _Example_: The set of real numbers $\mathbb{R}$ is uncountably infinite

### Subsets

If $S$ and $T$ are sets and every element of $S$ is also an element of $T$, then:

- $S$ is a **subset** of $T, denoted by $S \subseteq T$, or equivalently
- $T$ is a **superset** of $S, denoted by $T \supseteq S$

If $S$ is a subset of $T$ but $S$ is not equal to $T$, then:

- $S$ is a **proper (strict) subset** of $T, denoted by $S \subset T$, or equivalently
- $T$ is a **proper (strict) superset** of $S, denoted by $T \supset S$

If $S \subseteq T$ and $T \subseteq S$, then $S$ and $T$ are **equal sets**, denoted by $S = T$

An empty set is a subset of any set $X$

#### Universal Set

The set of all possible outcomes of an experiment is called the **universal set**, denoted by $U$ or $\Omega$

We only consider sets $S$ that are subsets of the universal set $U$ for a given experiment

#### Set-builder Notation

A set can be defined by specifying a property that its elements must satisfy. This is called the **set-builder notation**

A set $S$ can be defined as:

$$ S = \{n | n \text{ is an integer, and } 0 \leq n \leq 5\} $$

- Where $|$ is read as "such that"
- $S$ is the set of all integers $n$ such that $n$ is an integer in the range from 0 to 5 (inclusive)

Colon `:` is also used instead of $|$

#### Basic Properties

1. **Empty Set**: The empty set is a subset of every set

   $$ \emptyset \subseteq S $$

2. **Universal Set**: Every set is a subset of the universal set

   $$ S \subseteq U $$

3. **Reflexive Property**: Every set is a subset of itself

   $$ S \subseteq S $$

4. **Transitive Property**: If $S \subseteq T$ and $T \subseteq C$, then $S \subseteq C$

   $$ S \subseteq T \subseteq C \implies S \subseteq C $$
   - Also, if $S \nsupseteq T$ and $T \nsupseteq C$, then $S \nsupseteq C$

5. **Anti-Symmetric Property**: If $S \subseteq T$ and $T \subseteq S$, then $S = T$

   $$ S \subseteq T \text{ and } T \subseteq S \implies S = T $$

6. **Asymmetric Property**:

   $$ S \nsubseteq T \text{ then } T \nsubseteq S \text{ is always false} $$

7. **Irreflexive Property**: Given any set $S$:

   $$ S \nsubseteq S \text{ is always false} $$

### Operations on Sets

The **complement** of a set $S$, with respect to the universal set $U$, is the set of all elements of $U$ that are not in $S$ $\{x \in U | x \notin S \}$. It is denoted by $S^c$ or $\bar{S}$

- $U^c = \emptyset$

The **union** of two sets $S$ and $T$ is the set of all elements that belong to $S$ or $T$ or both. It is denoted by $S \cup T$

The **intersection** of two sets $S$ and $T$ is the set of all elements that belong to both $S$ and $T$. It is denoted by $S \cap T$

$$ S \cup T = \{x | x \in S \text{ or } x \in T\} $$
$$ S \cap T = \{x | x \in S \text{ and } x \in T\} $$

- If the intersection of two sets is the empty set, then the sets are said to be **disjoint**
- A collection of sets is said to be **partition** of a set $S$ if the sets in the collection are disjoint and their union is $S$

If $x$ and $y$ are two objects, we use $\{x, y\}$ to denote the **ordered pair** of $x$ and $y$. The order of the elements in the pair is important

### Laws of Set Theory

1. **Commutative Laws**:

   $$ S \cup T = T \cup S $$
   $$ S \cap T = T \cap S $$

2. **Associative Laws**:

   $$ S \cup (T \cup C) = (S \cup T) \cup C $$
   $$ S \cap (T \cap C) = (S \cap T) \cap C $$

3. **Distributive Laws**:

   $$ S \cup (T \cap C) = (S \cup T) \cap (S \cup C) $$
   $$ S \cap (T \cup C) = (S \cap T) \cup (S \cap C) $$

4. **Identity Laws**:

   $$ S \cup \emptyset = S $$
   $$ S \cap U = S $$

5. **Complement Laws**:

   $$ S \cup S^c = U $$
   $$ S \cap S^c = \emptyset $$

6. **De Morgan's Laws**:

   $$ (S \cup T)^c = S^c \cap T^c $$
   $$ (S \cap T)^c = S^c \cup T^c $$

7. **Absorption Laws**:

   $$ S \cup (S \cap T) = S $$
   $$ S \cap (S \cup T) = S $$

8. **Complement of the Universal Set**:

   $$ U^c = \emptyset $$
   $$ \emptyset^c = U $$

9. **Complement of the Complement**:

   $$ (S^c)^c = S $$
   $$ (T^c)^c = T $$

10. **Complement of the Empty Set**:

    $$ \emptyset^c = U $$
    $$ U^c = \emptyset $$

11. **Universal Set and Intersection**:

    $$ S \cap U = S $$
    $$ S \cup U = U $$

12. **Empty Set and Union**:

    $$ S \cup \emptyset = S $$
    $$ S \cap \emptyset = \emptyset $$

### Venn Diagrams

A Venn diagram is a diagram that shows all possible logical relations between a finite collection of different sets. They are used to represent the relationships between sets

- **Universal Set**: The rectangle that contains all the sets
- **Disjoint Sets**: Sets that do not have any elements in common
- **Intersection**: The region where the sets overlap
- **Complement**: The region outside the set

### Important Sets

- **Natural Numbers**: $\mathbb{N} = \{1, 2, 3, \ldots\}$
- **Integers**: $\mathbb{Z} = \{\ldots, -2, -1, 0, 1, 2, \ldots\}$
- **Rational Numbers**: $\mathbb{Q} = \{p/q | p, q \in \mathbb{Z}, q \neq 0\}$
- **Real Numbers**: $\mathbb{R}$
- **Complex Numbers**: $\mathbb{C}$

## Sample Space

The sample space of an experiment is the set of all possible outcomes of that experiment. It is denoted by the symbol S. For example, if we toss a coin, the sample space is {Heads, Tails}

The sample space S of an experiment is the set of all possible outcomes of the experiment
