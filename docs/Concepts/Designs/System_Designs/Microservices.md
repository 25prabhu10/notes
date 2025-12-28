---
title: Microservices
description: An architectural style of small, independent services to build large applications
---

# Microservices

Microservices is an architectural style for building applications as a collection of small, independent services. Imagine it like a large, complex machine being broken down into smaller, specialized tools that work together

## Principles of Microservices

- **Independent and Autonomous**: Each microservice should be self-contained and operate independently. This means they have their codebase, database, and business logic
- **Loose Coupling**: Microservices should rely as little as possible on each other. They communicate through well-defined APIs (Application Programming Interfaces) instead of being tightly interwoven
- **Small and Focused**: Microservices are designed to be small and focused on a single function. This makes them easier to understand, develop, test, and deploy
- **Technology Agnostic**: Microservices can be built with different programming languages and technologies, allowing developers to choose the best tool for the job
- **Discoverable**: Microservices need to be discoverable by other services in the system. This is often achieved through **service registries**

Following these principles allows for the following:

- **Faster Development and Deployment**: Changes to one microservice can be made and deployed independently without affecting the entire application
- **Scalability**: Different application parts can be scaled up or down independently based on their needs
- **Increased Fault Tolerance**: If one microservice fails, it should not bring down the entire application
- **Improved Maintainability**: Smaller, focused services are easier to understand and maintain

## Microservices vs. Monolithic Architecture

Meanwhile, in monolithic architecture, a single, self-contained application, all the functionalities are tightly coupled within one unit:

- All components are part of a single unit
- Everything is developed, deployed, and scaled as 1 unit
- App usually must be written with one tech stack
- Teams need to be careful not to affect each other's work
- Single artifact, hence redeploy the entire application on each update

Key differences between monolithic and microservices architectures:

|             | Monolithic                                                  | Microservices                                                           |
| ----------- | ----------------------------------------------------------- | ----------------------------------------------------------------------- |
| Structure   | **Single, unified codebase** for the entire application     | Collection of small, **independent services**                           |
| Deployment  | The entire application needs to be **deployed together**    | Services can be **deployed independently**                              |
| Scalability | Scaling the entire application can be complex               | Individual services can be scaled independently                         |
| Development | Changes require modifications to the entire codebase        | Changes can be made to individual services                              |
| Complexity  | **Simpler to understand** and manage for small applications | These can be more **complex to manage** due to their distributed nature |

- Choosing the right approach depends on factors like the size and complexity of the application

## Challenges of Microservices

- **Increased Complexity**: Managing many independent services can be more complex than a single monolithic codebase. This includes distributed tracing, monitoring, and configuration management
- **Distributed Data Management**: Data consistency across services can be tricky. Techniques like CQRS (Command Query Responsibility Segregation) and Event Sourcing can help
- **Debugging and Monitoring**: Troubleshooting issues become more complex as requests flow across multiple services. Distributed tracing tools are essential
- **Integration Challenges**: Microservices need to communicate effectively through APIs. Defining and maintaining stable APIs requires ongoing effort
- **Development Team Culture**: Microservices thrive with a DevOps culture that encourages collaboration and independent ownership
- **Potential for Redundancy**: Duplication of functionality across services can occur if not carefully planned

While these challenges exist, with careful planning and tooling, microservices can be a powerful way to build scalable and maintainable applications

```text
The Options

             ^
             |
             | Distributed BBoM           Microservices
             |
Distribution |
             |
             | Big Ball of Mud (BBoM)     Modular Monolith
             |
              ----------------------------------------------->
                               Modularisation
```

## Service Registry

How applications and services locate each other

## Load Balancer

Efficiently distributes network traffic across a group of backend services

## Circuit Breaker

Stops an application from performing an operation that is likely to fail

## API Gateway

A server that is the single entry point into the system

## External Configuration

Keeps the configuration information in a centralized external store

## Bounded Context

The boundary of a model that represents its concepts, relationships, and rules

## Design Patterns for Microservices

1. **Shared Database Pattern** (anti-pattern): Multiple microservices share the same database schema, which can lead to tight coupling and deadlocks in DBMS
2. **The Database-per-Service Pattern**: Each microservice has its own database to ensure loose coupling and independent data management
   - Issue arise when a business transaction spans multiple services, leading to data consistency challenges. For example, updating an order and its associated inventory in separate services may result in one update succeeding while the other fails
   - Solutions include using eventual consistency, **sagas**, or **two-phase** commits

3. **The Saga Pattern**: Manages distributed transactions across multiple microservices using a series of compensating actions
   - Two types of sagas:
     - **Choreography-based Sagas**: Each service involved in the saga publishes events that trigger actions in other services. Message brokers like Kafka or RabbitMQ are often used to facilitate this communication
     - **Orchestration-based Sagas**: A central orchestrator service coordinates the saga by sending commands to the participating services

4. **[CQRS (Command Query Responsibility Segregation) Pattern](./CQRS.md)**: Separates read and write operations into different models to optimize performance and scalability
5. **The Event Sourcing Pattern**: Instead of storing the current state, store a sequence of events that led to the current state
6. **The API Gateway Pattern**: A single entry point for all client requests, routing them to the appropriate microservices
7. **The Circuit Breaker Pattern**: Prevents a service from repeatedly trying to execute an operation that is likely to fail
8. **The Sidecar Pattern**: Deploys helper components alongside the main service to provide additional functionality like logging, monitoring, or configuration
9. **The Strangler Fig Pattern**: Gradually replaces parts of a monolithic application with microservices over time

## References

- [5 Microservices Misconceptions](https://redis.com/blog/5-microservices-misconceptions/?utm_source=marketo&utm_medium=email&utm_campaign=March_2023_newsletter&mkt_tok=OTE1LU5GRC0xMjgAAAGKjJhaOSj_kmp5uYNVRxI3cr5ViVBgiFI6mr87hD69pBGwrwvDbZzEzlmO7XbYqcbrEQ-w2Wm6NOHSinzvW8YwguMCP8kupyLp48LE4VIZH43xzdc)
