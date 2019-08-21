# If this code works:
# * What can you say about x?
# * What can you say about y?
y <- sum(x)

# x is numeric (integer or double), logical
# x is any length (0 or greater)
#
# y is length 1 numeric vector

y <- sum(x, na.rm = TRUE)

# y is not NA
sum(NA, na.rm = TRUE)
sum(numeric())
sum(c(x, y)) == sum(x) + sum(y)
sum(c(numeric(), 10)) = sum(numeric()) + sum(10)

# What are the eight important types of vector in R?
# 1. logical
# 2. numeric (integer & double)
# 3. character
# 4. factor (ordered factor)
# 5. dates (2019-08-01) (Date)
# 6. date-times (2019-08-01 09:30) (POSIXct)
# 7. durations (3 hrs) (difftime)
# 8. list

df <- data.frame(x = "a")
df$x

# data.frame
# - a collection of vectors
# - same length
# - must have names

# * y <- mean(x)
# basically the same as sum
# (except you can compute the mean of date)
mean(factor(c("a", "b")))
mean(Sys.Date() + 0:4)
sum(Sys.Date() + 0:4)

mean(numeric())
sum(numeric()) / length(numeric())
0 / 0

# * y <- diff(x)
# x is logical, numeric, date/time
# length(y) equals length(x) - 1 (unless length(x) is 0, then length(y) is also 0)
# if x is logical or numeric, then y is numeric
# if x is date/time, then y is a difftime

diff(numeric())

# * y <- dplyr::lag(x)
# x - lag(x) is almost the same as diff(x)
# length(y) equals length(x)
# y is same length and same type as x
# cumany(x != lag(x))

# * y <- dplyr::first(x)
# x can be any vector
# y is the same type as x, and has length 1

# * y <- paste(x) with the collapse argument
paste(x, collapse = ",")
paste(letters, collapse = ",")
paste(1:10, collapse = ",")

# x can be any vector
# y is a length-1 character vector

# NULL
# complex
# raw

complicated_type <- function(x, y) {
  if (x < 0) {
    "negative"
  } else {
    if (is.na(y)) {
      NA
    } else {
      1
    }
  }
}

col_means <- function(df) {
  num <- sapply(df, is.numeric)
  sapply(df[num, ], mean)
}
col_means("x")

## Multiple vectors

# a + b
# pmin(a, b)
# paste(a, b) # without collapse
