#reading in .csv data
fish_data <- read.csv(file="data/Gaeta_etal_CLC_data_1.csv", header = T)

library(dplyr)

fish_data_cat = fish_data %>% 
  mutate(length_cat = ifelse(length > 300, "big", "small"))