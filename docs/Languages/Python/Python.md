---
title: Python
description: Python is an interpreted, high-level, general-purpose programming language
---

# Python

Python is an:

- Interpreted
- High-level
- Dynamically typed
- Garbage-collected
- General-purpose programming language
- Multiple programming paradigms, including procedural, [object-oriented](../../Concepts/Designs/Programming_Paradigms/Object-Oriented_Programming.md), and [functional programming](../../Concepts/Designs/Programming_Paradigms/Functional_Programming.md)

Created by **Guido van Rossum** and first released in **1991**

- Python's design philosophy **emphasizes code readability** with its notable use of significant whitespace
- Python is often described as a "batteries included" language due to its comprehensive standard library

## Introduction

Python was conceived in the late 1980s as a successor to the ABC language. Python 2.0, released in 2000, introduced features like list comprehensions and a garbage collection system capable of collecting reference cycles. Python 3.0, released in 2008, was a major revision of the language that is not completely backward-compatible, and much Python 2 code does not run unmodified on Python 3

The Python 2 language, i.e. Python 2.7.x, is "sunsetting" on January 1, 2020 (after extension; first planned for 2015), and the Python team of volunteers will not fix security issues, or improve it in other ways after that date. With the end-of-life, only Python 3.5.x and later will be supported

Python interpreters are available for many operating systems. A global community of programmers develops and maintains _CPython_, an open source reference implementation. A non-profit organization, the Python Software Foundation, manages and directs resources for Python and _CPython_ development

### Setup

