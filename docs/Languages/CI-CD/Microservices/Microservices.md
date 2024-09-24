---
title: Microservices
description: An architectural style of small, independent services to build large applications
date: 2023-03-24
lastmod: 2024-07-13
---

# Microservices

Microservices is an architectural style for building applications as a collection of small, independent services. Imagine it like a large, complex machine being broken down into smaller, specialized tools that work together

Key principles of microservices are:

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

Meanwhile, in monolithic architecture, a single, self-contained application, all the functionalities are tightly coupled within one unit

In monolithic applications:

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

While microservices offer advantages, there are also challenges to consider:

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

Are you sure?

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

## References

- [5 Microservices Misconceptions](https://redis.com/blog/5-microservices-misconceptions/?utm_source=marketo&utm_medium=email&utm_campaign=March_2023_newsletter&mkt_tok=OTE1LU5GRC0xMjgAAAGKjJhaOSj_kmp5uYNVRxI3cr5ViVBgiFI6mr87hD69pBGwrwvDbZzEzlmO7XbYqcbrEQ-w2Wm6NOHSinzvW8YwguMCP8kupyLp48LE4VIZH43xzdc)
