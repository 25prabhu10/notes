# Key Words

1. **Predicate Functions**: are functions that return a single TRUE or FALSE

2. **Turing Complete**, **Church-Turing Thesis**: Something is "computable" if and only if it can be computed by a **Turing machine**

   - Conditional branching, as a result it should have the ability to jump ("go to")
   - Arbitrary amount of memory (infinite RAM)

3. **Race Condition**: occurs when two or more threads can access shared data and they try to change it at the same time

   - Because the thread scheduling algorithm can swap between threads at any time, you don't know the order in which the threads will attempt to access the shared data

   - Therefore, the result of the change in data is dependent on the thread scheduling algorithm, i.e. both threads are **"racing" to access/change the data**

   - Pure functions can help in avoiding race condition issues

## Floating Point Numbers

_IEEE 754_: Floating point number specification

- It is a compression algorithm

| Bits      | Precision           |
| --------- | ------------------- |
| _16 bit_  | Half Precision      |
| _32 bit_  | Single Precision    |
| _64 bit_  | Double Precision    |
| _128 bit_ | Quadruple Precision |
| _256 bit_ | Octuple Precision   |

Floating point numbers in 16 Bit System:

The floating point number's binary representation is split into 3-parts:

1. _Sign (1 Bit)_:

   - Number is Positive or Negative

2. _Exponent (5 Bits)_:

   - Represents a range

   | Exponent (n) | Power Range (2^n) | Numerical Range |
   | :----------: | :---------------: | :-------------: |
   |      0       |      [0, 1]       |     [1, 2]      |
   |      1       |      [1, 2]       |     [2, 4]      |
   |      2       |      [2, 3]       |     [4, 8]      |
   |      3       |      [3, 4]       |     [8, 16]     |
   |      4       |      [4, 5]       |    [16, 32]     |

3. _Mantissa (10 Bits)_:

   - `(Number - lower bound) / (upper bound - lower bound)`

Formal that represents a floating point number: **`N = (-1)^sign * 1.mantissa * 2^(exponent - 15)`**

According to IEEE 754 spec:

- `-0` if _`sign=1`_, _`exponent=00000`_, and _`mantissa=0000000000`_

- `INFINITY` if _`exponent=11111`_ and _`mantissa=0000000000`_

  - `-INFINITY` if _`sign=1`_

- `NaN` if _`exponent=11111`_ and _`mantissa=someValue`_

  - There are man `NaN`

- `2^0`: de-normalized number

References:

- [Floating Point Arithmetic](https://en.wikipedia.org/wiki/Floating-point_arithmetic)

- [16 Bit Floats](https://en.wikipedia.org/wiki/Half-precision_floating-point_format)

- [IEEE 754 Spec](https://ieeexplore.ieee.org/document/30711)

- [Fabien Sanglard's awesome blog on the subject](https://fabiensanglard.net/floating_point_visually_explained/)

- [Denormalised Numbers](https://en.wikipedia.org/wiki/Denormal_number)

- [Low Level JavaScript: Github Repo](https://github.com/LowLevelJavaScript/Floating-Point-Implemented-In-JS)
