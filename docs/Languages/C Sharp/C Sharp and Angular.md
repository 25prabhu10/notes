---
title: C# and Angular
description: C# and Angular interview questions.
---

# C Sharp and Angular

## Important C# topics

1. List the Basics of Visual Studio?
2. What is C# and .NET Framework?
   - The .Net framework is a software development platform developed by Microsoft. The framework was meant to create applications, which would run on the Windows Platform. The first version of the .Net framework was released in the year 2002.
   - [C#](https://docs.microsoft.com/en-us/dotnet/csharp/getting-started/introduction-to-the-csharp-language-and-the-net-framework) is an elegant and type-safe object-oriented language that enables developers to build a variety of secure and robust applications that run on the .NET Framework.
3. The components of NET Framework , CTS, and CLS.
4. The purpose of the Main method in Console application.
5. Playing with `System.Console` class, and it's methods.
6. Data types and their purpose.
7. C# keywords and identifiers.
8. Decision making using `if-else`, `switch` and looping using `for`, `while`, `do..while` and `foreach` loop.
9. How to create methods and use parameter modifier: `out`, `ref`, `params`, optional and named argument.
10. Arrays in C#, Array initialization syntax, Arrays as parameters and arguments or return values of a method.
11. `enums` and `System.Enum` type.
12. `struct` and `class`.
13. value types and reference types.
14. pass by value and pass by reference.
15. null, nullable types and the use of ?? operator.
16. a class, object, and new keyword.
17. constructors, `this` keyword, `static` keyword and access modifiers.
18. encapsulation using properties (backing field) and auto-implemented properties.
19. read-only fields and `const` fields.
20. sealed and partial classes.
21. Inheritance: base keyword, sealed classes and using access modifiers.
22. polymorphism: compile time and runtime polymorphism using overloading and overriding with virtual and override keywords.
23. `System.Object`, `ToString()` and other methods.
24. Interfaces: Interface types vs. abstract base classes.
25. how to obtain interface reference and using as and a keyword for checking and type casting purposes.
26. Implicit and explicit implementations of interfaces.
27. `IEnumerable` and `IEnumerator` interface and the use of `foreach` and in keywords.
28. how to iterator over `IEnumerable<T>` using yield keyword.
29. `ICloneable` and `IComparable` interfaces.
30. Exception Handling: `try..catch` block, `System.Extension` base `class`, Important properties of the Exception class, `System.System.Exception`, `System.Application.Exception`.
31. Collection and Generics.
32. Delegates and Lambda expressions, Generic Delegates, Anonymous Methods.
33. operator overloading.
34. Indexers.
35. Extension methods and Anonymous types.
36. LINQ.
37. Garbage Collection, `System.GC` type, `IDisposable` interface and Dispose method.
38. multi-threading, `async` and `await` keywords.
39. File I/O and object serialization.
40. Implicit-Type variables.
41. Auto implemented properties.
42. Delegates.
43. Lambda expressions.

## MVC

1. Learn about `Nuget`. `Nuget` is a package management system for installing Dependencies and third party libraries.
2. what is MVC Design pattern before learning ASP.NET MVC.
3. Knowing about MVC version history.
4. ASP.NET MVC projects and templates.
5. ASP.NET MVC application folder structure.
6. What is Model, Controller, and View.
7. Convention over configuration.
8. How data is passed from controller to a view using `ViewData`, `ViewData` and `TempData`.
9. What is a `ViewModel`.
10. Rotating system, Routes, and HTTP basics.
11. Action Methods and Types of Result Types.
12. Routing View Engine and Razor Syntax.
13. The use @model and @Model in razor view files.
14. The use of HTML and URL helper methods.
15. How to pass data from View to Controller Action methods using `FormCollection`, Request object, `QueryString`, Session object and Model Binders.
16. Model binding. The most important topic that every developer must understand.
17. Model binding with Include and Exclude properties.
18. Playing around with scaffolding feature in MVC. It creates views, controller, and context (`EF DbContext` for data access) by looking at our model class.
19. Model Validations using Data Annotations.
20. Using jQuery, jQuery validate and jQuery validate Unobtrusive for client-side validation using Data Annotations.
21. How to show validation error messages in the view using Validation HTML Helper methods.
22. What is an ORM, concepts of ORM and what is Entity Framework.
23. The difference between ADO.NET and ADO.NET Entity Framework.
24. Different approaches of Entity Framework and their uses in a project.
25. How data comes into a model class object and Entity framework uses this model object to persist data in the database i.e. SQL Server database tables.
26. Using MVC and Entity Framework to create a CRUD application.
27. The use of Action Verbs when working with Action methods i.e. `HttpGet` and `HttpPost`.
28. How to create Create, Edit, Delete and Detail view files using Razor syntax with Model classes i.e. creating Strongly-typed views.
29. How to use `ModelState.isValid` and `ModelState.AddModelError`.
30. How to pass data from View to a Controller Action method via a view model, and the transferring the `ViewModel` object to the model object and the passing the model object instance to EF `DbSet.Add()` method for persisting the data in the database (Using `ViewModel` + model + EF for Create and Edit Action methods and Views)
31. `DbContext` class, `DbSet` properties and the `DbContext()` c to configure database connection and `EntityState Enum`.
32. Required and Important data annotations to use with Entity Framework Code-First (`DataType`, Display, Required, `NotMapped` and others)
33. How to use `UpdateMode` And `TryUpdateModel`.
34. Layouts, Sections, Layout property and `_ViewStart` file.
35. How to render `DropDownLists`, `CheckBox`, `Radio` button from database.
36. How to use Display and Editor templates using `UIHint`.
37. How to create custom HTML Helper methods in MVC using extension methods.
38. How to build Partial View and rendering them.
39. Repository pattern, Generic Repository Pattern, and Unit of work pattern.
40. How to implement search, paging, sorting in MVC using Entity Framework.
41. How to render a Grid in MVC using Entity Framework.
42. CSRF attack and using `AntiForgery` token for security purposes.
43. What are Action Filters.
44. Caching in MVC.
45. Use of Areas in an MVC application.
46. Use of Ajax helpers in MVC application.
47. How to do logging in MVC application using Action Pattern Filters or `NLog` attributes.
48. Performance improvement: the use of Bundling and `Minification`.
49. CSRF attack and using `AntiForgery` tokens for security purposes.
50. What are Action Filters.
51. Caching in MVC.
52. Use of Areas in an MVC application.
53. Use of Ajax helpers in MVC application.
54. How to do logging in MVC application using Action Filters or `NLog` attributes.
55. Performance improvements: the use of Bundling and `Minification`.

## Angular2/4

1. How to use TypeScript to write Angular applications.
2. All about directives and components, including the creation of custom directives/components.
3. How databinding works.
4. All about routing and handling navigation.
5. What Pipes are and how to use them.
6. How to access the Web (eg. RESTful servers).
7. What dependency injection is and how to use it.
8. How to use Modules in Angular.
9. How to optimize your (bigger) Angular Application.
10. Controller
11. Events
12. Routing
13. Services
14. Filters
15. Validations
