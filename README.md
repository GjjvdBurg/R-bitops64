bitops64
========

Simple implementation of bitwise operators for integer64 types in R.

Limitations
-----------
- `bitops64` uses the `R` package `bit64` to work with the `integer64` type.  
  Conversion to and from this type is limited, so in reality only integers up 
to `2^53` are supported.

- Negative integers are not supported.


Usage
-----

Examples of usage (see also `tests.R`):

    source('bitops64.R')
    
    a <- 2704856913185604
    b <- 4537109783011532
    result <- bAnd(a, b)

The following functions are included:

1. `bAnd` bitwise `and`
2. `bXor` bitwise `xor`
3. `bOr` bitwise `or`
4. `bShiftL` bitwise left shift
5. `bShiftR` bitwise right shift

