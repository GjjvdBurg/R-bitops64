
source('./bitops64.R')

test_toBitArr_1 <- function() {
	input <- as.integer64(9361395370876062)
	output <- c(0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 
		    0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 
		    0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0)
	stopifnot(toBitArr(input) == output)
	cat("PASS: test_toBitArr_1\n")
}

test_toBitArr_2 <- function() {
	input <- as.integer64(4538556652508075)
	output <- c(0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 
		    0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 
		    1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1)
	stopifnot(toBitArr(input) == output)
	cat("PASS: test_toBitArr_2\n")
}

test_fromBitArr_1 <- function() {
	input <- c(0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0)
	output <- as.integer64(474434)
	result <- fromBitArr(input)
	stopifnot((result == output) && (result+1 != output))
	cat("PASS: test_fromBitArr_1\n")
}

test_fromBitArr_2 <- function() {
	input <- c(0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 0, 
		   1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0)
	output <- as.integer64(105873159260)
	result <- fromBitArr(input)
	stopifnot((result == output) && (result+1 != output))
	cat("PASS: test_fromBitArr_2\n")
}

test_bAnd_1 <- function() {
	a <- 2704856913185604
	b <- 4537109783011532
	output <- 30820960567364
	result <- bAnd(a, b)
	stopifnot((result == output) && (result+1 != output))
	cat("PASS: test_bAnd_1\n")
}

test_bAnd_2 <- function() {
	a <- 1469447003154359
	b <- 2997504687172841
	output <- 35408817890465
	result <- bAnd(a, b)
	stopifnot((result == output) && (result+1 != output))
	cat("PASS: test_bAnd_2\n")
}

test_bOr_1 <- function() {
	a <- 355677767853852
	b <- 1824826354040321
	output <- 2106664272264989
	result <- bOr(a, b)
	stopifnot((result == output) && (result+1 != output))
	cat("PASS: test_bOr_1\n")
}

test_bOr_2 <- function() {
	a <- 4762836574450250
	b <- 6572554112635500
	output <- 6750959772807790
	result <- bOr(a, b)
	stopifnot((result == output) && (result+1 != output))
	cat("PASS: test_bOr_2\n")
}

test_bXor_1 <- function() {
	a <- 8714788230702639
	b <- 5928499809946920
	output <- 3371092684155655
	result <- bXor(a, b)
	stopifnot((result == output) && (result+1 != output))
	cat("PASS: test_bXor_1\n")
}

test_bXor_2 <- function() {
	a <- 6698827206363768
	b <- 3943054939514601
	output <- 7264182423776401
	result <- bXor(a, b)
	stopifnot((result == output) && (result+1 != output))
	cat("PASS: test_bXor_2\n")
}

test_bShiftL_1 <- function() {
	a <- 231879765
	b <- 9
	output <- 118722439680
	result <- bShiftL(a, b)
	stopifnot((result == output) && (result+1 != output))
	cat("PASS: test_bShiftL_1\n")
}

test_bShiftL_2 <- function() {
	a <- 6782342
	b <- 23
	output <- 56894408359936
	result <- bShiftL(a, b)
	stopifnot((result == output) && (result+1 != output))
	cat("PASS: test_bShiftL_2\n")
}

test_bShiftR_1 <- function() {
	a <- 1457795853734554
	b <- 5
	output <- 45556120429204
	result <- bShiftR(a, b)
	stopifnot((result == output) && (result+1 != output))
	cat("PASS: test_bShiftR_1\n")
}

test_bShiftR_2 <- function() {
	a <- 1667886387509390
	b <- 17
	output <- 12724963283
	result <- bShiftR(a, b)
	stopifnot((result == output) && (result+1 != output))
	cat("PASS: test_bShiftR_2\n")
}

run_tests <- function() {
	test_toBitArr_1()
	test_toBitArr_2()
	test_fromBitArr_1()
	test_fromBitArr_2()
	test_bAnd_1()
	test_bAnd_2()
	test_bOr_1()
	test_bOr_2()
	test_bXor_1()
	test_bXor_2()
	test_bShiftL_1()
	test_bShiftL_2()
	test_bShiftR_1()
	test_bShiftR_2()
	cat("All tests passed.")
}

run_tests()
