---
title: dotnet CLI
description: The .NET command-line interface (CLI) is a cross-platform toolchain for developing, building, running, and publishing .NET applications
---

# dotnet CLI

dotnet CLI is the .NET command-line interface (CLI) is a cross-platform toolchain for developing, building, running, and publishing .NET applications.

.Net Framework is a development platform that includes **Common Language Runtime (CLR)** which manages the execution of code, and a Base Class Library (BCL), which provides a rich library of classes to build applications from.

.NET Standard is more of a specification (standard) for a set of APIs that all .NET platforms could implement. .NET Standard cannot be installed the same way HTML cannot be installed.

To check what all options are available in dotnet CLI:

```bash
# Help
dotnet help new

# Specific command
dotnet new console -h
```

## Versions

| Tech           | Description                  | Host OS                             |
| -------------- | ---------------------------- | ----------------------------------- |
| .NET (Core)    | Modern, C# 8, 9, 10          | Windows, Linux, macOS, Android, iOS |
| .NET Framework | Legacy C# 7                  | Windows only                        |
| Xamarin        | Mobile and desktop apps only | Android, iOS, macOS                 |

## SDK

List all the .NET SDK and Runtime installed:

```bash
# Lists all installed SDKs and runtimes
dotnet --info

# Lists all installed SDKs
dotnet --list-sdks

# Lists all installed runtimes
dotnet --list-runtimes
```

To remove SDK:

```bash
dotnet-core-uninstall remove --all-previews-but-latest --sdk
```

## Project

You can use any tool to write the source code, some of the IDE's:

- [Visual Studio 2022](https://visualstudio.microsoft.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [JetBrains Rider](https://www.jetbrains.com/rider/)

You can use the above tools to create a .NET project or use the dotnet CLI:

```bash
# Create a console application
dotnet new console -o MyApp

# Run the application
cd MyApp
# dotnet build
dotnet run

# Clean build artifacts
# - obj
# - bin
dotnet clean
```

- Solution: `dotnet new sln -o solution-name`
- Web API: `dotnet new webapi -o project-name`
- Class Library: `dotnet new classlib -o project-name`

Build command results in 2 folders:

- `obj`: Contains one compiled _object_ file for each source code file. These objects haven't been linked together into a final executable yet.
- `bin`: Contains the _binary_ executable for the application or class library.

Build artifacts:

- `.pdb`: Program-Debug Data Base

  - It is helps in debugging C# code
  - Provides stack trace info when an exceptions occurs.
  - It stores information such as line numbers, where break points are added.
  - It should be built for release code and stored on symbol server. It can be shipped in production.
