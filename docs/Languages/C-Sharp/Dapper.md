---
title: Dapper
description: A simple object mapper for .Net
date: 2024-08-22
lastmod: 2024-08-22
---

# Dapper

[Dapper](https://github.com/DapperLib/Dapper): a simple Object-Relational Mapping (ORM) library for .NET and .NET Core applications (falls under _micro-ORMs_: tools perform only a subset of the functionality of full-blown ORM)

- This provides a simple and efficient API for invoking SQL, with support for both synchronous and asynchronous data access, and allows both buffered and non-buffered queries
- It relies on SQL queries
- Dapper concentrates its efforts on the **O** and **M** of ORM - **O**bject **M**apping

## Features

- Execute raw SQL queries
- Map the results to objects
- Execute stored procedures
- Lightweight and fast (ideal choice for applications that require **low latency and high performance**)

|                        | Micro ORM | ORM |
| ---------------------- | :-------: | :-: |
| Map queries to objects |    Yes    | Yes |
| Caching results        |     -     | Yes |
| Change tracking        |     -     | Yes |
| SQL generation         |     -     | Yes |
| Identity management    |     -     | Yes |
| Association management |     -     | Yes |
| Lazy loading           |     -     | Yes |
| Unit of work support   |     -     | Yes |
| Database migrations    |     -     | Yes |

### When to use Dapper?

- A good choice in scenarios where read-only data changes frequently and is requested often. It is particularly good in stateless scenarios (e.g. the web) where there is no need to persist complex object graphs in memory for any duration

- Dapper does not translate queries written in .NET languages to SQL like a full-blown ORM

- A good choice where the database structure isn't particularly normalized

- Dapper works with an ADO.NET `IDbConnection` object, which means that it will work with any database system for which there is an ADO.NET provider

- We can use both an ORM and a micro ORM in the same project

### When not to use Dapper?

- Manual SQL Query Writing
- Limited High-Level Abstractions (write more code for common CRUD operations and lack certain high-level abstractions, such as automatic change tracking and migrations)
- No Built-in LINQ Support (doesn't have the same level of integration and expressiveness as an ORM like Entity Framework)
- No Lazy Loading (but you can implement it)

## Sample Project

1. Create a ASP.Net WebApi project

   ```bash
   dotnet new webapi -n Learn_Dapper
   ```

2. Add Project Dependencies

   ```bash
   cd Learn_Dapper
   dotnet add package Dapper && dotnet add package Microsoft.Data.Sqlite && dotnet add package Microsoft.Extensions.Configuration && dotnet add package Microsoft.Extensions.DependencyInjection.Abstractions
   ```

3. Run the App for the First Time

   ```bash
   # development certificates, allowing you to run the web api using the https protocol
   dotnet dev-certs https --trust

   # run the application
   dotnet run --launch-profile https

   # open `https://localhost:{port}/swagger` in the browser
   ```

4. Create a SQLite Database

   ```bash
   # create a SQLite database called `customers.db`
   sqlite3 customers.db
   ```

   - Connecting the Web API to the database (add the DB connection details in `appsettings.json` file):

   ```json
   {
     "ConnectionStrings": {
       "DefaultConnection": "Data Source=customers.db"
     },
     "Logging": {
       "LogLevel": {
         "Default": "Information",
         "Microsoft.AspNetCore": "Warning"
       }
     },
     "AllowedHosts": "*"
   }
   ```

5. Create the Customer Table and Initially Seed the Data:

   - Create a folder called 'Database' and within the folder a file called `DatabaseUtilities.cs`

   ```bash
   mkdir Database && cd Database && touch DatabaseUtilities.cs
   ```

   - Add the below code to the file:

   ```cs
   using Dapper;
   using Microsoft.Data.Sqlite;

   public static class DBUtilities
   {
      // extension method onto the `WebApplication` class
      public static async Task<bool> InitializeDBAsync(this IWebApplication app)
      {
         var connectionString = app.Configuration.GetConnectionString("DefaultConnection");

         var createSQL = @"CREATE TABLE IF NOT EXISTS Customer (
                  ID INTEGER PRIMARY KEY AUTOINCREMENT,
                  FirstName TEXT,
                  LastName TEXT,
                  DOB DATE,
                  Email TEXT
            );";

         var insertSQL = @"
               INSERT INTO Customer (FirstName, LastName, DOB, Email)
               VALUES
                     ('Tony', 'Stark', '1970-05-29', 'tony.stark@example.com'),
                     ('Bruce', 'Wayne', '1972-11-11', 'bruce.wayne@example.com'),
                     ('Peter', 'Parker', '1995-08-10', 'peter.parker@example.com'),
                     ('Diana', 'Prince', '1985-04-02', 'diana.prince@example.com'),
                     ('Clark', 'Kent', '1980-07-18', 'clark.kent@example.com'),
                     ('Natasha', 'Romanoff', '1983-06-25', 'natasha.romanoff@example.com'),
                     ('Wade', 'Wilson', '1977-02-19', 'wade.wilson@example.com'),
                     ('Hal', 'Jordan', '1988-09-05', 'hal.jordan@example.com'),
                     ('Steve', 'Rogers', '1920-07-04', 'steve.rogers@example.com'),
                     ('Selina', 'Kyle', '1982-12-08', 'selina.kyle@example.com');";

         using var connection = new SqliteConnection(connectionString);
         connection.Open();

         // makes use of the `BeginTransaction` API within the SQLite package
         using var transaction = connection.BeginTransaction();

         try
         {
            await connection.ExecuteAsync(createSQL, transaction: transaction);

            // Check if the Customer table exists
            var tableExists = await connection.QueryFirstOrDefaultAsync<int>(
               "SELECT COUNT(*) FROM sqlite_master WHERE type='table' AND name='Customer';", transaction: transaction);

            if (tableExists > 0)
            {
            // Table exists and populated, no need to seed database again
            return true;
            }

            await connection.ExecuteAsync(insertSQL, transaction: transaction);

            // Commit the transaction if everything is successful
            transaction.Commit();
            connection.Close();
            return true;
         }
         catch (Exception ex)
         {
            Console.WriteLine(ex.Message);

            // An error occurred, rollback the transaction
            transaction.Rollback();
            connection.Close();
            return false;
         }
      }
   }
   ```

6. Add the `InitializeDBAsync` Method to the `Program.cs` file:

   ```cs
   // Initialise the Db
   await app.InitializeDBAsync();

   app.Run();
   ```

7. Run the application...again

8. Build a Repository For Crud Methods (using Repository Pattern):

   - Create all files and folders: `ICustomerRepository.cs`, `IGenericRepository.cs`, `IUnitOfWork.cs`, `UnitOfWork.cs`, `CustomerRepsository.cs`

   ```bash
   cd Database; touch IGenericRepository.cs ICustomerRepository.cs CustomerRepository.cs IUnitOfWork.cs UnitOfWork.cs
   ```

   - Paste the following code in each of them:

   ```cs
   public interface IUnitOfWork
   {
      ICustomerRepository Customers { get; }
   }
   ```

   ```cs
   using System;
   using System.Collections.Generic;
   using System.Linq;
   using System.Threading.Tasks;

   namespace FCC_Dapper;

   public interface IGenericRepository<T> where T : class
   {
      Task<T?> GetByIdAsync(int id);
      Task<IReadOnlyList<T>> GetAllAsync();
      Task<int> AddAsync(T entity);
      Task<int> UpdateAsync(T entity);
      Task<int> DeleteAsync(int id);
   }
   ```

   ```cs
   using FCC_Dapper;

   public interface ICustomerRepository : IGenericRepository<Customer>
   {


   }
   ```

   ```cs
   using Dapper;
   using FCC_Dapper;
   using Microsoft.Data.Sqlite;

   public class CustomerRepository : ICustomerRepository
   {
      public CustomerRepository(IConfiguration configuration)
      {
         this._configuration = configuration;
      }

      private readonly IConfiguration _configuration;

      public async Task<int> AddAsync(Customer customer)
      {
         var sql = "INSERT INTO Customer (firstName, lastName, email, dob) VALUES (@FirstName, @LastName, @Email, @DOB)";
         using var connection = new SqliteConnection(_configuration.GetConnectionString("DefaultConnection"));

         return await connection.ExecuteAsync(sql, customer);
      }

      public async Task<int> DeleteAsync(int id)
      {
         var sql = "DELETE FROM Customer WHERE ID = @ID";
         using var connection = new SqliteConnection(_configuration.GetConnectionString("DefaultConnection"));

         var result = await connection.ExecuteAsync(sql, new { ID = id });
         return result;

      }

      public async Task<IReadOnlyList<Customer>> GetAllAsync()
      {
         var sql = "SELECT * FROM Customer";
         using var connection = new SqliteConnection(_configuration.GetConnectionString("DefaultConnection"));
         var result = await connection.QueryAsync<Customer>(sql);
         return result.ToList();

      }

      public async Task<Customer?> GetByIdAsync(int id)
      {
         var sql = "SELECT * FROM Customer WHERE ID = @ID";
         using var connection = new SqliteConnection(_configuration.GetConnectionString("DefaultConnection"));
         var result = await connection.QuerySingleOrDefaultAsync<Customer>(sql, new { ID = id });
         return result ?? null;
      }

      public async Task<int> UpdateAsync(Customer entity)
      {
         var sql = "UPDATE Customer SET FirstName = @FirstName, LastName = @LastName, DOB = @DOB, Email = @Email WHERE ID = @ID";
         using var connection = new SqliteConnection(_configuration.GetConnectionString("DefaultConnection"));
         var result = await connection.ExecuteAsync(sql, entity);
         return result;
      }
   }
   ```

9. Dependency Injection - Registering The Interfaces:

   - Create a file called `ServiceRegistration.cs` in the root directory of the project:

   ```cs
   public static class ServiceRegistration
   {
      // extension method to the IServiceCollection,
      // allowing us to easily add the Repository and UnitOfWork classes for Dependency Injection
      public static void AddInfrastructure(this IServiceCollection services)
      {
         services.AddScoped<ICustomerRepository, CustomerRepository>();
         services.AddScoped<IUnitOfWork, UnitOfWork>();
      }
   }
   ```

   - Call this within our `Program.cs`:

   ```cs
   using Dapper;
   using FCC_Dapper;
   using Microsoft.Data.Sqlite;

   var builder = WebApplication.CreateBuilder(args);

   builder.Services.AddEndpointsApiExplorer();
   builder.Services.AddSwaggerGen();

   //Add the line here
   builder.Services.AddInfrastructure();

   var app = builder.Build();
   ```

10. Connecting the Repository to the Web API Endpoints:

    ```cs
    using Dapper;
    using FCC_Dapper;
    using Microsoft.Data.Sqlite;

    var builder = WebApplication.CreateBuilder(args);

    // Add services to the container.
    // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
    builder.Services.AddEndpointsApiExplorer();
    builder.Services.AddSwaggerGen();
    builder.Services.AddInfrastructure();

    var app = builder.Build();

    // Configure the HTTP request pipeline.
    if (app.Environment.IsDevelopment())
    {
       app.UseSwagger();
       app.UseSwaggerUI();
    }

    app.UseHttpsRedirection();

    // initialize the database here
    await app.InitializeDBAsync();
    app.Run();



    app.MapGet("/get", async (IUnitOfWork unitOfWork) =>
    {
       var customers = await unitOfWork.Customers.GetAllAsync();
       return Results.Ok(customers);
    });

    app.MapGet("/get/{id}", async (IUnitOfWork unitOfWork, int id) =>
    {
       var data = await unitOfWork.Customers.GetByIdAsync(id);
       return data != null ? Results.Ok(data) : Results.Problem("Failed to locate customer");
    });

    app.MapPost("/create", async (IUnitOfWork unitOfWork) =>
    {
       var count = await unitOfWork.Customers.AddAsync(new Customer
       {
          FirstName = "Stan",
          LastName = "Lee",
          DOB = new DateTime(1945, 1, 1),
          Email = "stan.lee@test.com"
       });


       return count > 0
          ? Results.Ok("Customer created successfully")
          : Results.Problem("Unable to create customer");
    });

    app.MapPut("/update", async (IUnitOfWork unitOfWork, Customer customer) =>
    {
       var count = await unitOfWork.Customers.UpdateAsync(customer);
       return count > 0 ? Results.Ok("Customer updated successfully") : Results.Problem("Customer failed to update");
    });

    app.MapPost("/delete", async (IUnitOfWork unitOfWork, int id) =>
    {
       var count = await unitOfWork.Customers.DeleteAsync(id);
       return count > 0 ? Results.Ok("Customer deleted successfully") : Results.Problem("Customer failed to delete");
    });
    ```

## CRUD – Create, Read, Update, Delete

Common Dapper extension methods:

- `QueryAsync<T>()`: Executes a query and maps the result set to a strongly-typed list of objects of type `T`
- `QueryFirstOrDefaultAsync<T>`: Similar to `Query<T>`, but returns the first result or a default value if no results are found
- `ExecuteAsync()`: Executes a non-query SQL statement (for example, INSERT, UPDATE, DELETE) and returns the number of affected rows
- `QueryMultiple()`: Executes a query that returns multiple result sets, allowing you to read multiple sets of results from a single query

  ```cs
  using (var multi = connection.QueryMultiple("SELECT * FROM Table1; SELECT * FROM Table2"))
  {
     var result1 = multi.Read<MyClass1>().ToList();
     var result2 = multi.Read<MyClass2>().ToList();
  }
  ```

- `QuerySingle<T>`: Executes a query and expects exactly one result. Throws an exception if there are zero or more than one results

## References

- [Learn Dapper](https://www.learndapper.com/)
