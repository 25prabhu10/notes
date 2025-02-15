---
title: Statistics
description: Statistics is the study of the collection, analysis, interpretation, presentation, and organization of data
date: 2024-11-08
---

# Statistics

Statistics is the study of the collection, analysis, interpretation, presentation, and organization of data. It is a branch of mathematics that deals with the study of data and the process of making conclusions based on that data. Statistics is used in a wide range of fields, including science, business, and social sciences

In short, statistics is the study of data

It includes **descriptive statistics** (the study of methods and tools for collecting data, and mathematical models to describe and interpret data) and **inferential statistics** (the systems and techniques for making probability-based decisions and accurate predictions based on incomplete (sample) data)

## History of Statistics

As its name implies, statistics has its roots in the idea of "the state of things". The word itself comes from the ancient Latin term _statisticum collegium_, meaning "a lecture on the state of affairs". Eventually, this evolved into the Italian word _statista_, meaning "statesman", and the German word _Statistik_, meaning "collection of data involving the State". Gradually, the term came to be used to describe the collection of any sort of data

The modern field of statistics began to take shape from the works of R.A. Fisher in the early 20th century

- Design of experiments
- Sampling theory
- Modern Regression analysis
- Classification problem
- Time series
- Survival analysis
- Categorical analysis

## Descriptive Statistics

Descriptive statistics is the branch of statistics that deals with the collection, presentation, and description of data. It includes methods for summarizing and organizing data, as well as techniques for visualizing data. Descriptive statistics are used to describe the basic features of the data in a study

## Inferential Statistics

Inferential statistics is the branch of statistics that deals with making predictions and inferences about a population based on a sample of data. It involves using probability theory to make decisions about the population based on the sample data. Inferential statistics are used to draw conclusions about a population based on a sample of data

## Pre-requisites

- **Absolute Value**: The absolute value of a number is the distance of the number from zero on the number line. It is always positive or zero

  $$ |x| \equiv \begin{cases} x, & x \geq 0 \\ -x, & x < 0 \end{cases} $$

  - The absolute value of `5` is `5` and `-5` is `5`

  $$ |5| = 5 $$
  $$ |-5| = 5 $$

- **Factorials**: The factorial of a non-negative integer `n` is the product of all positive integers less than or equal to `n`

  - It is defined only for integers greater than or equal to zero:

  $$ n! \equiv \begin{cases} n \cdot (n - 1)!, & n \geq 1 \\ 1, & n = 0 \end{cases} $$

  - Defined as:

  $$ n! = n \times (n-1) \times (n-2) \times \ldots \times 3 \times 2 \times 1 $$

  - The factorial of `5` is `120`

  $$ 5! = 5 \times 4 \times 3 \times 2 \times 1 = 120 $$

- **Summation** (_series_): The summation of a sequence of numbers is the total of all the numbers in the sequence. It is denoted by the Greek letter sigma (upper-case sigma) `Σ`

  - It is a method of representing addition over lots of values without putting `+` after each one

  $$ \sum\_{i=0}^{n} x_i = x_0 + x_1 + x_2 + \ldots + x_n $$

  - Here, the expression below the `Σ` symbol (`i=0`) represents the index variable and what its starting value is, and the expression above the `Σ` symbol (`n`) represents the upper limit of the summation

  _Example:_ The summation of the first `n` natural numbers is given by:

  $$ \sum\_{i=1}^{n} i = 1 + 2 + 3 + \ldots + n = \frac{n \cdot (n + 1)}{2} $$

  - The summation of the first `5` natural numbers is `15`

  $$ \sum\_{i=1}^{5} i = 1 + 2 + 3 + 4 + 5 = 15 $$

- **Infinite series**: An infinite series is the sum of the terms of an infinite sequence of numbers instead of a finite sequence

  _Example:_ The sum of an infinite geometric series is given by:

  $$ \sum\_{k=0}^{\infty} r^k = \frac {1}{1-r} \qquad |r| < 1 $$

### Linear Approximation

Linear approximation is a method used to approximate the value of a function near a given point using the tangent line to the function at that point. It is based on the idea that for small values of `x`, the function can be approximated by a straight line

