---
title: Domain Driven Design
description: Build software by modeling it around the business domain
date: 2024-07-13
lastmod: 2024-08-10
---

# Domain Driven Design

Domain-Driven Design (DDD) is a software development approach that focuses on building software that closely aligns with a particular business domain. It is an approach to software development that emphasizes collaboration between technical experts and domain experts to create a shared understanding of the problem space and build a model that accurately represents the domain

- Domain: The problem space you're trying to address
- Entities: Objects that have a distinct identity and lifecycle
- Value Objects: Objects that are defined only by their attributes and do not have a distinct identity
- Aggregates: Groups of related entities and value objects that are treated as a single unit. Each aggregate has a root entity (aggregate root) that ensures the integrity of the aggregate
- Repositories: Interfaces that provide methods for accessing aggregates from a data store
- Services: Business logic that doesn't naturally fit within an entity or value object
- Modules: Logical grouping of related concepts to keep the system organized

> Any fool can write code that a computer can understand. Good programmers write code that humans can understand.
>
> Refactoring: Improving the Design of Existing Code, 1999

Here are the key ideas behind DDD:

- **Domain Model:** DDD emphasizes creating a domain model, essentially a blueprint of a specific business area's core concepts and processes. This model bridges the gap between the technical world of software and the real-world business domain

- **Ubiquitous Language:** A core principle of DDD is establishing a "ubiquitous language" - a common vocabulary shared by developers and business experts. This shared language ensures that everyone involved understands the terminology and concepts used in the system

- **Bounded Contexts:** DDD acknowledges that complex systems cannot be modelled simultaneously. Instead, it advocates dividing the system into smaller, bounded contexts, each with its focused domain model. This promotes modularity and maintainability

- **Patterns:** DDD offers a variety of patterns for modelling different aspects of the domain. These patterns include Entities (objects with a unique identity), Value Objects (objects that hold data), Aggregates (groups of related entities), and Domain Services (reusable logic specific to the domain)

Overall, DDD aims to create software that is functional and reflects the specific needs and terminology of the business domain it serves. This can lead to improved communication, maintainability, and long-term flexibility of the software

## The Ubiquitous Language

## References

- Domain-Driven Design: Tackling Complexity in the Heart of Software (2003) - Eric Evans (Author)
- [Sairyss/domain-driven-hexagon - GitHub](https://github.com/Sairyss/domain-driven-hexagon)
- [Books](https://github.com/balkrish33/Books)
