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

# usethis::use_course("http://bit.ly/30lAoSe")


read.csv(paths[[1]])

output <- vector("list", length(paths))
for (i in seq_along(paths)) {
  output[[i]] <- read.csv(paths[[i]])
}

library(tidyverse)
paths <- dir("~/Desktop/mind-the-gap/csv/country", full.names = TRUE)
paths <- paths %>% set_names(str_replace(basename(paths), ".csv", ""))
paths %>%
  map_dfr(~ read.csv(.x), .id = "country") %>%
  as_tibble()

# replicate this code for csv/years/*.csv
paths <- dir("~/Desktop/mind-the-gap/csv/year", full.names = TRUE)
vroom::vroom(paths, id = "path") %>%
  mutate(year = path %>% basename() %>% str_replace(".csv", ""))

# replicate for excel/gapminder-year.xlsx
library(readxl)
path <- "~/Desktop/mind-the-gap/excel/gapminder-year.xlsx"
sheets <- set_names(excel_sheets(path))

read_excel(path, sheet = sheets[[1]])
map_dfr(sheets, ~ read_excel(path, sheet = .x), .id = "year")

# replicate for excel/gapminder-country.xlsx

readxl::read_excel() # instead of read.csv
readxl::excel_sheets() # instead of dir

# if you get finished early read in excel/continents-*.xlsx


# Reports -----------------------------------------------------------------
report_path <- "~/Desktop/mind-the-gap/report-country.Rmd"
output_path <- "~/Desktop/mind-the-gap/reports"
rmarkdown::render(
  report_path,
  output_dir = output_path,
  output_file = "New Zealand.html",
  params = list(country = "New Zealand")
)

countries <- as.character(unique(gapminder$country))
countries

walk(countries, ~ rmarkdown::render(
  report_path,
  output_dir = output_path,
  output_file = str_glue("report-{.x}.html"),
  params = list(country = .x),
  quiet = TRUE
))

# map()
output <- vector("list", length(paths))
for (i in seq_along(paths)) {
  output[[i]] <- read.csv(paths[[i]])
}

# walk()
for (i in seq_along(paths)) {
  read.csv(paths[[i]])
}

# map2()
output <- vector("list", length(x))
for (i in seq_along(paths)) {
  output[[i]] <- f(x[[i]], y[[i]])
}


# Continent nesting -------------------------------------------------------

paths <- dir(
  "~/Desktop/mind-the-gap/excel/",
  pattern = "^continent-",
  full.names = TRUE
)
paths

plan <- tibble(
  path = paths,
  sheet = map(paths, ~ excel_sheets(.x))
)

plan2 <- plan %>%
  unnest(sheet) %>%
  mutate(data = map2(path, sheet, ~ read_excel(.x, sheet = .y)))

plan3 <- plan2 %>%
  mutate(
    path = path %>%
      basename() %>%
      str_replace(".xlsx", "") %>%
      str_replace("continent-", "")
  ) %>%
  rename(
    continent = path,
    country = sheet
  )

plan3 %>% unnest(data)
