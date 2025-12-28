---
title: Object-Oriented Programming (OOP)
description: Object-oriented programming is a programming paradigm based on the concept of "objects"
---

# Object-Oriented Programming (OOP)

Object-oriented programming is a programming paradigm based on the concept of **"[objects](#objects)"**, which can contain data and code: data in the form of fields, and code, in the form of procedures

How to think like a programmer to solve problems:

- **Analysis**: Understand the problem
- **Design**: Plan your solution
- **Programming**: Build the solution

## Objects

Objects are instances of a [class](#classes)

- Objects are instantiated from Classes
- Objects are the building blocks of object-oriented programming
- Attributes, properties, characteristics, state, fields, variables

Objects are often referred to as Nouns:

- Things, People, Places, Ideas, Concepts
- Can "The" be placed in front of it: "The mug", "The bank account", "The time"
- Not verbs: "The texting", or "The ringing" as they describe the behaviour of an object, not the object itself

All objects have:

1. **Identity**: A unique identifier
   - Olivia's coffee mug

2. **Attributes**: Properties, characteristics, state, fields, variables
   - colour, size, fullness

3. **Behaviours**: Operations, methods, functions
   - `fill()`, `empty()`, `clean()`

What is object assignment rule?

- Objects are assigned by reference, not by value
- When you assign an object to a variable, you are assigning a reference to the object, not the object itself

## Classes

Class is the code template for creating program [Objects](#objects)

- A Class can be used to create multiple objects
- A Class itself is not an Object

Class Components:

1. Name (type): What is it? (`RoundCookie`, `Car`)

2. Attributes (properties, data): What describes it? (`weight`, `colour`, `icing`)

3. Behaviour (operations): What can it do? (`decorate()`, `consume()`)

### Properties

Properties are the characteristics of an object

- Also known as attributes, fields, variables, or data members

### Methods

A program procedure that can return a value

- Methods are functions that are defined as part of a class
- They can only access data known to it's object

## Fundamental Ideas

There are 4 fundamental ideas in OOP:

1. [Abstraction](#abstraction)
2. [Encapsulation](#encapsulation)
3. [Inheritance](#inheritance)
4. [Polymorphism](#polymorphism)

### Abstraction

Abstraction refers to only showing essential details and keep everything else hidden

- **Reduce complexity** by **hiding unnecessary details**

- Modelling the relevant attributes and interactions of entities as classes to define an abstract representation of a system

- Interface and Implementation:
  - The interface refers to the way sections of code can communicate with one another. This typically is done through methods that each class can access
  - The implementation of these methods, or how these methods are coded, should be hidden
  - If classes are entangled, then one change creates a ripple effect that causes many more changes
  - Creating an interface through which classes can interact ensures that each piece can be individually developed
  - Abstraction allows the program to be worked on incrementally and prevents it from becoming entangled and complex
  - Determine specific points of contact that can act as an interface between classes, and only worry about the implementation when coding it

- Focus on essential qualities of something rather than one specific example

- Understanding the idea

- Discard what's unimportant

_Example:_ To send an email using the class `EmailService`, we don't need to know how the email is sent. We only need to know the method `sendEmail()` to send the email

```csharp
class EmailService {
  public void sendEmail() {
    connect();
    authenticate();
    // Code to send email
    disconnect();
  }

  private void connect() {
    // Code to connect to email server
  }

  private void authenticate() {
    // Code to authenticate
  }

  private void disconnect() {
    // Code to disconnect
  }
}
```

### Encapsulation

Encapsulation refers to bundling data with methods that can operate on that data within a class. Essentially, it is the idea of hiding data within a class, preventing anything outside that class from directly interacting with it

- Hiding the internal state and functionality of an object and only allowing access through a public set of functions

- Keeps the programmer in control of access to data

- Prevents the program from ending up in any strange or unwanted states

- Containing the elements of an object, not just keep them together, but also protect them

- We bundle an object's attributes or data along with the methods that operate on that data within the same unit or the same class

- Restricting access to some of the object's components

- **Black Box Testing**: Closing off the inner workings of the cookie jar and only revealing specific inputs and outputs. You don't need to know how the 'request cookie' method is implemented under the hood to use it

- It's not about being secretive. It's about reducing dependencies between different parts of the application

- Changes in one place won't cause a domino effect and require multiple changes elsewhere

_Example:_ Lets say we have a `BankAccount` class with a `balance` attribute. We don't want to allow the balance to be set to a negative value. We can use encapsulation to ensure that the balance is only updated through a method that checks if the new balance is valid

- This prevents the balance from being set to an invalid value

```csharp
class BankAccount {
  private double balance;

  public void Deposit(double amount) {
    if (amount > 0) {
      balance += amount;
    }
  }

  public void Withdraw(double amount) {
    if (amount > 0 && balance - amount >= 0) {
      balance -= amount;
    }
  }

  public double GetBalance() {
    return balance;
  }
}
```

### Inheritance

Inheritance is the principle that allows classes to **derive from other classes**

- Ability to create new abstractions based on existing abstractions
- Base new object or class on an existing one
- Inherit the existing attributes and methods
- Great form of **code reuse**

Inheritance involves creating new classes (subclasses or derived classes) based on existing classes (superclasses or base classes). Subclasses inherit properties and behaviours from their superclasses and can also add new features or override existing ones

- Superclass (Parent/Base class) --> Inherited by --> Subclass (Child/Derived class)
- Inheritance is often described in terms of an **"is-a" relationship** (a subclass is a type of superclass)

_Example:_ A `Car` class can be a superclass, and a `SUV` class can be a subclass. The `SUV` class inherits the properties and behaviours of the `Car` class

```csharp
class Car {
  public void Drive() {
    // Code to drive the car
  }

  public void Stop() {
    // Code to stop the car
  }
}

class SUV : Car {
  public void OffRoad() {
    // Code to drive off-road
  }
}
```

Types of Inheritance:

1. **Multiple Inheritance**: Inherit from multiple Base classes (can get confusing). C++, Python
2. **Single Inheritance**: Inherit from single Super class. Java, C#, Swift, Ruby

### Fragile Base Class Problem

The fragile base class problem is a software design issue that arises in object-oriented programming when changes made to a base class can inadvertently break the functionality of derived classes. This problem occurs due to the tight [coupling](#coupling) between the base class and the derived classes in inheritance hierarchies

1. **Inheritance Coupling**: Inheritance creates a tight coupling between the base class (superclass) and the derived classes (subclasses). Any changes made to the base class can potentially affect the behaviour of the derived classes

2. **Limited Extensibility**: The fragile base class problem limits the extensibility of the software system, as modifications to the base class can become increasingly risky and costly over time. Developers may avoid making changes due to the fear of breaking existing functionality (_brittle software_)

Mitigation strategies:

- **Favour [Composition](#composition) over Inheritance**: Use composition to create relationships between classes instead of inheritance. This approach can help reduce the coupling between classes and make the system more flexible and maintainable
- Software developers can use design principles such as the **Open/Closed Principle (OCP)** and the **Dependency Inversion Principle (DIP)** to design classes that are more extensible and less prone to the fragile base class proble

### Polymorphism

Polymorphism describes methods that are able to take on many forms

- Polymorphism means having many forms
  - **Poly**: Many
  - **Morph**: Form

Polymorphism is the ability of an object to take on many forms. It allows methods to do different things based on the object that they are acting upon

- Ability to implement inherited properties or methods in different ways across multiple abstractions

There are multiple form of polymorphism:

1. **Dynamic Polymorphism**: Uses the same interface for methods on different types of objects
   - Occurs during the runtime of the program
   - Describes when a method signature is in both a subclass and a superclass
   - The methods share the same name but have different implementation
   - **Method overriding**: When a subclass provides a specific implementation of a method that is already provided by one of its superclasses
   - Inherit from the same abstract class with same methods
   - Inheritance, abstract classes, and interfaces are all possible implementations of polymorphism

   _Example:_ A `Shape` class with a `draw()` method. A `Circle` class and a `Square` class that inherit from the `Shape` class. The `Circle` class and `Square

   ```csharp
   class Shape {
     public virtual void Draw() {
       // Code to draw the shape
     }
   }

   class Circle : Shape {
     public override void Draw() {
       // Code to draw a circle
     }
   }

   class Square : Shape {
     public override void Draw() {
       // Code to draw a square
     }
   }

   var square = new Square();
   square.Draw(); // Draw a square

   var circle = new Circle();
   circle.Draw(); // Draw a circle
   ```

2. **Static (Compile-Time) Polymorphism**: Uses **method overloading**
   - Occurs during compile-time rather than during runtime
   - This refers to when multiple methods with the same name but different arguments are defined in the same class
   - This can done through method overloading. Despite the methods having the same name, their signatures are different due to their different arguments

   - Ways to differentiate methods of the same name:
     - Different number of parameters
     - Different types of parameters
     - Different order of parameters

   - Method overloading can cause trouble of you do not keep straight which parameters you need for which implementation. Calling the wrong method because not realizing different arguments types were passed
   - Implements multiple methods with the same name, but different parameters

   _Example:_ A `Calculator` class with an `Add()` method. The `Add()` method can take two integers, two doubles, or two strings

   ```csharp
   class Calculator {
     public int Add(int a, int b) {
       return a + b;
     }

     public double Add(double a, double b) {
       return a + b;
     }

     public string Add(string a, string b) {
       return a + b;
     }
   }

   var calculator = new Calculator();
   calculator.Add(1, 2); // 3
   calculator.Add(1.5, 2.5); // 4.0
   calculator.Add("Hello", "World"); // HelloWorld
   ```

## Coupling and Cohesion

Coupling and Cohesion are two important concepts in software design

### Coupling

Coupling is the degree of interdependence between software modules

- **Tight Coupling**: When a class is dependent on another class
  - Changes in one class require changes in another class
  - Can lead to difficult to maintain code

- **Loose Coupling**: When a class is not dependent on another class
  - Changes in one class do not require changes in another class
  - Allows for greater flexibility and maintainability

To achieve loose coupling:

- **Dependency Injection**: Pass dependencies to a class instead of creating them inside the class
- **Interfaces**: Use interfaces to define the contract between classes
- **Event-Driven Programming**: Use events to communicate between classes
- **Publish-Subscribe Pattern**: Use the publish-subscribe pattern to communicate between classes

### Cohesion

Cohesion is the degree to which the elements inside a module belong together

- **High Cohesion**: When the elements inside a module belong together
  - The module is focused on a single task
  - The module is easier to understand and maintain

- **Low Cohesion**: When the elements inside a module do not belong together
  - The module is focused on multiple tasks
  - The module is harder to understand and maintain

To achieve high cohesion:

- **Single Responsibility Principle (SRP)**: A class should have only one reason to change
- **Separation of Concerns**: Divide a program into distinct sections, each addressing a separate concern
- **Modular Programming**: Break a program into smaller, more manageable pieces

### Ideal Situations

- **High Cohesion and Low Coupling**: The ideal situation
  - Modules are focused on a single task
  - Modules are not dependent on each other
  - Modules are easier to understand and maintain

- **Low Cohesion and High Coupling**: The worst situation
  - Modules are focused on multiple tasks
  - Modules are dependent on each other
  - Modules are harder to understand and maintain

## Composition and Aggregation

Composition and Aggregation are two ways to model relationships between classes

### Composition

Composition is a **"has-a"** relationship between classes

**Composition**: When a class contains an object of another class

- The object is part of the class
- The object cannot exist without the class
- The object is created and destroyed with the class

_Examples:_

- A `Car` class contains an `Engine` object
- A `House` class contains a `Room` object

Composition involves creating complex objects by combining simpler objects or components. In composition, objects are assembled together to form larger structures, with each component object maintaining its own state and behaviour

**Prefer composition over [inheritance](#inheritance)**, as it is more flexible and allows for greater code reuse

When to use Composition:

- When you need more flexibility in constructing objects by assembling smaller, reusable components
- When there is no clear "is-a" relationship between classes, and a "has-a" relationship is more appropriate like a `Car` has an `Engine`
- When you want to avoid the limitations of inheritance, such as tight coupling and the fragile base class problem

When to use Inheritance:

- When there is a clear "is-a" relationship between classes, and subclass objects can be treated as instances of their superclass like a `SUV` is a `Car`
- When you want to promote code reuse by inheriting properties and behaviours from existing classes
- When you want to leverage polymorphism to allow objects of different subclasses to be treated as uniformly through their common superclass interface
