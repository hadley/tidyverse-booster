# Welcome to "boost your tidyverse skills"!
# https://github.com/hadley/tidyverse-booster

# Setup -------------------------------------------------------------------

install.packages("tidyverse")
install.packages("gapminder")
install.packages("usethis")
usethis::use_course("http://bit.ly/30lAoSe")

# Put a green post-it on your computer when your done
# Put a pink post-it on your computer if you have a problem







# Introductions -----------------------------------------------------------
# Introduce yourself with your name and your favourite tidyverse function









# Warmups -----------------------------------------------------------------

# What does this code do?
library(tidyverse)

x <- 1:40
case_when(
  x %% 15 == 0 ~ "fizz buzz",
  x %%  5 == 0 ~ "buzz",
  x %%  3 == 0 ~ "fizz",
  TRUE         ~ as.character(x)
)

ifelse(
  x %% 15 == 0,
  "fizz buzz",
  ifelse(
    x %% 5 == 0,
    "buzz",
    ifelse(
      x %% 3 == 0,
      "fizz",
      as.character(x)
    )
  )
)


# What does the glue package do?
# How can you use it via stringr?

name <- "Hadley"
glue::glue("Hello {name}")
str_glue("Hello {name}")


# What does this code do?
x <- c(1, NA, 3, NA, NA)
y <- c(3, 2,  9, 4, NA)
z <- c(5, 4, NA, 10, 5)

coalesce(x, y, z)

