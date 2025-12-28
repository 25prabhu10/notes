---
title: Data Serialization
description: Data Serialization Formats and Techniques
---

# Data Serialization

Data serialization is the process of converting data structures or objects into a format that can be easily stored, transmitted, and reconstructed later

- **Pickling**: In Python, the `pickle` module allows for serializing and deserializing Python objects
- **Marshalling**: In languages like Java, marshalling refers to the process of transforming the memory representation of an object to a data format suitable for storage or transmission

## Serialization Formats

Serialization formats vary in terms of human readability, efficiency, and support for complex data types

Common serialization formats include [JSON](../Languages/JSON.md), XML, YAML, Protocol Buffers, and MessagePack

- Some are text-based (e.g., JSON, XML, YAML), while others are binary (e.g., Protocol Buffers, MessagePack)
- The choice of format often depends on the specific use case, such as data interchange between systems, configuration files, or data storage

We can create custom serialization formats for specific use cases such as hiding implementation details or optimizing for specific data structures. But it is generally recommended to use established serialization formats to ensure compatibility and ease of use across different systems and programming languages
