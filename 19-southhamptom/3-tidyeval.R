library(tidyverse)


# Exploration -------------------------------------------------------------

ggplot(diamonds, aes(carat, price)) +
  geom_hex()

diamonds %>%
  group_by(cut) %>%
  summarise(n = n(), carat = mean(carat))

carat
price
mean(carat)

diamonds %>%
  group_by(cut) %>%
  summarise(n = n(), carat = mean(carat), price = mean(price))
diamonds %>%
  group_by(color) %>%
  summarise(n = n(), carat = mean(carat), price = mean(price))
diamonds %>%
  group_by(clarity) %>%
  summarise(n = n(), carat = mean(carat), price = mean(price))

diamonds_summary <- function(group_var) {
  diamonds %>%
    group_by({{ group_var }}) %>%
    summarise(n = n(), carat = median(carat), price = median(price))
}

diamonds_summary("cut")

name <- "Hadley"
glue::glue("Hello {name}")

diamonds_summary(cut)
diamonds_summary(clarity)
diamonds_summary(color)

diamonds_summary <- function(...) {
  diamonds %>%
    group_by(...) %>%
    summarise(n = n(), carat = median(carat), price = median(price))
}
diamonds_summary(cut)
diamonds_summary(cut, clarity)

diamonds_summary <- function(df, group_var) {
  group_var <- enquo(group_var)
  df %>%
    group_by(!!group_var) %>%
    summarise(n = n(), carat = median(carat), price = median(price))
}

# Practice ----------------------------------------------------------------