_Example:_ You have a table of values and you want to approximate the value at 63, but the table dose not have a value at 63.

| `v / α` | 0.20    | 0.10    | 0.05    | 0.025   | 0.01    | 0.005   |
| ------- | ------- | ------- | ------- | ------- | ------- | ------- |
| **40**  | 0.85070 | 1.30308 | 1.68385 | 2.02108 | 2.42326 | 2.70446 |
| **50**  | 0.84887 | 1.29871 | 1.67591 | 2.00856 | 2.40327 | 2.67779 |
| **60**  | 0.84765 | 1.29582 | 1.67065 | 2.00030 | 2.39012 | 2.66028 |
| **70**  | 0.84679 | 1.29376 | 1.66691 | 1.99444 | 2.38081 | 2.64790 |
| **80**  | 0.84614 | 1.29222 | 1.66412 | 1.99006 | 2.37387 | 2.63869 |
| **90**  | 0.84563 | 1.29103 | 1.66196 | 1.98667 | 2.36850 | 2.63157 |
| **100** | 0.84523 | 1.29007 | 1.66023 | 1.98397 | 2.36422 | 2.62589 |

You can use linear approximation to estimate the value at `63` by finding the tangent line to the function at the nearest point in the table

$$ f(x*i) \approx \frac {f(x*{\lceil i \rceil}) - f(x*{\lfloor i \rfloor})}{x*{\lceil i \rceil} - x*{\lfloor i \rfloor}} \cdot (x_i - x*{\lfloor i \rfloor}) + f(x\_{\lfloor i \rfloor}) $$

Here, $x_i$ represents the data point you want to know about, $x_{\lfloor i \rfloor}$ is the known data point _beneath_ the one you want to know about, and $x_{\lceil i \rceil}$ is the known data point _above_ the one you want to know about

- For `x = 63`, the known data points are `60` and `70`

$$ f(63) \approx \frac {f(70) - f(60)}{70 - 60} \cdot (63 - 60) + f(60) = \frac {1.66691 - 1.67065}{10} \cdot 3 + 1.67065 = 1.669528 $$

The value at `63` is approximately `1.669528`, if we calculate manually the actual value `1.669402` a difference of `0.000126`. Close enough for the purpose of estimation

## Different Types of Data

Data are assignments of values onto observations of events and objects. They can be classified by their coding properties and the characteristics of their domains and their ranges

Different ways to classify data (typologies):

