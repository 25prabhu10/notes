---
title: Design Patterns
next: ./Adapter.md
sidebar: false
---

# Table of Content

1. [Adapter](./Adapter.md)
2. [CQRS](./CQRS.md)

## Introduction

Design patterns are common approaches to solving similar problems.

They are like pre-made blueprints that you can customize to solve a recurring design problem in your code.

The 1995 book **Design Patterns, by the so-called Gang of Four (GoF)**, describes **23 patterns**.

- Some design patterns tend to cause more problems than they solve, and are thus commonly referred to as antipatterns.

### Categories

Categorized by their _intent_ or _purpose_

1. **Creational patterns** provide object creation mechanisms that increase flexibility and reuse of existing code.

   - Singleton
   - Prototype: Clone
   - Builder
   - [Factory](#factory-method)

2. **Structural patterns** explain how to assemble objects and classes into larger structures, while keeping these structures flexible and efficient: How objects relate to each other

   - Facade: Simplified API
   - Proxy

3. **Behavioral patterns** take care of effective communication and the assignment of responsibilities between objects: How objects communicate with each other

   - Iterator
   - Observer
   - Mediator
   - State

## Factory Method

Factory Method is a creational design pattern that provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.

## SOLID Principles

1. S - Single Responsibility Principle (SRP)
2. O - Open / Closed Principle (OSP)
3. L - Liskov Substitution Principle (LSP)
4. I - Interface Segregation Principle (ISP)
5. D - Dependency Inversion Principle (DIP)

SOLID principles are the design principles that enable us to manage most of the software design problems

- The principles are a subset of many principles promoted by Robert C. Martin
- The SOLID acronym was first introduced by Micheal Feathers

They can be used to resolve issues such as:

- Tight or strong coupling of the code with many other modules/applications
- Tight coupling causes time to implement any new requirement, features or any bug fixes and some times it creates unknown issues
- End up with a code which is not testable
- End up with duplication of code
- End up creating new bugs by fixing another bug

They help us to:

- Achieve reduction in complexity of code
- increase readability, extensibility and maintenance
- Reduce error and implement Re-usability
- Achieve better test-ability
- Reduce tight coupling

### Single Responsibility

"A class should have only one reason to change" - Robert C. Martin

- One responsibility per class
- Every module or class should have responsibility over a single part of the functionality over a single part of the functionality provided by the software, and that responsibility should be entirely encapsulated by the class

### Open / Closed

"Software entities should be open for extension, but closed for modification"

- **Open to extension** means adding subclasses as needed
- **Closed to modification** avoids tweaking the code to handle new situations
- The design and writing of the code should be done in a way that new functionality should be added with minimum changes in the existing code

### Liskov Substitution

Introduced by Barbara Liskov state that "objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program"

- Object of some Base class S can be replaced with objects of any Derived class of S
- If a program module is using a Base class, then the reference to the Base class can be replaced with a Derived class without affecting the functionality of the program module
- We can also state that Derived types must be substitutable for their base types
- Constrains subclass design
- This helps design good polymorphism

### Interface Segregation

"Many client-specific interfaces are better than one general-purpose interface"

- No client should be forced to depend on methods it dose not use
- We should not enforce clients to implement interfaces that they don't use. Instead of creating one big interface we can break down it to smaller interfaces
- Classes depend on the smallest interface

  - The fewest methods and attributes

- Helps design good classes
- Helps write unit test cases

### Dependency Inversion

One should "depend upon abstractions, not concretions"

- A direct dependency on a concrete class needs to be inverted to be indirect
- Abstractions should not depend on the details whereas the details should depend on abstractions
- Depend on abstract classes or interfaces
- High-level modules should not depend on low level modules
- Avoid concrete class name dependencies

## DRY Principle

DRY - Don't Repeat Yourself

## GRASP

GRASP - General Responsibility Assignment Software Principles

## TDD

TDD - Test Driven Development

## References

- [Refactoring Guru - Design Patterns](https://refactoring.guru/design-patterns)
