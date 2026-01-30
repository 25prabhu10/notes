---
title: Data Serialization and Deserialization
description: Data Serialization and Deserialization is the process of converting in-memory objects to a portable format and back
---

# Data Serialization and Deserialization

Serialization converts in-memory objects to a portable byte stream that can be stored or transmitted and later reconstructed

- **Pickling**: Python's `pickle` module serializes arbitrary objects to/from a byte stream
- **Marshalling**: In languages like Java, marshalling refers to the process of transforming the memory representation of an object to a data format suitable for storage or transmission

## Purpose of Serialization

We have an application that has User object (with name, age, etc.) and we want to share this data to another application. We cannot directly share this data to another application because, the application data resides in volatile memory during runtime and is lost upon process termination. Furthermore, memory addresses are local to a specific process; sharing a raw pointer with an external application is ineffective because that address space is inaccessible or mapped differently in the receiving process

Serialization solves these issues by converting in-memory objects (such as a "User" object with name, age, and address fields) into a persistent, language-agnostic format like JSON or XML. This provides several benefits:

1. Persistence: Data can be saved to non-volatile storage and restored after the application restarts
2. Network Transmission: Serialized data can be sent across a network to different systems
3. Interoperability: By removing platform-specific implementation details and memory addresses, serialization allows different programming languages and operating systems to exchange data
   - Serialized data only contains the essential information needed to reconstruct the original object, without any extraneous details tied to a specific runtime environment

The process of encoding data is called **serialization** (or marshalling), while the reverse process of decoding it back into an active data structure is **deserialization** (or unmarshalling)

## Serialization Formats

Serialization formats define the schema and encoding used to represent data structures in a serialized state. A format specifies how an object graph maps to a sequence of bytes

- **Portability**: Some formats are language-specific (e.g., Python's `pickle`), while others are language-agnostic, enabling cross-platform data exchange (e.g., JSON, XML, Protobuf)
- Formats vary in their support for complex objects, circular references, and custom data types. Not every format preserves cycles, polymorphism, or user-defined types
- Performance characteristics differ; some formats prioritize human readability (e.g., JSON, XML), while others focus on compactness and speed (e.g., Protocol Buffers, MessagePack)
- **Axis of choice**: Human-readable (JSON) vs. Compact (Protobuf), Text (XML) vs. Binary (MessagePack), Schema-less (YAML) vs. Schema-driven (Avro)

| Human-readable  | Machine friendly      |
| --------------- | --------------------- |
| JSON, XML, YAML | Protobuf, MessagePack |

Pick the canonical format that matches the trade-off you need (inter-op, config, archival, wire speed)

Custom encodings are possible but rarely justify the maintenance cost; reuse proven standards

## Common Serialization Formats

- **JSON (JavaScript Object Notation)**: A lightweight, text-based format that is easy for humans to read and write. It supports basic data types like strings, numbers, arrays, and objects. Widely used for web APIs and configuration files
- **XML (eXtensible Markup Language)**: A markup language that defines a set of rules for encoding documents in a format that is both human-readable and machine-readable. It supports complex data structures and is often used in enterprise applications
- **YAML (YAML Ain't Markup Language)**: A human-friendly data serialization standard that is often used for configuration files. It is more readable than JSON and XML but can be more complex to parse
- **Protocol Buffers (Protobuf)**: A language-neutral, platform-neutral, extensible mechanism for serializing structured data. It is more compact and faster than JSON and XML, making it suitable for high-performance applications
- **MessagePack**: A binary serialization format that is more efficient than JSON. It is designed for speed and compactness, making it suitable for network communication and storage
- **Avro**: A row-oriented remote procedure call and data serialization framework developed within Apache's Hadoop project. It uses JSON for defining data types and protocols, and serializes data in a compact binary format
- **Thrift**: An interface definition language and binary communication protocol developed at Facebook for defining and creating services for numerous languages. It supports serialization and deserialization of complex data structures
- **CBOR (Concise Binary Object Representation)**: A binary data serialization format that is designed to be small in size and easy to parse. It is often used in constrained environments like IoT devices

| Format      | Style  | Strengths                                                        | Typical Use             | Supported Data Types                                                                                              |
| ----------- | ------ | ---------------------------------------------------------------- | ----------------------- | ----------------------------------------------------------------------------------------------------------------- |
| JSON        | text   | Human-readable, language-agnostic, ubiquitous                    | Web APIs, configs       | string, number (double-precision), bool, null, array, object                                                      |
| XML         | text   | Verbose, self-describing, schema-driven                          | Enterprise SOA, SOAP    | any data type through XML Schema (XSD) definitions                                                                |
| YAML        | text   | Indent-based, comments, anchors (more readable than JSON or XML) | DevOps configs          | all JSON types, sequence, map, more complex types (timestamp, and set)                                            |
| Protobuf    | binary | Compact, typed, schema-evolution                                 | gRPC, micro-services    | strongly typed. integer, float, bool, string, raw byte, enum, and nested messages                                 |
| MessagePack | binary | JSON-like model, smaller/faster                                  | Games, IoT              | mirror JSON types, binary blobs, extension custom types                                                           |
| Avro        | binary | Schema in JSON, compact, splittable                              | Hadoop, Kafka           | primitive data types, record, enum, array, map, union                                                             |
| Thrift      | binary | IDL (Interface Definition Language) + RPC, multi-lang            | Facebook services       | rigorous type system, base type (bool, byte, i16/i32/i64, double, string), container (list, set, map), and struct |
| CBOR        | binary | minimal size, low memory, IETF std, tiny parser, RFC 7049        | CoAP, constrained nodes | extends JSON data model, byte string, high-precision fraction, and tag extensible data types (like URI or date)   |

_Example_: JSON Serialization and Deserialization between Python and JavaScript

```python
import json

# Define a sample data structure
data = {
    "name": "Alice",
    "age": 30,
    "is_member": True,
    "favorites": ["reading", "hiking", "coding"]
}

# Serialize the data to a JSON string and store it in a file
with open('data.json', 'w') as json_file:
    json.dump(data, json_file)
```

```javascript
// Deserialize the JSON string from the file back into a JavaScript object
const fs = require("fs");

const jsonData = fs.readFileSync("data.json", "utf8");
const data = JSON.parse(jsonData);
console.log(data);
```

## Best Practices

- **Data Integrity**: Ensure that the serialization and deserialization processes preserve the original data accurately
- **Security**: Be cautious when deserializing data from untrusted sources, as it can lead to security vulnerabilities like code injection
  - Always validate and sanitize input before deserialization
  - Whenever data crosses trust boundaries, consider using formats that do not allow code execution (e.g., avoid `pickle` for untrusted data)

- **Schema Management**: Use schema definitions (like Protobuf or Avro schemas) to enforce data structure and types
- **Versioning**: Implement versioning in your serialized data format to handle changes in data structures over time
- **Performance**: Choose a serialization format that balances performance and readability based on your application's needs
- **Testing**: Regularly test serialization and deserialization processes to ensure compatibility and correctness
