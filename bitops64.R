# Simple implementation of bitwise operations on integer64 types.
#
# This implementation allows use of integers up to 2**53 due to limitations of
# R
#
# Note: this implementation is not tested and probably doesn't work with
# negative integers.
#
# This is not an implementation which is meant to be fast: it converts
# integers to arrays of 1's and 0's before performing the bitwise operations.
# However, it does work.

library(bit64)

toBitArr <- function(x) {
  if (x != 0) {
    return(c(toBitArr(x %/% 2), c(x %% 2)))
  } else {
    return(x)
  }
}

fromBitArr <- function(x) {
  x <- as.integer(x)
  y <- rev(x)
  num <- as.integer64(0)
  i <- 0
  for (c in y) {
    num <- num + c * (2^i)
    i <- i + 1
  }
  return(num)
}

bOp <- function(x, y, op = NULL) {
  if (x > 2**53) {
    warning("x is larger than 2^53, results are unreliable.")
  }
  if (y > 2**53) {
    warning("y is larger than 2^53, results are unreliable.")
  }
  x <- as.integer64(x)
  y <- as.integer64(y)
  a <- toBitArr(x)
  b <- toBitArr(y)

  if (length(a) < length(b)) {
    t <- b
    b <- a
    a <- t
  }
  n <- length(a)
  m <- length(b)
  if (n != m) {
    b <- c(c(1:(n - m)) * as.integer64(0), b)
  }
  d <- c(1:n) * 0
  for (i in 1:n) {
    if (op == "and") {
      d[n - i + 1] <- a[n - i + 1] & b[n - i + 1]
    } else if (op == "xor") {
      d[n - i + 1] <- xor(a[n - i + 1], b[n - i + 1])
    } else if (op == "or") {
      d[n - i + 1] <- a[n - i + 1] | b[n - i + 1]
    }
  }
  return(fromBitArr(d))
}

bAnd <- function(x, y) {
  return(bOp(x, y, op = "and"))
}

bXor <- function(x, y) {
  return(bOp(x, y, op = "xor"))
}

bOr <- function(x, y) {
  return(bOp(x, y, op = "or"))
}

bShiftL <- function(x, num) {
  if (num == 0) {
    return(x)
  }
  x <- as.integer64(x)
  a <- toBitArr(x)
  b <- c(a, c(1:num) * 0)
  return(fromBitArr(b))
}

bShiftR <- function(x, num) {
  if (num == 0) {
    return(x)
  }
  x <- as.integer64(x)
  a <- toBitArr(x)
  n <- length(a)
  if (num >= n) {
    b <- c(0)
  } else {
    b <- a[1:(n - num)]
  }
  return(fromBitArr(b))
}
