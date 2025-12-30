---
title: Design Principles
description: General guidelines that can guide your class structure and relationships
---

# Design Principles

General guidelines that can guide your class structure and relationships

- No standard catalogue of principles
- Varies by domain

Fundamental Principles:

1. **[Encapsulate what varies](#encapsulate-what-varies)**

2. **[Favour composition](#favour-composition)** (over inheritance)

3. **[Loose coupling](#loose-coupling)**

4. **[Program to interfaces](#program-to-interfaces)**

5. **[SOLID Principles](#solid-principles)** (5 principles)

## Encapsulate What Varies

Identify the aspects of your application that vary and separate them from what stays the same

- If we have part of our design that is changing, say with every new requirement, well then we should encapsulate that part away from the rest of the design

- **Underlines almost all design patterns** like Strategy, Adapter, Facade, Decorator, Observer, Singleton, etc...

_Example:_ Pancake menu can be altered at any time without affecting the rest of our code

```csharp
public Pancake orderPancake(string type) {
  Pancake pancake;

  // types will vary over time
  // extract it out using any of the design patterns
  if (type.equals == 'classic') {
    pancake = new ClassicPancake();
  } else if (type.equals == 'blueberry') {
    pancake = new BlueberryPancake();
  } else if (type.equals == 'chocolate chip') {
    pancake = new ChocolateChipPancake();
  } else if (type.equals == 'banana') {
    pancake = new BananaPancake();
  }

  pancake.cook();
  pancake.plate();
  pancake.addButter();

  return pancake;
}
```

- The `orderPancake` method is responsible for creating pancakes and serving them
- The pancake types are hardcoded in the method and can change over time
- We can encapsulate the pancake creation to a factory to separate the creation of pancakes from the rest of the code

```csharp
// extract the pancake creation to a factory
// encapsulate the creation of pancakes
// now we can change the pancake types without affecting the rest of the code
public class SimplePancakeFactory {
  public Pancake createPancake(string type) {
    Pancake pancake = null;

    if (type.equals == 'classic') {
      pancake = new ClassicPancake();
    } else if (type.equals == 'blueberry') {
      pancake = new BlueberryPancake();
    } else if (type.equals == 'chocolate chip') {
      pancake = new ChocolateChipPancake();
    } else if (type.equals == 'banana') {
      pancake = new BananaPancake();
    }

    return pancake;
  }
}
```

- Now we can change the pancake types without affecting the rest of the code

```csharp
public Pancake orderPancake(string type) {
  Pancake pancake = SimplePancakeFactory.createPancake(type);

  pancake.cook();
  pancake.plate();
  pancake.addButter();

  return pancake;
}
```

## Favour Composition

This principle warrants against overuse of inheritance and suggests composition as a powerful alternative for extending behaviour in our designs

- **"has-a"** is better than **"is-a"**
  - _"is-a"_ is an inheritance relationship: _Dog "is an" animal_
  - _"has-a"_ is a relationship of composition: _Dog "has a" owner_

- Instead of inheriting behaviour, we can compose our objects with new behaviours
- Composition often gives us more flexibility, even allows behaviour changes at runtime

_Example_: A `Duck` class that can fly and quack

```csharp
public class Duck {
  public void fly() {
    // flying behaviour
  }

  public void quack() {
    // quacking behaviour
  }
}

// now we want to add a rubber duck that can't fly
// we can't inherit from Duck because it can fly
// we can use composition to add the fly behaviour
public class RubberDuck {
  private FlyBehaviour flyBehaviour;

  public RubberDuck() {
    flyBehaviour = new FlyNoWay();
  }

  public void fly() {
    flyBehaviour.fly();
  }

  public void quack() {
    // quacking behaviour
  }
}

public interface FlyBehaviour {
  void fly();
}

public class FlyNoWay : FlyBehaviour {
  public void fly() {
    // do nothing
  }
}

public class FlyWithWings : FlyBehaviour {
  public void fly() {
    // flying behaviour
  }
}
```

## Loose Coupling

Strive for loosely coupled designs between objects that interact

- Components should be independent, relying on knowledge of other components as little as possible
- Changes in one component should not require changes in another component

_Example_: A `WeatherStation` class that displays the temperature

```csharp
public class WeatherStation {
  private TemperatureSensor sensor;

  public WeatherStation() {
    sensor = new TemperatureSensor();
  }

  public void display() {
    Console.WriteLine(sensor.getTemperature());
  }
}

public class TemperatureSensor {
  public int getTemperature() {
    // get temperature from sensor
  }
}
```

- The `WeatherStation` class is tightly coupled to the `TemperatureSensor` class
- If we want to change the sensor, we have to change the `WeatherStation` class
- We can use interfaces to decouple the classes

```csharp
public interface ISensor {
  int getValue();
}

public class TemperatureSensor : ISensor {
  public int getValue() {
    // get temperature from sensor
  }
}

public class WeatherStation {
  private ISensor sensor;

  public WeatherStation(ISensor sensor) {
    this.sensor = sensor;
  }

  public void display() {
    Console.WriteLine(sensor.getValue());
  }
}
```

- Now the `WeatherStation` class is not dependent on the `TemperatureSensor` class
- We can easily change the sensor without changing the `WeatherStation` class

## Program to Interfaces

Keep our designs high-level and referring where possible to abstractions or interfaces and not concrete implementations

- Where possible, components should use abstract classes or interfaces instead of a specific implementation

- Allows you to better exploit polymorphism

- Makes your code more flexible and easier to change

- Makes your code more testable

_Example_: A `WeatherStation` class that displays the temperature

```csharp
public interface ISensor {
  int getValue();
}

public class TemperatureSensor : ISensor {
  public int getValue() {
    // get temperature from sensor
  }
}

public class WeatherStation {
  private ISensor sensor;

  public WeatherStation(ISensor sensor) {
    this.sensor = sensor;
  }

  public void display() {
    Console.WriteLine(sensor.getValue());
  }
}
```

- The `WeatherStation` class is not dependent on the `TemperatureSensor` class
- We can easily change the sensor without changing the `WeatherStation` class
- We can create a new sensor class and pass it to the `WeatherStation` class

```csharp
public class HumiditySensor : ISensor {
  public int getValue() {
    // get humidity from sensor
  }
}

WeatherStation weatherStation = new WeatherStation(new HumiditySensor());
weatherStation.display();
```

- Now the `WeatherStation` class can display the humidity
- We didn't have to change the `WeatherStation` class

## SOLID Principles

SOLID is mnemonic acronym for:

1. **S**: [Single Responsibility Principle (SRP)](#single-responsibility)
2. **O**: [Open-Closed Principle (OSP)](#open-closed)
3. **L**: [Liskov Substitution Principle (LSP)](#liskov-substitution)
4. **I**: [Interface Segregation Principle (ISP)](#interface-segregation)
5. **D**: [Dependency Inversion Principle (DIP)](#dependency-inversion)

> They are promoted by Robert C. Martin (Uncle Bob) and are a subset of many principles promoted by him

SOLID principles are the design principles that enable us to manage most of the software design problems

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

> "A class should have only one reason to change" - Robert C. Martin

- One responsibility per class

- Every module or class should have responsibility over a single part of the functionality over a single part of the functionality provided by the software, and that responsibility should be entirely encapsulated by the class

> "Just beacuse you can, doesn't mean you should"

### Open-Closed

> "Software entities should be open for extension, but closed for modification" - Robert C. Martin

- **Open to extension** means adding subclasses as needed

- **Closed to modification** avoids tweaking the code to handle new situations

- The design and writing of the code should be done in a way that new functionality should be added with minimum changes in the existing code

- Composition helps in extension

> "Open-chest surgery isn't needed when putting on a coat"

### Liskov Substitution

> "Objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program" - Introduced by Barbara Liskov
>
> "Subtype Requirement: Let 𝜙(𝑥) be a property provable about objects 𝑥 of type T. Then 𝜙(𝑦) should be true for objects 𝑦 of type S where S is a subtype of T." - Wikipedia

Symbolically:

$$ S \leq T \to (\forall x{:}T.\phi(x) \to \forall y{:}S.\phi(y) $$

- Object of some _Base class_ `S` can be replaced with objects of any _Derived class_ of `S`

- If a program module is using a Base class, then the reference to the Base class can be replaced with a Derived class without affecting the functionality of the program module

- We can also state that Derived types must be substitutable for their base types

- Constrains subclass design

- This helps design good polymorphism

- Designed by contract rather than wholely depending on inheritance

> "If it looks like a duck, quacks like a duck, but needs batteries - you probably have the wrong abstraction"

### Interface Segregation

> "Many client-specific interfaces are better than one general-purpose interface" - Robert C. Martin

- No client should be forced to depend on methods it dose not use

- Cohesion: How strong are the relationships between an interface's methods?

- Cohesion is a quality of an interface; highly cohesive interfaces have methods related to one another. Low cohesion interfaces have many, unrelated methods

- We should not enforce clients to implement interfaces that they don't use. Instead of creating one big interface we can break down it to smaller interfaces

- Classes depend on the smallest interface
  - The fewest methods and attributes

- Helps design good classes

- Helps write unit test cases

> "You want me plug this in where?"

### Dependency Inversion

One should _"depend upon abstractions, not concretions"_

- High-level modules should not depend on low level modules. Both should depend on abstractions

- A direct dependency on a concrete class needs to be inverted to be indirect

- Abstractions should not depend on the details whereas the details should depend on abstractions

- Depend on abstract classes or interfaces

- Avoid concrete class name dependencies

- Helps in writing testable code

> "Don't call us, we'll call you"
> "Would you solder a lamp directly to the electrical wiring in a wall?"

## DRY Principle

DRY - Don't Repeat Yourself

- Every piece of knowledge must have a single, unambiguous, authoritative representation within a system
- If you have the same code in more than one place, you're asking for trouble

## GRASP

GRASP - General Responsibility Assignment Software Principles

It is a set of guidelines for designing objects and classes that determine where to put responsibilities and how to assign responsibilities to classes

- Creator
- Information Expert
- Low Coupling
- High Cohesion
- Controller