- **[Levels of measurement](#level-of-measurement)**

- Mosteller and Tukey's typology (1977):

  1. Names
  2. Grades (ordered labels like beginner, intermediate, advanced)
  3. Ranks (orders with 1 being the smallest or largest, 2 the next smallest or largest, and so on)
  4. Counted fractions (bound by 0 and 1)
  5. Counts (non-negative integers)
  6. Amounts (non-negative real numbers)
  7. Balances (any real number)

- Chrisman's typology (1998): Nominal, Gradation of membership, Ordinal, Interval, Log-interval, Extensive ratio, Cyclical ratio, Derived ratio, Counts, Absolute

- Multivariate data types (e.g. random vectors, random matrices, etc.)

## Level of measurement

The "levels of measurement" or "scales of measurement" classification that describes the nature of information within the values assigned to variables

The "level of measurement" helps in determining how data values can be **organized, compared,** and **analysed**?

The four levels of measurement are (developed by Psychologist Stanley Smith Stevens in 1946):

1. **[Nominal Level](#nominal-level)**
2. **[Ordinal Scale](#ordinal-scale)**
3. **[Interval Scale](#interval-scale)**
4. **[Ratio Scale](#ratio-scale)**

Both, **interval** and **ratio** data are usually combined into a single category called **metric** data

Comparison:

| Incremental progress | Measure property           | Mathematical operators | Advanced operations      | Central tendency              | Variability                                 |
| -------------------- | -------------------------- | ---------------------- | ------------------------ | ----------------------------- | ------------------------------------------- |
| Nominal              | Classification, membership | `=`, `≠`               | Grouping                 | Mode                          | Quantitative variation                      |
| Ordinal              | Comparison, level          | `>`, `<`               | Sorting                  | Median                        | Range, Interquartile range                  |
| Interval             | Difference, affinity       | `+`, `-`               | Comparison to a standard | Arithectic mean               | Deviation                                   |
| Ratio                | Magnitude, amount          | `x`, `/`               | Ratio                    | Geometric mean, harmonic mean | Coefficient of variation, studentized range |

### Qualitative or Categorical Data

Qualitative data is data that describes the quality or characteristics of an object or event

AKA: **categorical data**

#### Nominal Level

Most basic level of measurement, it is used to categorize data into mutually exclusive categories. They are non-numeric and are used to label variables without providing any quantitative value

- Data can be classified into categories or classes (e.g. `gender` variable with categories like `male` or `female`)
- Not possible to rank or order the categories (e.g. `male` is not greater than `female`)

Types of charts used to represent nominal data:

- **Pie chart**
- **Frequency distribution**

#### Ordinal Scale

Ordinal values represent discrete and ordered units. Unlike nominal, here the ordering matters

However, there is no consistency in the relative distance between the adjacent categories. And, similar to nominal data, ordinal data also don't have a meaningful zero

- Categorical data that has an explicit ordering
- AKA: **ordered factor**

_Example:_

- Opinion (agree, mostly agree, neutral, mostly disagree, disagree)
- Socioeconomic status (low income, middle income, high income)

Ordinal scale is a scale with ranks, those ranks only have sense in that they are ordered

- The distance `[rank n]` - `[rank n-1]` is not necessarily the same as `[rank n-1]` - `[rank n-2]`
- But `[rank n]` will be greater than `[rank n-1]` and `[rank n-1]` will be greater than `[rank n-2]` for all `n` where `[rank n]`, `[rank n-1]`, and `[rank n-2]` exist

- Ranks of an ordinal scale may be represented by a system with numbers or names and an agreed order

_Example:_ The Likert scale. Consider five possible responses to a question, perhaps _Our president is a great man_, with answers on this scale

| Response: | Strongly disagree | Disagree | Neither agree nor disagree | Agree | Strongly agree |
| --------- | :---------------: | :------: | :------------------------: | :---: | :------------: |
| Code:     |         1         |    2     |             3              |   4   |       5        |

- Here the answers are a ranked scale reflected in the choice of numeric code
- However, the is no sense in which the distance between `Strongly disagree` and `Agree` is the same as between `Strongly disagree` and `Disagree`

Types of charts used to represent ordinal data:

- **Bar chart**

### Quantitative or Numerical Data

Quantitative data is also known as numerical data which represents the numerical value (i.e., how much, how often, how many)

AKA: **numeric data**

- _Discrete_ data: Data that can only take specific values (e.g. `number of students in a class`)

  - Its values are distinct and separate
  - It **can't be measured but it can be counted**
  - Data that can only take on integer values, such as counts
  - AKA: **meristic**

- _Continuous_ data: Data that can take any value within a range (e.g. `temperature range`)

  - It **can't be counted but they can be measured**
  - Data that can take on any value in an interval, such as weight or length
  - The precision of the measurement is limited only by the precision of the measuring equipment

#### Interval Scale

Interval scale is a scale that not only measures the order but also the exact difference between the values. It is a scale that has a meaningful zero point

The interval type allows for defining the _degree of difference_ between measurements, but not the ratio between measurements

- Represents **ordered units that have the same difference**
- The differences are uniform and meaningful
- The zero point is arbitrary and does not indicate the absence of the quantity being measured (**don't have a true zero**)

_Example:_

- IQ test's intelligence scale
- Time if measured using a 12-hour clock

#### Ratio Scale

Ratio values are also ordered units that have the same difference. Ratio values are **the same as interval values, with the difference that they do have an absolute zero**

_Example:_

- Temperature in Kelvin (0, +10, +20, +30, +40, etc.)
- Height (5ft. 8in., 5ft. 9in., 5ft. 10in., 5ft. 11in., 6ft. 0in. etc.)

```text
How old are you?

A. 18-24 years old
B. 25-34 years old
C. 35-44 years old
D. 45-54 years old
E. 55-64 years old
```
