---
title: Unified Modelling Language (UML)
description: Unified Modelling Language (UML) is a general-purpose, developmental modelling language
---

# Unified Modelling Language (UML)

UML is a general-purpose, developmental modelling language that is intended to provide a standard way to visualize the design of a system

Standardized notation for diagrams to visualize object-oriented systems

- UML is a way to visualize a software program using diagrams

Below are the types of UML diagrams:

1. [Class Diagram](#class-diagram): Describes the structure of a system by showing the system's classes, their attributes, and the relationships between the classes
   - Name
   - Attributes
   - behaviours

2. Structural diagrams:
   - Class diagram
   - Component diagram
   - Deployment diagram
   - Object diagram
   - Package diagram
   - Profile diagram

3. Behavioural diagrams:
   - Use case diagram
   - Activity diagram
   - State machine diagram
   - Sequence diagram
   - Communication diagram
   - Interaction overview diagram
   - Timing diagram

## Class Diagram

[Class diagrams](https://developer.ibm.com/articles/the-class-diagram/) are the most common type of UML diagram

To represent class members, such as attributes and methods, and additional information about them like constructors

1. **Class Name**: At the top of the box
2. **Attributes**: Below the class name
   - Attribute type is after the colon `:` (e.g., `name: string`)

3. **Operations**: Below the attributes
   - Return type is after the colon `:` (e.g., `void`)
   - If method returns a pointer to another object, `*` is used after the return type (e.g., `-op1(in int) : Class5*`)

4. **Access Modifiers**: Before the attribute or method name

_Example:_ A Dog class:

```csharp
class Dog {
  private string name;
  private int age;

  public void Bark() {
    Console.WriteLine("Woof Woof!");
  }

  public bool Act(string command){
  // Code to act based on command
  }
}
```

- Class Name: Dog
- Attributes: name, age
- Methods: Bark, Act

UML Diagram:

```text
+--------------------------+
| Dog                      | <--- Class Name
+--------------------------+
| - name: string           | <--- Attributes
| - age: int               |
+--------------------------+
| + Bark() : void          | <--- Operations
| + Act(c : string) : bool |
+--------------------------+
```

Class can be represented with or without signatures (data types)

```text
+----------------+
| Dog            |
+----------------+
| - name         | <-- Class without signatures
| - age          |
+----------------+
| + Bark()       |
| + Act()        |
+----------------+
```

- **Visibility**: Access modifiers (visibility) of a class member

  | Mark | Visibility type |
  | ---- | --------------- |
  | `+`  | Public          |
  | `-`  | Private         |
  | `#`  | Protected       |
  | `~`  | Package         |

- **Attributes**: Properties of a class

  ```text
  name : attributeType = defaultValue

  balance : double = 0.0
  ```

  - **Derived property**: A property that is calculated from other properties
  - Name is prefixed by a forward slash (`/`) (e.g., `/fullName`)

- **Operations**: Behaviours of a class

  ```text
  name(parameterList) : returnType

  deposit(amount : double) : void
  ```

  Parameter direction (not necessary):
  - **In parameter**: Input parameter
    - Parameter is passed into the method

  - **Out parameter**: Output parameter
    - Parameter is returned from the method

  - **InOut parameter**: Input/output parameter
    - Parameter is passed into the method and possibly modified and is returned back

  _Example:_

  ```text
  +-------------------------------------+
  | Calculator                          |
  +-------------------------------------+
  | + Add(in a : int, in b : int) : int |
  | + Subtract(inout a : int) : int     |
  | + Total(out total) : int            |
  +-------------------------------------+
  ```

### Perspectives of Class Diagram

The class diagram can be viewed from three different perspectives:

1. **Conceptual Perspective**: Describes the concepts in the system
   - Focuses on the concepts in the system and their relationships
   - Designing Domain Model

2. **Specification Perspective**: Describes the specifications of the system
   - Focuses on the specifications of the system and the constraints on the system
   - Analysing the requirements

3. **Implementation Perspective**: Describes the implementation of the system
   - Focuses on the implementation of the system and the details of the system
   - Designing the system

The choice of perspective depends how far along the development process is

```text
+-------------------------+
| Class Name              | <--- Conceptual Perspective
+-------------------------+


+-------------------------+
| Class Name              | <--- Specification Perspective
|-------------------------|
| + attribute : type      |
|-------------------------|
| + operation() : type    |
+-------------------------+


+-----------------------------+
| Class Name                  | <--- Implementation Perspective
|-----------------------------|
| - ex : Expression = null    |
|-----------------------------|
| + operation() : type        |
| + getFormula() : Expression |
+-----------------------------+
```

### Relationships

A relationship between classes

#### Multiplicity

The number of instances of one class related to one instance of the other class

| Indicator | Meaning      |
| --------- | ------------ |
| `0..1`    | Zero or one  |
| `1`       | One only     |
| `0..`     | Zero or more |
|           | Zero or more |
| `1..*`    | One or more  |
| `3`       | Three only   |
| `0..5`    | Zero to five |

#### Association

When you model a system, certain objects will be related to each other, and these relationships themselves need to be modelled for clarity

There are five types of associations:

1. **Bi-directional Association**: Represented by a solid line connecting two classes
   - **Association Name**: Describes the relationship between the classes
   - **Association [Multiplicity](#multiplicity)**: The number of instances of one class related to one instance of the other class

   ```text
          0..*                 assignedPlane
   Flight ---------------------------------- Plane
          assignedFlights               0..1
   ```

   - Flight has 0 or more assigned planes
   - Plane has 0 or 1 assigned flights

2. **Uni-directional Association**: Two classes are related, but only once class knows that the relationship exists
   - [Dependency](#dependency) between two classes

   ```text
                                  overdrawnAccounts
   OverdrawnAccountsReport -----------------------> BankAccount
                                               0..*
   ```

   - `OverdrawnAccountsReport` knows about `BankAccount`, but `BankAccount` does not know about `OverdrawnAccountsReport`
   - `OverdrawnAccountsReport` is dependent on `BankAccount`

3. **Reflexive Association**: When a class is related to itself (a binary association between a class and itself)

   ```text
   +-------------------------+
   | Employee                |
   |-------------------------| 1
   | firstName : string      |------------+
   | lastName : string       | - manager  |
   |-------------------------|            |
   +-------------------------+            |
                       | 0..*             |
             - manages |                  |
                       +------------------+
   ```

   - Employee can be a manager of other employees
   - Because the relationship role of "manages" has a multiplicity of `0..*`, an employee might not have any other employees to manage

4. **Binary and Ternary Association**: When a class is related to two or three classes
   - Represented as a diamond connected with a solid line to each of the associated classes

5. **N-ary Association**: When a class is related to multiple classes
   - An association can be named, and the ends of an association can be adorned with role names, aggregation indicators, multiplicity, visibility, navigability, and other properties
   - Bi-directional relationship between classes

Types of Associations:

1. **Simple Association**:

2. **Shared Association**:

3. **Composite Association**:
   - A stronger form of aggregation where the part cannot exist without the whole

_Example:_

```text
A ------ B

A is associated with B and B is associated with A
```

#### Dependency

A relationship where one class depends on another class

- Unidirectional relationship
- A dashed line with an open arrow pointing to the class it depends on `A -----> B` (A depends on B)

```text
A ----> B

A depends on B
```

#### Aggregation

A special form of association where one class is a part of another class

- A variation of the "has-a" relationship
- Aggregation is more specific than [association](#association)
- An aggregation may not involve more than two class (it must be a binary association)

It is an association that represents a part-whole or part-of relationship

- Represented by a hollow diamond at the class containing the part `A <>---- B` (A has a B)

```text
A professor 'has a' class to teach

+-------------------------+                  +-------------------------+
| Professor               |                  | Class                   |
|-------------------------|   1         1..* |-------------------------|
| + listOfStudents : list | <>-------------- | + Stidents : list       |
|-------------------------|                  |-------------------------|
|                         |                  |                         |
+-------------------------+                  +-------------------------+
```

#### Composition

A composite aggregation (composition) is a strong form of [aggregation](#aggregation) where the aggregate controls the life-cycle of the elements it aggregates

- A _filled_ diamond at the class containing the part `A <*>---- B` (A has a B)

```text
Composition: A Car has exactly one Carburetor, and a Carburetor is part of one Car
- Carburetor cannot exist as a separate parts
+-------------------------+                  +-------------------------+
| Car                     | <*>------------> | Carburetor              |
+-------------------------+   1..1     1..1  +-------------------------+

Aggregation: A Pond has zero or more Ducks, and a Duck has at most one Pond (at a time)
- Ducks can exist separately from the Pond
- When we destroy a Pond, we usually don't destroy the Ducks
+-------------------------+                  +-------------------------+
| Pond                    | <>-------------> | Duck                    |
+-------------------------+   0..1     0..*  +-------------------------+
```

#### Inheritance

A relationship between a superclass and a subclass

```text
(subclass) ----|> (superclass)

"an oak is a type of tree"
oak ----|> tree
```

_Example_:

```csharp
interface Animal { }

class Dog : Animal {
  private string name;

  public void Bark() {
    Console.WriteLine("Woof Woof!");
  }
}
```

```text
+-------------------------+
| Animal                  |
+-------------------------+
            ^
            |
            |
+-------------------------+
| Dog                     |
|-------------------------|
| - name : string         |
|-------------------------|
| + Bark() : void         |
+-------------------------+
```

#### Interfaces

A contract that specifies the behaviour of a class

```text
                    +-------------------------+
                    |       <<interface>>     |
                    |         Person          |
                    |-------------------------|
                    | + name : string         |
                    | + age : int             |
                    |-------------------------|
                    | + walk() : void         |
                    +-------------------------+
                      ^                  ^
                      |                  |
                      |                  |
+-------------------------+             +-------------------------+
| Professor               |             | Student                 |
|-------------------------|             |-------------------------|
| + salary : double       |             | + major : string        |
|-------------------------|             |-------------------------|
+-------------------------+             +-------------------------+
```

### Packages

A package is a collection of logically related UML elements

## Designing with UML

5-Step approach:

1. Gathering requirements to figure out what our application needs to do
2. Describe the application. Build a narrative in plain, conversational language for how people will use it
3. Identifying the most important objects, which is the starting point for identifying actual classes
4. Describe the interactions between them, understanding each object's responsibilities, the behaviours they need to have, and when they interact with other objects
5. And finally, create a class diagram, which serves as the main output from the five-step process

### UML Tools

Things to consider:

- Commercial or open source
- Support platforms
- Diagram drawing capabilities
- Code generation capabilities
- Collaboration features

Popular UML tools:

- [Lucidchart](https://www.lucidchart.com/)
- [Creately](https://creately.com/)
- [Visual Paradigm](https://www.visual-paradigm.com/)
- [StarUML](https://staruml.io/)
- [Draw.io](https://app.diagrams.net/)
- [Gliffy](https://www.gliffy.com/)
- Microsoft Visio

## Model

Model is a partial abstract representation of a real-world system

- An inexpensive way to analyse, communicate, test, and document our understanding of the system

Types of Models:

1. Computational
   - Computer simulations representing time-varying behaviour of a system

2. Analytical:
   - Mathematical models of relationships among variables in a system

3. Non-Analytical/descriptive:
   - Describe components and their relationships in a system

   - Models in Software can be categorized into 2 groups:
     1. Data Models: like Entity Relationship models, etc.

     2. Application Models: UML models, SysML models, BPMN models, etc.

## Types of UML

1. _Structure_: Represents static view of the system and its components
   1. Class diagram
   2. Component diagram
   3. Object diagram
   4. Composite structure diagram
   5. Package diagram
   6. Deployment diagram

2. _Behaviour_: Represents dynamic view of the system and its components
   1. Use case diagram:
      - Capture high-level functionality of a system using notations for actors, use cases, and relationships among them

      - Often drawn by business analysts to depict the summary all use cases in a system

      - Key elements:
        - Use cases:
          - Notation is a bubble that carries use case title

        - Systems
        - Actors:
          - A user's role with respect to the system
          - Maybe a human or another system
          - _Primary actor_: whose goal is fulfilled by the use case

          - _Secondary actor_: who is involved in the use case
            - Often an external system

        - Associations

   2. Activity diagram
   3. State machine diagram
   4. Interaction

3. _Interaction_ (part of _behaviour_): Represents interaction, among components of the system and between system and external actors
   1. Sequence diagram
   2. Communication diagram
   3. Timing diagram
   4. interaction overview diagram

## References

- [Unified Modelling Language (UML) specification 2.5](https://www.omg.org/spec/UML/)
  - Controlled by Object Management Group (OMG)
  - Releases: UML-1 (1997), UML-2 (2005), UML-2.5 (2015)

- UML Distilled by Martin Fowler

- Applying UML and Patterns by Craig Larman
