---
title: C++
description: It is a general-purpose computer programming language created as an extension of the C
---

# C++

Main function can be used without `return` statement. It by default includes `return 0`

- Think operators as functions like: `cout << "Hello" << endl;` as `cout.print("Hello).print(endl);`

## Arrays

```cpp
#include <iostream>
#include <stdio.h>

using namespace std;

int main()
{
    int A[5] = {1, 5, 5};

    for (int i = 0; i < 5; i++)
    {
        cout << A[i] << endl;
    }

    // FOR EACH LOOP
    for (int x : A)
    {
        cout << x << endl;
    }

    cout << sizeof(int) << endl;
    cout << sizeof(A) << endl;
    printf("Completed");

    return 0;
}
```

- Size of an array can be dynamically provided, but during declaration the items cannot be initialized.

```cpp
int main()
{
    int n;
    cout << "Enter size";
    cin >> n;
    int A[n];

    return 0;
}
```

::: warning NOTE
Only in new C compiler dynamic size declaration is available.
:::

## Header Files

- Mathematical Programming
- Logical Programming

## Visual Studio

- New project --> Empty Project

## Virtual Functions

- Dynamic Dispatch
- V Table

Pure Virtual Functions are similar to Interface or Abstract Class.
