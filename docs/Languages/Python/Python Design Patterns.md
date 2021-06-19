# Design Patterns

Based on _Design Patterns: Elements of Reusable Object-Oriented Software_ book by Erich Gamma, Richard Helm, Ralph Johnson, and John Vlissides, also know as _Gang of Four_

Quote from the book:

> A design pattern systematically names, motivates, and explains a general design that addresses a recurring design problem in object-oriented systems. It describes the problem, the solution,, when to apply the solution, and its consequences. It also gives implementation hints and examples. The solution is a general arrangement of objects and classes that solve the problem. The solution is customized and implemented to solve the problem in a particular context.

The _Gang of Four_ presents 23 design patterns, split into:

- **Creational**
- **Structural**
- **Behavioral**

## Creational Design Patterns

These patterns deal with different aspects of object creation.

### The Factory Design Pattern

In the factory design pattern, a **client** asks for an object without knowing where the object is coming from (that is, which class is used to generate it).

Or

A Factory Pattern or Factory Method Pattern says that just **define an interface or abstract class for creating an object but let the subclasses decide which class to instantiate**.

Factories typically come in two forms:

- **factory method**
- **abstract method**

#### The factory method

The factory method is based on a single function written to handle object creation task.
It is executed by passing parameters that provide information about which object is needed and as a result, the wanted object is created.

##### Usage

Consider we want to read data from a _json_ or _XML_ file as per the needs.
The below two classes are used to read data from these files:

```python
import json
import xml.etree.ElementTree as etree

class JSONDataExtractor:
    def __init__(self, filepath):
        self.data = dict()
        with open(filepath, mode='r', encoding='utf-8') as f:
            self.data = json.load(f)
        @property
        def parsed_data(self):
            return self.data

class XMLDataExtractor:
    def __init__(self, filepath):
        self.tree = etree.parse(filepath)
        @property
        def parsed_data(self):
            return self.tree
```

Now, write a factory method that returns an instance of _JSONDataExtractor_ or _XMLDataExtractor_ depending on the extension of the file:

```python
def dataextraction_factory(filepath):
    if filepath.endswith('json'):
        extractor = JSONDataExtractor
    elif filepath.endswith('xml'):
        extractor = XMLDataExtractor
    else:
        raise ValueError('Cannot extract the data from {}', format(filepath))
    return extractor(filepath)
```

A wrapper function can be added to handle exceptions:

```python
def extract_data_from(filepath):
    factory_obj = None
    try:
        factory_obj = dataextraction_factory(filepath)
    except ValueError as e:
        print(e)
    return factory_obj
```

This can be used in any function to read data from either _json_ or _XML_ file.

## Todo

- Add advantages, usage, and UML for each pattern.
