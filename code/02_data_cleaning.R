# 02_data_cleaning.R
# 2 - 23 - 21

# libraries
library(tidyverse)
library(jsonlite)
library(here)

# read in data
raw_data <- read_json(here("data/raw_data/raw_json.json"))

rare_data <- raw_data[[1]] %>%
  enframe() %>%
  unnest_wider(value)

medium_data <- rare_data %>%
  unnest_longer(id) %>%
  unnest_longer(programID) %>%
  unnest_longer(orchestra) %>%
  unnest_longer(season) %>%
  unnest_longer(concerts) %>%
  hoist(.col = concerts,
        event_type = "eventType",
        location = "Location",
        venue = "Venue",
        date = "Date",
        time = "Time"
        ) %>%
  unnest_longer(event_type) %>%
  unnest_longer(location) %>%
  unnest_longer(venue) %>%
  unnest_longer(date) %>%
  unnest_longer(time)

glimpse(medium_data)
