# 01_data_pull.R
# 2 - 23 - 21

library(tidyverse)
library(jsonlite)
library(here)

# load in data
raw_data <- read_json("https://raw.githubusercontent.com/nyphilarchive/PerformanceHistory/master/Programs/json/complete.json")


# save raw data
write_json(raw_data,here("data/raw_data/raw_json.json"))
