# C scarps

## Syntax

- Identifiers - `Main`, `name`, ...
- Keywords - `using`, `namespace`, `class`, ...
- Statements - `int i = 10`, `if (i > 5)`, ...
- Literals (data) - `52`, ...
- Punctuators - `{,};`, ...
- Operators - `+`, `*`, `==`, ...
- Comments - `//`, `/* ... */`

### Data Types

- `int`

- `string`

  - `string emptyStringOne = string.Empty;`
  - `StringBuilder sb = new StringBuilder();`

- `struct`
- `union`

### Loops

### Conditionals

### Enumerations

```csharp
public enum Directions
{
 East = 1,
 West,
 North,
 South
}
// method 1
int direction = (int)Directions.North;
Console.WriteLine($"Direction: { direction }");
// method 2
Enum.TryParse("West", out Directions parsedDirections);
Console.WriteLine((int)parsedDirections);
```

- By default, the **1<sup>st</sup>** item has value "**0**", and the **next** has **1** and so on...

### Methods

- Access modifiers
- Return type
- Parameters
  - Call-by-value: `static void PrintNumber(int[] numbers){...}`
    - The original value remains unaffected.
  - Call-by-reference: `static void PrintNumber(params int[] numbers){...}`
    - The original value changes.
