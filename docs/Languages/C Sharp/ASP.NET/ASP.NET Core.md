---
title: ASP.NET Core
description: ASP.NET Core is a free and open-source web framework.
---

# ASP.NET Core

ASP.NET Core was released in 2016. It's not tied to windows assemblies like `System.Web`, IIS and Windows.

There are two way to create ASP.NET Core Applications:

- [Razor Pages Application](#razor-pages-application)

## Razor Pages Application

- Introduced in ASP.NET Core 2.0
- Razor Pages is a new feature of ASP.NET Core MVC that makes coding page-focused scenarios easier and more productive.
- Razor Pages is not just for simple scenarios, everything that you can do with MVC can be done by using Razor Pages like Routing, Models, ActionResult, Tag Helpers and so on.
- Razor Pages have two parts:
  1. Razor Page (UI/View)
  2. Page Model (Contains Handlers)

::: tip Note
`Microsoft.AspNetCore.App` was the metapackage which contained all features of .NET Core

- Prior to .NET Core 3, metapackage was included as a Nuget Package.
- With .NET Core 3 onwards, metapackage is a part of .NET Core installation itself, also some of the package have been moved out of the metapackage as a separate Nuget Package, like Entity Framework.

:::

### Project Structure of Razor Pages

1. Create a ASP.NET Core Web Application with Web Application Template which will scaffold a Razor Pages based application.

2. The Project configuration file `.csproj` will contain the Target Framework, Nuget package details and other project related settings. This file is used by MSbuild during the build process. For more details visit [project-file](https://docs.microsoft.com/en-us/aspnet/web-forms/overview/deployment/web-deployment-in-the-enterprise/understanding-the-project-file).

3. The _Properties_ folder will have have a `launchSettings.json` file, which will contain the details for starting the project during development or production environment. You can create different profiles based on the requirement.

4. _wwwroot_ folder will contain all the static files like css, js, image files, and libraries. This addresses separation of concerns.

5. _Pages_ is the main folder in a Razor Project. This folder contains all the pages of the application.
   - There is a _Shared_ folder inside, which contains `.cshtml` files with **\_** prefix. These files are known as partial view files. They act as components.
   - `_ViewImports.cshtml` - Contains tag helper. This contains global tags, you can define page specific tags inside the specific page folder.
   - `_ViewStart.cshtml` - Defines the master page. Like the layout for all the pages.
   - The rest of the `.cshtml` files in Pages are Razor Pages And other `.cshtml` files have a `.cshtml.cs` file, which is the modal for the view.
   - `index.cshtml` file is the homepage of the application.

#### Program.cs

The application always starts execution from the `main` function present in `Program.cs` file.

- `CreateHostBuilder` dose the configurations.
- This method returns `IHostBuilder`.
- Web builder configurations are done in `Startup.cs` file.
- `ConfigureServices` function adds services to the app, like entity framework, etc..
- `Configure` function adds middleware to the pipe line.

#### `appsettings.json`

- All of the application's settings are contained in this file. (Restart VS after making changes to this file)

#### Browser Request Flow

1. When the browser makes a request, it first arrives at a web server (**IIS**).
2. _IIS_ will invoke the Dot.NET runtime which will load the CLR.
3. Now the request looks for an entry point, i.e. `main` function present in the `Program.cs` file and execute it.
4. This will start the internal web server in the application.
5. The `main` and `startup` class will configure the application.
6. The request will be routed form _IIS_ to _Kestrel_.
7. Now the request is pushed to the application.
8. The request will be processed by all the middleware.
9. The generated response will be routed back to _Kestrel_ that will again pass it to _IIS_, which will produce the response on the browser.

::: tip Note

- There are two web servers, the external web server like (IIS, Apache, etc.) and internal web server hosted by the application like Kestrel. We can use any external or internal servers. We use Kestrel as it has a first class support in ASP.NET Core.
- Kestrel is a light weight web server, it can only execute the requests. So external web server is used to configure security, hashing, etc..
- Classic System relied heavily on `System.web.cs` file, which was tied to _IIS_ and _IIS_ is tied to windows. That is the reason Classic System cannot be run on servers other than _IIS_ or _Windows_.

:::

### Middleware in ASP.NET Core

When the browser sends a request to the server, the request is attached to a context object. This object is passed to the first pipe which process the request and determines if a response is needed, if not the context is passed along to the next pipe. This process continues till a response is given back to the browser.

::: danger To-do
Need to cover more on middleware.
:::

### Dependency Injection (DI)

- ASP.NET Core supports DI.
- .NET Core injects objects of dependency classes through constructor or method by using built-in Inversion Of Control (IOC) container.
- DI is a pattern design that can help developers decouple the different pieces of their applications.

::: danger To-do
Need to cover more on DI and IOC.
:::

### Routing in Razor Pages

- Routing in ASP.NET Razor Pages maps URL's to physical files on disk.

- _Pages_ is the root folder where `index.cshtml` (default document) file resides. You can change the root folder in `ConfigureServices` in `Startup.cs` file.

- File extensions are not included in the URL.

- |            URL            |                         Maps TO                          |
  | :-----------------------: | :------------------------------------------------------: |
  |      www.domain.com       |                   /Pages/index.cshtml                    |
  |   www.domain.com/index    |                   /Pages/index.cshtml                    |
  |  www.domain.com/account   | /Pages/account.cshtml **or** /Pages/account/index.cshtml |
  | www.domain.com/invalidURL |           /Pages/index.cshtml _(default path)_           |

### Tag Helpers

Tag Helpers enable server-side code to participate in creating and rendering HTML elements in Razor files. HTML Helpers alternative.

## Nuget Packages

1. Use `Microsoft.AspNetCore.Mvc.Razor.RuntimeCompilation` Nuget package to hot reload. Also add `app.AddRazorPages().AddRazorRutimeCompilation()` to Startup file.

2. `Microsoft.EntityFrameworkCore` to access Database. `Microsoft.EntityFrameworkCore.SqlServer` for SqlServer. For Sqlite use [Sqlite EntityFramework](https://docs.microsoft.com/en-us/ef/core/get-started/?tabs=visual-studio). `Microsoft.EntityFrameworkCore.Tools` to run migrations. Add the below connection string in `appsettings.json` file:

   ```json
   {
     "ConnectionStrings": {
       "DefaultConnection": "Server=(LocalDb)\\MSSQLocalDB:..."
     }
   }
   ```

   Connection String is found in the respective SQL Application.
