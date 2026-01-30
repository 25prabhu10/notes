---
title: Go
description: A statically typed, compiled programming language designed at Google
---

# Go

[Go](https://go.dev/) is a:

- **Statically typed**
- **Compiled programming**
- **Garbage-collected**

Language designed at Google. It is syntactically similar to C, but with memory safety, structural typing, and CSP-style concurrency

## Hello, World

1. To create a simple "Hello, World!" program in Go, you can use the following code:

   ```go
   // hello-world.go
   package main    // package declaration


   import "fmt"    // import the fmt package for formatted I/O

   func main() {   // main function - entry point of the program
       fmt.Println("Hello, World!")
   }
   ```

2. To run the program, save it to a file named `hello-world.go`, then use the following command in your terminal:

   ```bash
   go run hello-world.go
   ```

3. We can also build the program into an executable binary using:

   ```bash
   go build hello-world.go

   ./hello-world  # On Unix-like systems
   hello-world.exe  # On Windows
   ```

## Syntax of Go

Go has a simple and clean syntax

### Variables

Variables are declared using the `var` keyword

- Type of variable comes after the variable name
- Type can be inferred if variable is initialized at the time of declaration
- Use `:=` for short variable declaration and initialization only inside functions and only when the variable is being declared for the first time

```go
var x int = 10          // Declare an integer variable
var name = "Go"         // Type inferred as string
y := 20                 // Short variable declaration

var a, b int = 1, 2    // Multiple variable declaration of same type
var c, d = 3, "four"   // Multiple variable declaration with type inference
```
