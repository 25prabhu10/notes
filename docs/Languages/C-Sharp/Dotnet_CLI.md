---
title: dotnet CLI
description: The .NET command-line interface (CLI) is a cross-platform toolchain for developing, building, running, and publishing .NET applications
---

# dotnet CLI

`dotnet` CLI is the .NET command-line interface (CLI) is a cross-platform tool-chain for developing, building, running, and publishing .NET applications

- .Net Framework is a development platform that includes **Common Language Runtime (CLR)** which manages the execution of code, and a Base Class Library (BCL), which provides a rich library of classes to build applications from

- .NET Standard is more of a specification (standard) for a set of APIs that all .NET platforms could implement. .NET Standard cannot be installed the same way HTML cannot be installed

To check what all options are available in `dotnet` CLI:

```bash
# basic syntax
dotnet [command] [arguments] [options]

# help
dotnet help new

# specific command help
dotnet new console -h
```

## Installation

| Tech           | Description                  | Host OS                             |
| -------------- | ---------------------------- | ----------------------------------- |
| .NET (Core)    | Modern, C# 8, 9, 10          | Windows, Linux, macOS, Android, iOS |
| .NET Framework | Legacy C# 7                  | Windows only                        |
| Xamarin        | Mobile and desktop apps only | Android, iOS, macOS                 |

## SDK

List all the .NET SDK and Runtime installed:

```bash
# lists all installed SDKs and runtimes
dotnet --info

# lists all installed SDKs
dotnet --list-sdks

# lists all installed runtimes
dotnet --list-runtimes
```

Remove SDK:

```bash
dotnet-core-uninstall remove --all-previews-but-latest --sdk
```

## Project

You can use any tool to write the source code, some of the IDE's:

- [Visual Studio 2022](https://visualstudio.microsoft.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [JetBrains Rider](https://www.jetbrains.com/rider/)

You can use the above tools to create a .NET project or use the `dotnet` CLI:

```bash
# create a console application
dotnet new console -o MyApp

# --use-program-main (do not use top-level statements)

# run the application
cd MyApp
# build and run
dotnet run

# clean build artefacts
# - obj
# - bin
dotnet clean
```

Common project types:

- Solution: `dotnet new sln -o solution-name`
- Web API: `dotnet new webapi -o project-name`
- Class Library: `dotnet new classlib -o project-name`
- Unit Test: `dotnet new xunit -o project-name`
- Console App: `dotnet new console -o project-name`
- MVC: `dotnet new mvc -o project-name`
- Razor Pages: `dotnet new webapp -o project-name`
- Blazor: `dotnet new blazorserver -o project-name`
- Worker Service: `dotnet new worker -o project-name`
- Web App: `dotnet new web -o project-name`

_Example:_ Creating a Web API solution

```bash
# create a empty solution
dotnet new sln -o Library

cd Library

# create project as per requirements
dotnet new webapi -o Library.WebAPI
dotnet new classlib -o Library.DAL
dotnet new classlib -o Library.DTO
dotnet new xunit -o Library.UnitTest

# add all the projects to the solution
dotnet sln add Library.WebAPI/Library.WebAPI.csproj
dotnet sln add Library.DAL/Library.DAL.csproj
dotnet sln add Library.DTO/Library.DTO.csproj
dotnet sln add Library.UnitTest/Library.UnitTest.csproj

# add reference to the projects
dotnet add Library.WebAPI/Library.WebAPI.csproj reference Library.DAL/Library.DAL.csproj
dotnet add Library.WebAPI/Library.WebAPI.csproj reference Library.DTO/Library.DTO.csproj
dotnet add Library.UnitTest/Library.UnitTest.csproj reference Library.WebAPI/Library.WebAPI.csproj

# add package reference
dotnet add Library.WebAPI/Library.WebAPI.csproj package Microsoft.EntityFrameworkCore
dotnet add Library.WebAPI/Library.WebAPI.csproj package Microsoft.EntityFrameworkCore.SqlServer

# check the solution
dotnet sln list

# build solution
dotnet build

# run solution
dotnet run --project Library.WebAPI/Library.WebAPI.csproj
```

## Common Commands

`dontet` CLI has a lot of commands, some of the common commands are:

### `new`

```bash
# list all installed templates
dotnet new list

# create a solution file
dotnet new sln -o MySolution

# create a new project
dotnet new console -o MyApp

# create .gitignore file
dotnet new gitignore

# create a EditorConfig file
dotnet new editorconfig

# create a global.json file
dotnet new globaljson --roll-forward latestMinor --sdk-version 8.0.100

# create a NuGet.Config file
dotnet new nugetconfig
```

### `build`

Build command results in 2 folders:

- `obj`: Contains one compiled _object_ file for each source code file. These objects haven't been linked together into a final executable yet
- `bin`: Contains the _binary_ executable for the application or class library

Build artefacts:

- `.pdb`: Program-Debug Data Base
  - It is helps in debugging C# code
  - Provides stack trace info when an exceptions occurs
  - It stores information such as line numbers, where break points are added
  - It should be built for release code and stored on symbol server. It can be shipped in production
