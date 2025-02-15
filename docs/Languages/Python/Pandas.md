---
title: Pandas
description: A Python library for data manipulation and analysis
date: 2024-11-01
lastmod: 2024-11-01
---

# Pandas

Pandas is a Python library for data manipulation and analysis

It provides fast, flexible, and expressive data structures designed to make working with "relational" or "labelled" data both easy and intuitive

Pandas is well suited for many different kinds of data:

- Tabular data with heterogeneously-typed columns, as in an SQL table or Excel spreadsheet
- Ordered and unordered (not necessarily fixed-frequency) time series data
- Arbitrary matrix data (homogeneously typed or heterogeneous) with row and column labels
- Any other form of observational / statistical data sets. The data actually need not be labelled at all to be placed into a pandas data structure

Pandas is built on top of NumPy

## Installation and Usage

Install pandas using pip:

```bash
pip install pandas
```

### Usage

Create a DataFrame from a dictionary:

```python
import pandas as pd

data = {
    'Name': ['John', 'Anna', 'Peter', 'Linda'],
    'Location': ['New York', 'Paris', 'Berlin', 'London'],
    'Age': [24, 13, 53, 33]
}

df = pd.DataFrame(data)

print(df)
```

## Features

Here are just a few of the things that pandas does well:

- Easy handling of **missing data** (represented as `NaN`) in floating point as well as non-floating point data

- Size mutability: columns can be **inserted and deleted** from DataFrame and higher dimensional objects

- Automatic and explicit **data alignment**: objects can be explicitly aligned to a set of labels, or the user can simply ignore the labels and let `Series`, `DataFrame`, etc. automatically align the data for you in computations

- Powerful, flexible **group by** functionality to perform split-apply-combine operations on data sets, for both aggregating and transforming data

- Make it **easy to convert** ragged, differently-indexed data in other Python and NumPy data structures into DataFrame objects

- Intelligent label-based **slicing, fancy indexing, and sub-setting** of large data sets

- Intuitive **merging and joining** data sets

- Flexible **reshaping** and pivoting of data sets

- **Hierarchical** labelling of axes (possible to have multiple labels per tick)

- Robust IO tools for loading data from **flat files** (CSV and delimited), Excel files, databases, and saving / loading data from the ultrafast **HDF5 format**

- **Time series**-specific functionality: date range generation and frequency conversion, moving window statistics, date shifting, and lagging.

## Data Structures

Two primary data structures of pandas:

| Dimensions | Name                    | Description                                                                                      |
| ---------- | ----------------------- | ------------------------------------------------------------------------------------------------ |
| 1          | [Series](#series)       | 1D labeled homogeneously-typed array                                                             |
| 2          | [DataFrame](#dataframe) | General 2D labeled, size-mutable tabular structure with potentially heterogeneously-typed column |

- Series is a container for scalars
- DataFrame is a container for Series

All pandas data structures are value-mutable (the values they contain can be altered) but not always size-mutable

### Series

- Length of a Series cannot be changed

The length of a Series cannot be changed, but, for example, columns can be inserted into a DataFrame. However, the vast majority of methods produce new objects and leave the input data untouched. In general we like to favor immutability where sensible.

Series as a list representation:

```python
# Let us consider the following list:

# StudentNames = [ "John", "Anna", "Peter" ]

# The above list can be represented as a Series in pandas as follows:
studentNames = pd.Series([ "John", "Anna", "Peter" ], name="StudentNames")
```

### DataFrame

DataFrame is a 2-dimensional labelled data structure with columns of potentially different types (including characters, integers, floating point values, categorical data and more). You can think of it like a spreadsheet or SQL table, or a dictionary of Series objects. It is generally the most commonly used pandas object

DataFrame as a table representation:

```python
# Let us consider the following table:

# |   | Name  | Location | Age |
# |---|-------|----------|-----|
# | 0 | John  | New York | 24  | <-- Row
# | 1 | Anna  | Paris    | 13  |
# | 2 | Peter | Berlin   | 53  |
#       ^
#       |
#     Column

# Each row corresponds to a different person, and the columns represent different attributes

# The above table can be represented as a DataFrame in pandas as follows:
df = pd.DataFrame(
    {
      "Name": [ "John", "Anna", "Peter", ],
      "Location": [ "New York", "Paris", "Berlin", ],
      "Age": [ 24, 13, 53, ],
    }
)

# Print one column (one Series)
print(df["Name"])
```

- Each column in a DataFrame is a [Series](#series)
