# Clean Architecture

With Clean Architecture, the **Domain** and **Application** layers are at the center of the design (**Core** of the system)

- **Core** should not be dependent on data access and other infrastructure. All dependencies point inwards

  - This is achieved by adding interfaces or abstractions within **Core** that are implemented by layers outside of **Core**.

- Independent of frameworks
- Testable
- Independent of UI
- Independent of database
- Independent anything external

Layers:

- Domain Layer:

  - Contains enterprise logic and types
  - Can be shared across many systems

- Application Layer:

  - Contains business logic and types
  - Specific to that system

- Presentation Layer:

  - Depend on Core system, But not on Infrastructure

- Infrastructure Layer:

  - Depend on Core system, But not on Presentation

## T

- src

  - Domain:

    - Types, Entities, Exceptions
    - Domain specific: Such as Finance domain will have finance specific things like currency, rates, currency representation etc..
    - Less application logic

  - Application:
    - Application specific things. What the application is being built for
    -
  - Infrastructure
  - WebUI

- tests

  - Unit Tests
  - Integration Tests

## Resources

- [Clean Architecture with .NET Core: Getting Started](https://jasontaylor.dev/clean-architecture-getting-started/)
- [Clean Architecture with ASP.NET Core 2.1 | Jason Taylor](https://www.youtube.com/watch?v=_lwCVE_XgqI)