Download Python from the [official website](https://www.python.org/) and install it on your system. You can also use the package manager to install Python on your system

Once Python is installed, you can check the version by running the following command:

```bash
python --version

# Output: Python 3.12.5
```

### Python Command Line

Python comes with an interactive command line that allows you to write and execute code in a single line. To open the Python command line, run the following command:

```bash
python

# Output:
# Python 3.12.5 (main, Aug  9 2024, 08:20:41) [GCC 14.2.1 20240805] on linux
# Type "help", "copyright", "credits" or "license" for more information
>>>
```

- To execute a single line of code, type the code and press `Enter`

  ```python
  print("Hello, World!")

  # Output: Hello, World!
  ```

- To execute multiple lines of code, use tabs or spaces to indent the code block:

  ```python
  >>> for i in range(2):
  ...     print(i)
  ...
  # Output:
  # 0
  # 1
  ```

- To exit the Python command line, press `Ctrl + D` or type `exit()`
- To use python's built in help, type `help()` and then type the function name you want help with

### Sample Project

1. Create a folder with the project name and navigate to the folder:

   ```bash
   mkdir project_name
   cd project_name
   ```

2. Create virtual python environment, so that the project related packages are confined to the project and will have a specific version:

   ```bash
   # create a virtual environment
   # it will create a `.venv` folder in the project directory
   python3 -m venv .venv
   ```

3. Activate the environment:

   ```bash
   # On Windows, run:
   .venv\Scripts\activate.bat

   # On Unix or MacOS, run:
   source .venv/bin/activate
   ```

4. Create a `main.py` file and write the following code:

   ```python
   print("Hello, World!")
   ```

5. Run the `main.py` file:

   ```bash
   python main.py

   # Output: Hello, World!
   ```

#### Setup Using [uv](https://docs.astral.sh/uv/)

### Python 2 vs. Python 3

Python 2 and Python 3 are two versions of the Python programming language. Python 3 introduced many **backwards-incompatible** changes to the language, so code written in Python 2 may not work under Python 3 and vice versa. For example, Python 3 removed the `print` statement and replaced it with a `print()` function

```python
# 2to3 -w filename.py
# python2x
from __future__ import division  # imports python3

print "Hello World"  # is acceptable in Python 2
print ("Hello World")  # in Python 3, print must be followed by ()
# print x,           # Trailing comma suppresses newline in Python 2
# print(x, end=" ")  # Appends a space instead of a newline in Python 3

# python2 has 2 inputs, input() and raw_input()#input() function treats received data as string if it is included in quotes '' or "", otherwise data is treated as number
```

## Python Syntax

Python syntax is simple and easy to learn. It is **based on indentation** and doesn't require curly braces `{}` to define blocks of code

- Python uses indentation to define the scope of the code. The number of spaces is up to you as a programmer, but it has to be at least one. The standard is to use **4 spaces**

```python
if 5 > 2:
    print("Five is greater than two!")

# the if block is defined by the indentation
```

- Python allows you to put multiple statements on a single line using a semicolon `;`

  ```python
  print("Hello, World!"); print("Hello, Python!")
  ```

### Comments

Python uses the `#` symbol to write comments. Comments are ignored by the Python interpreter

```python
# This is a comment
print("Hello, World!")  # This is also a comment
```

Python does not have a syntax for multi-line comments. To add a multi-line comment, you can use triple quotes `"""` or `'''`

```python
"""
This is a comment
written in
more than just one line
"""
```

### Variables

Python has no command for declaring a variable. A variable is created the moment you first assign a value to it

```python
x = 5
y = "Hello, World!"

a, b = 0, 1  # which is equal to a=0 and b=1 initialization
```

- Variables do not need to be declared with any particular type and can even change type after they have been set
- Variables can be of any type, and you can change the type of a variable by assigning a new value of a different type to it

```python
x = 5  # x is of type integer
x = "Hello, World!"  # x is now of type string
```

Naming rules for variables:

- A variable name must start with a letter or the underscore character `_`
- After the first letter, a variable name can contain letters, numbers, or underscores
- Python is case-sensitive
- Use PEP 8 naming conventions

### Data Types

Python has the following data types:

- `str` (_string_): Text type, represents a sequence of characters (e.g. `"Hello, World!"`)
- `int` (_integer_): Whole numbers, positive or negative, without decimals (e.g. `42`)
- `float` (_float_): Floating-point numbers, positive or negative, containing one or more decimals (e.g. `3.14`)
- `complex`: Complex numbers, written with a `j` as the imaginary part (e.g. `1 + 2j`)
- `bool` (_boolean_): `True` or `False` values
- `list`: Ordered, changeable, and allows duplicate members
- `tuple`: Ordered, unchangeable, and allows duplicate members
- `range`: Returns a sequence of numbers, starting from 0 by default, and increments by 1 (by default), and stops before a specified number
- `dict` (_dictionary_): Unordered, changeable, and indexed, with key-value pairs
- `set`: Unordered, unindexed, and does not allow duplicate members
- `frozenset`: Unordered, unchangeable, and does not allow duplicate members
- `bytes`: Represents a group of bytes
- `bytearray`: Represents a mutable sequence of bytes
- `memoryview`: Returns a memory view object

### Operators

Python has the following operators:

- `+`: Addition (`1 + 2` is `3`) or concatenation (`"Hello, " + "World!"` is `"Hello, World!"`)
- `-`: Subtraction (`2 - 1` is `1`)
- `*`: Multiplication (`2 * 3` is `6`) or repetition (`"Hello, " * 3` is `"Hello, Hello, Hello, "`)
- `/`: Division (`6 / 3` is `2`)
- `%`: Modulus (`5 % 2` is `1`)
- `**`: Exponentiation (`2 ** 3` is `8`)
- `//`: Floor division (`5 // 2` is `2`)
- `==`: Equal to (`5 == 5` is `True`)
- `!=`: Not equal to (`5 != 5` is `False`)
- `>`: Greater than (`5 > 3` is `True`)
- `<`: Less than (`3 < 5` is `True`)
- `>=`: Greater than or equal to (`5 >= 3` is `True`)
- `<=`: Less than or equal to (`3 <= 5` is `True`)
- `and`: Logical and (`True and False` is `False`)
- `or`: Logical or (`True or False` is `True`)
- `not`: Logical not (`not True` is `False`)
- `in`: Membership (`x in y` is `True` if `x` is a member of `y`)
- `is`: Identity (`x is y` is `True` if `x` and `y` are the same object)

### Strings

Strings in Python are surrounded by either single quotation marks `'` or double quotation marks `"`

```python
x = "Hello, World!"
y = 'Hello, World!'
```

- You can assign a multiline string to a variable by using three quotes `'''` or `"""`

  ```python
  a = """Lorem ipsum dolor sit amet,
  consectetur adipiscing elit,
  sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."""
  ```

- Strings are arrays of bytes representing Unicode characters. However, Python **does not have a character data type**, a single character is simply a string with a length of 1

  ```python
  x = "Hello, World!"
  x[1]  # Output: e
  ```

- You can return a range of characters by using the _slice syntax_
  - `string[start:end]`: Get the characters from position `start` to position `end` (not included)

  ```python
  x = "Hello, World!"
  x[2:5]  # Output: llo
  x[:5]  # Output: Hello
  x[2:]  # Output: llo, World!
  ```

- Python has a set of built-in methods that you can use on strings

  ```python
  # To get the length of a string, use the `len()` function
  x = "Hello, World!"
  len(x)  # Output: 13

  min(x) # returns the character with the lowest value
  # Output: " "

  max(x) # returns the character with the highest value
  # Output: "r"

  x.count("l")  # count(x[, y[, z]]) returns the number of times a specified value occurs in a string
                # x (string), y (start), z (end)
  # Output: 3

  x.find("o")  # find(x[, y[, z]]) returns the index of the first occurrence of the specified value else returns -1
  x.index("o")  # index(x[, y[, z]]) returns the index of the first occurrence of the specified value else throws an error
  # Output: 4

  x.capitalize()  # converts the first character to upper case
  x.upper()  # converts a string to upper case

  x.isaplha()  # returns True if all characters in the string are alphabets
  x.isdigit()  # returns True if all characters in the string are digits

  x.replace("H", "J")  # replaces a string with another string
  # Output: "Jello, World!"

  y = x.split(",")  # splits the string into substrings if it finds instances of the separator
  # Output: ['Hello', ' World!']

  x = " Hello, World! "
  x.strip()  # Output: "Hello, World!"
  ```

- Operations on strings:

  ```python
  # concatenation
  first_name = "John"
  last_name = "Doe"
  full_name = first_name + " " + last_name

  # repetition
  warning = "Don't touch this! " * 3

  "hello" in "hello, world"  # True
  ```

- Formatting strings:

  ```python
  age = 36
  txt = "My name is John, and I am {}"
  txt.format(age)

  # you can use `f-string` to format strings
  quantity = 30
  unit_price = 49.95
  print(f"Total price: {quantity * unit_price:.2f}")
  # Output: Total price: 1498.5

  # you can format the output using the `:` character
  print(f"Total price: {quantity * unit_price:.2f}") # `.2f` formats the output to 2 decimal places
  # Output: Total price: 1498.50
  print(f"Total price: {quantity * unit_price:,}") # `,` adds a comma as a thousand separator
  # Output: Total price: 1,498.50

  # format percentage
  percentage = 0.25
  print(f"Percentage: {percentage:.2%}") # `.2%` formats the output to 2 decimal places
  # Output: Percentage: 25.00%

  # format width and alignment
  sales_tax_rate = 0.065
  subtotal = quantity * unit_price
  sales_tax = subtotal * sales_tax_rate
  total = subtotal + sales_tax
  output = f"""
  Subtotal:   ${subtotal:>9,.2f}
  Sales Tax:  ${sales_tax:>9,.2f}
  Total:      ${total:>9,.2f}
  """
  print(output) # `>9` right-aligns the output to 9 characters
  # Output:
  # Subtotal:   $ 1,498.50
  # Sales Tax:  $    97.41
  # Total:      $ 1,595.91
  ```

For a full list of string methods, refer to the [Python documentation](https://docs.python.org/3/library/stdtypes.html#string-methods)

### Casting

If you want to specify the data type of a variable, you can use the following functions:

- `int()`: constructs an integer number from an integer literal, a float literal (by rounding down to the previous whole number), or a string literal (providing the string represents a whole number)
- `float()`: constructs a float number from an integer literal, a float literal, or a string literal (providing the string represents a float or an integer)
- `str()`: constructs a string from a wide variety of data types, including strings, integer literals, and float literals

```python
x = int(1)  # x will be 1
y = int(2.8)  # y will be 2
z = int("3")  # z will be 3
```

## Conditional Statements

Python supports the usual logical conditions from mathematics:

- `if`: If the condition is `True`, the code block is executed
- `elif`: If the previous conditions were not `True`, then try this condition
- `else`: If none of the above conditions are `True`, then execute this block

```python
if condition:
    # code block
elif condition:
    # code block
else:
    # code block
```

_Example:_

```python
a = 33
b = 200

if b > a:
    print("b is greater than a")
elif a == b:
    print("a and b are equal")
else:
    print("a is greater than b")

# short Hand If
if a > b: print("a is greater than b")
```

- Terary operator is shorthand for `if` and `else` statements, in python it is called _conditional expression_

```python
a = 200
b = 33

print("A") if a > b else print("B")
```

Truthy and falsy values:

- In Python, the following values are considered `False`:
  - `False`
  - `None`
  - `0`
  - `0.0`
  - `""` (empty string)
  - `[]` (empty list)
  - `{}` (empty dictionary)
  - `()` (empty tuple)
  - `set()` (empty set)

- All other values are considered `True`

```python
taxable = True
if taxable:
    print("0 is True")

# above is same as
if taxable == True:
    print("0 is True")

if not taxable:
    print("0 is False")
```

## Loops

Loops are used to iterate over a sequence (e.g. a list, tuple, dictionary, set, or string)

### `for` Loop

The `for` loop is used to iterate over a sequence of items

```python
fruits = ["apple", "banana", "cherry"]

# iterate over the list
for x in fruits:
    print(x)
```

- You can use the `break` statement to stop the loop before it has looped through all the items

```python
fruits = ["apple", "banana", "cherry"]

for x in fruits:
    print(x)
    if x == "banana":
        break
```

- You can use the `continue` statement to stop the current iteration of the loop and continue with the next

```python
fruits = ["apple", "banana", "cherry"]

for x in fruits:
    if x == "banana":
        continue
    print(x)
```

- You can loop through a range of numbers using the `range(x[, y[, z]])` function

```python
for x in range(6): # range(6) is 0 to 5
    print(x)

range(2, 6) # range(2, 6) is 2 to 5

range(2, 30, 3) # range(2, 30, 3) is 2, 5, 8, 11, 14, 17, 20, 23, 26, 29
# 3 is the increment value
```

- Looping through a string

```python
for x in "banana":
    print(x)
```

### `while` Loop

The `while` loop is used to execute a set of statements as long as a condition is `True`

```python
while condition:
    # code block
```

You can use the `break` statement exit the loop and the `continue` statement to skip the current iteration of the loop

_Example:_

```python
i = 1
while i < 6:
    print(i)
    i += 1
```

## Functions

A function is a block of code that only runs when it is called. You can pass data, known as _parameters_, into a function. A function can return data as a result

```python
def my_function():
    print("Hello, World!")

my_function()
```

- You can pass data, known as arguments, into a function

```python
def my_function(fname):
    print(fname + " Refsnes")

my_function("Emil")
```

- You can specify a default parameter value

```python
def my_function(country = "Norway"):
    print("I am from " + country)

my_function("India")
my_function()
```

- You can pass a variable number of arguments by using the `*args` parameter

```python
def my_function(*kids):
    print("The youngest child is " + kids[2])

my_function("Emil", "Tobias", "Linus")
```

- You can pass a keyworded, variable-length argument list by using the `**kwargs` parameter

```python
def my_function(**kid):
    print("His last name is " + kid["lname"])

my_function(fname = "Tobias", lname = "Refsnes")
```

- You can return a value from a function using the `return` statement

```python
def my_function(x):
    return 5 * x

a = my_function(3)
print(a)
```

### Lambda Functions

### Built-in Functions

Python has a set of built-in functions that you can use on various data types

```python
# general functions
help("def")             # get help to know about python
print("Hello, World!")  # used to print the string
print(5, end=" ")       # end parameter is used to append any string at the end of the output
                        # default value of end is "\n" which is a new line
type(5)                 # returns the type of the passed argument

# functions for strings
str(7)                  # converts value to string

# functions for numbers
bin(5)  # represents value in binary format
hex(5)  # represents value in hexadecimal format
oct(5)  # represents value in octal format
int(5.5)        # converts float to integer (truncates the decimal part)
int("5")        # converts string to integer (if string is float, it will throw an error)
float(5)        # converts integer and string to float: 5.0

abs(-5)         # return the absolute value of the argument: 5
round(6.655)    # rounds the number to the nearest integer: 7
round(6.655, 2) # rounds the number to 2 decimal places: 6.66
# i.e. 16.66666 to 16.667 using round(16.66666 , 3)
max(2,3,6,5)    # returns the maximum value: 6
min(2,3,6,5)    # returns the minimum value: 2

max([1, 5])     # maximum value in the list or something
min([1, 5])     # minimum value in the list or something

complex(real, imag) # returns a complex number with the value real + imag*1j
complex(1, 2)       # 1+2j
```

### Recursion

## Lists

A list is a collection that is ordered and changeable. In Python, lists are written with square brackets `[]`

```python
thislist = ["apple", "banana", "cherry"]
canContainAnyData = [1, "apple", True, 3.14]
```

You can also use the `list()` constructor to make a new list

```python
thislist = list(("apple", "banana", "cherry")) # note the double round-brackets
```

Operations on lists:

```python
# refer to the list items by referring to the index number
thislist[1]  # Output: banana

# you can change the value of a specific item by referring to the index number
thislist[1] = "blackcurrant" # Output: ['apple', 'blackcurrant', 'cherry']

# you can loop through the list items by using a `for` loop
for x in thislist:
    print(x)

# to determine if a specified item is present in a list, use the `in` keyword
if "apple" in thislist:
    print("Yes, 'apple' is in the fruits list")

# to determine how many items a list has, use the `len(x)` function
len(thislist)  # Output: 3

# to add an item to the end of the list, use the `append(item)` method
thislist.append("orange") # Output: ['apple', 'banana', 'cherry', 'orange']

# to add an item at the specified index, use the `insert(position, item)` method
thislist.insert(1, "orange") # Output: ['apple', 'orange', 'banana', 'cherry']

# to remove a specified item, use the `remove(item)` method
# if index is out of range it throws: ValueError: list.remove(x): x not in list
thislist.remove("banana") # Output: ['apple', 'cherry']

# remove using slice syntax
thislist[1:2] = [] # Output: ['apple', 'cherry']

# you can use `del` keyword to remove an item at a specified index
del thislist[0] # Output: ['cherry']

# to remove an item at a specified index, use the `pop(index)` method
thislist.pop(1) # Output: ['apple']

# to remove the last item, use the `pop()` method
# if list is empty it throws: IndexError: pop from empty list
thislist.pop() # Output: []

# to empty the list, use the `clear()` method
thislist.clear() # Output: []

# copying a list is by reference, i.e. if you change the copied list, the original list will also change
a = [1, 2, 3]
b = a
b[0] = 4
print(a) # Output: [4, 2, 3]

# to copy a list without reference, use the `copy()` method
mylist = thislist.copy() # Output: ['apple', 'banana', 'cherry']

# to join two lists, use the `extend()` method
list1 = ["a", "b", "c"]
list2 = [1, 2, 3]
list1.extend(list2) # Output: ['a', 'b', 'c', 1, 2, 3]

# you can also use the `+` operator to join two lists
list1 = ["a", "b", "c"]
list2 = [1, 2, 3]
list3 = list1 + list2 # Output: ['a', 'b', 'c', 1, 2, 3]

# `count(x)` returns the number of times a specified value occurs in a list
list1 = ["a", "b", "c", "a"]
list1.count("a") # Output: 2

# find the index of the first occurrence of the specified value
list1.index("a") # Output: 0

# sort the list in ascending order
list1.sort() # Output: ['a', 'a', 'b', 'c']

# sort the list in descending order
list1.sort(reverse=True) # Output: ['c', 'b', 'a', 'a']

# custom sorting
def myfunc(n):
    return abs(n - 50)

list1 = [100, 50, 65, 82, 23]
list1.sort(key=myfunc) # Output: [50, 65, 23, 82, 100]

# reverse the order of the list
list1.reverse() # Output: ['a', 'b', 'c', 'a']
```

If you try to access an index that does not exist, you will get an `IndexError`

```python
thislist = ["apple", "banana", "cherry"]
thislist[3]
# Output: IndexError: list index out of range
```

### List Comprehension

List comprehension offers a shorter syntax when you want to create a new list based on the values of an existing list

```python
fruits = ["apple", "banana", "cherry", "kiwi", "mango"]

# create a new list containing only the fruits with the letter "a" in the name
newlist = [x for x in fruits if "a" in x]
# Output: ['apple', 'banana', 'mango']

# create a new list containing only the fruits with the letter "a" in the name, as well as the letter "i"
newlist = [x for x in fruits if "a" in x and "i" in x]
# Output: ['kiwi', 'mango']

# create a new list where each item in the new list is the item in the original list, if it is a fruit with the letter "a" in the name
newlist = [x if "a" in x else "Not a fruit" for x in fruits]
# Output: ['apple', 'banana', 'Not a fruit', 'kiwi', 'mango']

# create a new list containing the name of each fruit, with the letter "a" replaced with the letter "b"
newlist = [x.replace("a", "b") for x in fruits]
# Output: ['bpple', 'bbnbnb', 'cherry', 'kiwi', 'mbngo']
```

## Tuples

A tuple is a collection that is ordered and unchangeable. In Python, tuples are written with round brackets `()`

- You can perform the same operations on tuples as you can on [lists](#lists), except for operations that modify the tuple

```python
thistuple = ("apple", "banana", "cherry")

# you can access items in a tuple by referring to the index number
thistuple[1]  # Output: banana

# you cannot change the values in a tuple
thistuple[1] = "blackcurrant" # TypeError: 'tuple' object does not support item assignment
```

## Sets

A set is a collection that is unordered and unindexed. In Python, sets are written with curly brackets `{}`

- The difference between a set and a list is that a set does not allow duplicate values and the items in a set have no specific order

- Even though you may define the set with the items in certain order, none of the items get index numbers to identify their position

- You can perform the most operations on sets as you can on [lists](#lists)

```python
thisset = {"apple", "banana", "cherry"}

# you can add items to a set using the `add(item)` method
thisset.add("orange") # Output: {'apple', 'banana', 'cherry', 'orange'}

# you can add multiple items to a set using the `update(items)` method
thisset.update(["orange", "mango", "grapes"]) # Output: {'apple', 'banana', 'cherry', 'orange', 'mango', 'grapes'}

# you can remove an item from a set using the `remove(item)` or `discard(item)` method
thisset.remove("banana") # Output: {'apple', 'cherry', 'orange', 'mango', 'grapes'}
thisset.discard("banana") # Output: {'apple', 'cherry', 'orange', 'mango', 'grapes'}

# if you try to access an item using the index number, you will get an error
thisset[1] # TypeError: 'set' object is not subscriptable
```

## Date and Time

Python has a built-in module called `datetime` to work with dates and times

```python
import datetime as dt

# get today's date
today = dt.date.today() # datetime.date(2024, 11, 8)
print(today) # Output: 2024-11-08

last_of_teens = dt.date(2019, 12, 31)
print(last_of_teens.year) # Output: 2019

# variable = datetime.time([hour[, minute[, second[, microsecond[, tzinfo]]]]])
midnight = dt.time()
print(midnight) # Output: 00:00:00

almost_midnight = dt.time(23, 59, 59, 999999)

# both date and time
# datetime.datetime(year, month, day[, hour[, minute[, second[, microsecond[, tzinfo]]]]])

new_year = dt.datetime(2025, 1, 1, 0, 0, 0) # 2025-01-01 00:00:00
```

- The `datetime` module has classes for manipulating dates and times
  - `datetime.date`: An idealized naive date, assuming the current Gregorian calendar always was, and always will be, in effect
  - `datetime.time`: An idealized time, independent of any particular day, assuming that every day has exactly 24*60*60 seconds
  - `datetime.datetime`: A combination of a date and a time
  - `datetime.timedelta`: A duration expressing the difference between two date, time, or datetime instances to microsecond resolution
  - `datetime.tzinfo`: An abstract base class for time zone information objects

Formatting strings for dates and times:

| Directive | Meaning                                                     | Example                    |
| --------- | ----------------------------------------------------------- | -------------------------- |
| `%a`      | Weekday, short version                                      | `Wed`                      |
| `%A`      | Weekday, full version                                       | `Wednesday`                |
| `%w`      | Weekday as a number 0-6, 0 is Sunday                        | `3`                        |
| `%d`      | Day of month 01-31                                          | `31`                       |
| `%b`      | Month name, short version                                   | `Dec`                      |
| `%B`      | Month name, full version                                    | `December`                 |
| `%m`      | Month as a number 01-12                                     | `12`                       |
| `%y`      | Year, short version, without century                        | `22`                       |
| `%Y`      | Year, full version                                          | `2022`                     |
| `%H`      | Hour 00-23                                                  | `14`                       |
| `%I`      | Hour 00-12                                                  | `02`                       |
| `%p`      | AM/PM                                                       | `PM`                       |
| `%M`      | Minute 00-59                                                | `55`                       |
| `%S`      | Second 00-59                                                | `55`                       |
| `%f`      | Microsecond 000000-999999                                   | `548513`                   |
| `%z`      | UTC offset                                                  | `+0100`                    |
| `%Z`      | Timezone                                                    | `CST`                      |
| `%j`      | Day number of year 001-366                                  | `365`                      |
| `%U`      | Week number of year, Sunday as the first day of week, 00-53 | `52`                       |
| `%W`      | Week number of year, Monday as the first day of week, 00-53 | `52`                       |
| `%c`      | Local version of date and time                              | `Thu Dec 31 14:55:02 2022` |
| `%x`      | Local version of date                                       | `12/31/22`                 |
| `%X`      | Local version of time                                       | `14:55:02`                 |
| `%%`      | A `%` character                                             | `%`                        |

- Format date and time:

  ```python
  from datetime import datetime

  date = datetime(2022, 12, 31)
  print(f"Date: {date:%Y-%m-%d}") # `%Y-%m-%d` formats the date to `YYYY-MM-DD`
  # Output: Date: 2022-12-31
  ```

Working with time zones:

- Use `gettz` to get a time zone object from the package `dateutil`

  ```bash
  pip install python-dateutil
  ```

  ```python
  from dateutil.tz import gettz

  tz = gettz("America/New_York")

  # UTC time
  print(f"{dt.datetime.now(gettz('Etc/UTC')):%A %D %I:%M %p %Z}") # Output: Monday 12/31/22 02:55 PM UTC

  # USA Eastern time
  print(f"{dt.datetime.now(gettz('America/New_York')):%A %D %I:%M %p %Z}") # Output: Monday 12/31/22 09:55 AM EST
  ```

### Time

Python has a built-in module called `time` that allows you to work with time

```python
import time

start_time = time.time()
print("\n\n--- %s seconds ---" % (time.time() - start_time))
```

## Internationalization

Python provides built-in support for internationalization and localization

- Python supports POSIX locale database and the `locale` module provides a way to access the database and format numbers, dates, and currency values according to the user's locale

```python
import locale

amount = 123456.78

# set the locale to US English
locale.setlocale(locale.LC_ALL, "en_US.UTF-8")

# currency formatting
print(locale.currency(amount, grouping=True))
```

## Packages

- [appdirs](https://github.com/ActiveState/appdirs):
  - A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir"

- [asn1crypto](https://github.com/wbond/asn1crypto):
  - A fast, pure Python library for parsing and serializing ASN.1 structures

- [astroid](https://github.com/PyCQA/astroid):
  - A common base representation of python source code for pylint and other projects

- [attrs](https://www.attrs.org/en/stable/):
  - attrs is the Python package that will bring back the joy of writing classes by relieving you from the drudgery of implementing object protocols (aka dunder methods).

- [Automat](https://github.com/glyph/Automat):
  - Automat is a library for concise, idiomatic Python expression of finite-state automata (particularly deterministic finite-state transducers).

## Python Everything

```python
# os library
import os

os.getcwd()  # gives current path
os.mkdir("directory name")  # makes directory in the current directory
os.rename("old_name", "new_name")  # renames the files and directories
os.rmdir("dirname")  # deletes the directory
os.remove("test.txt")  # deletes the file
os.chdir("directory path")  # change directory path

# sys library
import sys

sys.stderr.write("This is stderr text")  # used to print error
sys.stderr.flush()
sys.stdout.write("This is stdout text")

print(sys.argv)  # gets file name and get input from other Languages

print("what is ur name")

name = sys.stdin.readline()
print("Hello", name)

print("%c is my %s letter and my number %d is %.5f" % ("X", "favorite", 1, 0.14))

import urllib.parse

# urllib library
import urllib.request

urllib.parse.urlencode("")
urllib.request.Request("")
urllib.request.urlopen("")

import math
from tkinter import EXCEPTION

math.floor(2.6)  # round() like function rounds to down
math.ceil(2.6)  # round() like function rounds to up

import time

start_time = time.time()
print("\n\n--- %s seconds ---" % (time.time() - start_time))

import statistics

x = [1, 2, 3, 4, 5]

me = statistics.mean(x)
medi = statistics.median(x)
sdev = statistics.stdev(x)
ver = statistics.variance(x)

# import statistics as s
# from statistics import *  # all without using statistics
# from statistics import mean
# from statistics import mean as m
# from statistics import median

# print("my name is %s and wiegergjg %d dfsf", %("Prabhu", 25))

# ! or # -*- coding: encoding -*-
# ex: # -*- coding: cp-1252 -*- which uses Windows-1252 encoding

a, b = 0, 1  # which is equal to a=0 and b=1 initialization
print(
    b, end=","
)  # end can be used to avoid the newline after the output, or end the output with a different string

# (quotient without floating point) i.e. 17/3 is 5.66667 but 17//3 is 5 using _ we can add the value the previous answer i.e. new + _

# The "pass"  statement does nothing
pass

print(r"C:\some\name")  # r used to to differentiate \name form \n

# lists are like arrays []
squares = [1, 4, 9, 16, "a"]
new_squares = squares + [36, 49, 64, 81, 100]

squares.append(55)  # to add item to end of list
squares[2:5] = []  # to remove items from 2 to 4
a = ["a", "b", "c"]
n = [1, 2, 3]  # adding to x, x = [a, n]

for w in squares:  # prints from squares
    print(w, len(w))

for i in range(5):  # prints 0 to 4
    pass

for i in range(0, 5, 3):  # prints 0, 3
    pass

for i in range(len(squares)):
    # prints all squares
    print(i, squares[i])

list(range(5))  # gives [0, 1, 2, 3, 4]

# numbers, string, lists, tuples, dictionary

# ** = power to


print("%s %s %s" % ("I like", quote, multiline_quote))

print("I do't like this", end="")

# import modules using = import_random, import_sys, import_os
# Lists [] will have index with first one having index = 0

grocery_lis = ["Juice", "Tomatoes", "Potato"]
print("First item", grocery_lis[0])
print(grocery_lis[0:2])

others = ["wash car", "pick up kids"]
to_do = [grocery_lis, others]

grocery_lis.append("Onions")
grocery_lis.insert(1, "Pickle")
grocery_lis.remove("Juice")
grocery_lis.remove(grocery_lis[3])
grocery_lis.sort()
grocery_lis.reverse()
grocery_lis.index("Pickle")
grocery_lis.count("Onions")  # counts the number of times Onions is in grocery_lis

del grocery_lis[4]

to_do_list = others + grocery_lis
print(len(to_do_list))
print(max(to_do_list))
print(min(to_do_list))


# CSV
import csv

with open("exm.csv") as csv_file:
    readCSV = csv.reader(csv_file, delimiter=",")

# tuples() unlike lists we will not be able to change it after it is created they are faster

pi_tuple = (3, 1, 4, 1, 5, 9)
pi_tuple = 3, 1, 4, 1, 5, 9  # its a tuple

new_list = list(pi_tuple)
new_tuple = tuple(new_list)

len(new_tuple), min, max

# Dictionary {} values with unique keys and you cannot join keys
# name = {key:value, key:value}

super_villain = {"Fiddler": "Isaac Bowin", "007": "123"}
del super_villain["Fiddler"]  # delete
super_villain["007"] = "009"  # adds to the Dictionary no order

print(super_villain.get("007"))
print(super_villain.keys())
print(super_villain.values())

# conditionals if, else, elif

try:  # it checks if there is any error inside it
    print("working")  # and if error is there it will go to exact
except Exception as e:  # Exception or NameError these are error handling
    print(e)  # it will print = 'xxasd' is not in ____


age = 21

if age > 16:
    print("You")
else:
    print("Not")

if age > 21:
    print("YNO")
elif age >= 16:
    print("yuno")
else:
    print("W")

# AND_OR_NOT

if (age > 0) and (age <= 18):
    print("You")
elif (age >= 21) or (age <= 65):
    print("Not")
elif not (age == 30):
    print("You dont get it")
else:
    print("nothing")

# loops

for x in range(0, 10):
    print(x, " ", end="")

for y in grocery_lis:
    print(y)

for x in [2, 4, 6, 8, 10]:
    print(x)

num_lis = [[1, 2, 3], [10, 20, 30], [100, 200, 300]]
for x in range(0, 3):
    for y in range(0, 3):
        print(num_lis[x][y])

import random

random_num = random.randrange(0, 100)
while random_num != 15:
    print(random_num)
    random_num = random.randrange(0, 100)

print("just finished")

i = 0
while i <= 20:
    if i % 2 == 0:
        print(i)
    elif i == 9:
        break
    else:
        i += 1
        continue
    i += 1


def Main():  # using main function
    print("Hello, World!!!")


if __name__ == "__main__":
    Main()


def add_number(fNum, lNum):
    sumNum = fNum + lNum
    return sumNum


print(add_number(1, 4))


# Variable-length arguments
def print_info(arg1, *var_tuple):
    print("Output is: ")
    print(arg1)
    for var in var_tuple:
        print(var)
    return


print_info(10)
print_info(70, 60, 50)

#!/usr/bin/python
# shows linux where to find python
# will work only if used as main code and will not work when used as module
if __name__ == "__main__":
    print("Such a great module!!!!")

# lambda
sum = lambda arg1, arg2: arg1 + arg2
print("Value of total : ", sum(10, 20))

global var_name  # use global to access global variables inside a function

# locals() and globals() functions can be used to see all local variables and global variables in that function


# r = readonly (default mode)
# rb = readonly in binary format (default mode)
# r+ = read and write
# rb+ = read and write in binary
# x = create a new file and open for writing
# w and a have all 4 modes

test_file = open("test.txt", "wb")  # "ab+" to rad and append file
print(test_file.mode)
print(test_file.name)
print(test_file.closed)
test_file.write(bytes("Write me to the file\n", "UTF-8"))
test_file.close()

test_file = open("test.txt", "r+")
test_file_in = test_file.read()
print(test_file_in)

# tell() tells position of in the file
# seek(offset, from) goes to the specific position in file from = 0(beginning), 1(current), 2(end of file)


def marks(mark):
    assert mark >= 0  # this produces an error if mark is smaller than 0


try:
    print("working good")
except EXCEPTION as e:  # only except: can also be written
    print("this went wrong" + e)
else:
    print("Everything went smoothly")

# or

try:
    pass
finally:  # some code that has to happen even if try dose not occur
    # fh.close()
    pass


def marks(mark):
    if mark > 100 and mark < 0:
        raise Exception(mark)  # produces an exception


class Network_Error(RuntimeError):  # user defined exception
    def __init__(self, arg):
        self.args = arg


try:
    raise Network_Error("Bad hostname")
except Network_Error as e:
    print(e.args)


class Animal:
    __name = ""  # or = None #__name can also be written as name
    __height = 0
    __weight = 0
    __sound = 0

    def __init__(self, name, height, weight, sound):
        self.__name = name
        self.__height = height
        self.__weight = weight
        self.__sound = sound

    def set_name(self, name):
        self.__name = name

    def get_name(self):
        return self.__name

    def set_sound(self, sound):
        self.__sound = sound

    def get_sound(self):
        return self.__sound

    def get_type(self):
        print("Animal")

    def toString(self):
        return "{} is {} cm tall and {} kilogram and say {}".format(
            self.__name, self.__height, self.__weight, self.__sound
        )


cat = Animal("Wiskers", 33, 10, "Meow")
print(cat.toString())


class Dog(Animal):
    __owner = None

    def __init__(self, name, height, weight, sound, owner):
        self.__owner = owner
        super(Dog, self).__init__(name, height, weight, sound)

    def set_owner(self, owner):
        self.__owner = owner

    def get_owner(self):
        return self.__owner

    def get_type(self):
        print("Dog")

    def toString(self):
        return "{} is {} cm tall and {} kilogram and say {} his owner is {}".format(
            self.__name, self.__height, self.__weight, self.__sound, self.__owner
        )

    def multiple_sounds(self, how_many=None):
        if how_many is None:
            print(self.get_sound())
        else:
            print(self.get_sound() * how_many)


spot = Dog("Spot", 53, 27, "Ruff", "Prabhu")
print(spot.toString())
```
