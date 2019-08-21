integrate(sin, 0, 2 * pi)
integrate(cos, 0, 2 * pi)

x <- runif(100)
ex <- ecdf(x)
plot(ex)
ex(0.9)

library(purrr)

# have a vector x
# have a function f,
# wnt to call f with every element of x

output <- rep(NA, length(x))
for (i in seq_along(x)) {
  output[[i]] <- f(x[[i]])
}

output <- c()
for (i in 1:length(x)) {
  output <- c(output, f(x[[i]]))
}

# =================
# = Back at 11:30 =
# =================
