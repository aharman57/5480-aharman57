library(tidyverse)

surveys <- read_csv("data/surveys.csv")

select(surveys, year, month, day)

filter(surveys, species_id == "DS")

mutate(surveys, hindfoot_length_cm = hindfoot_length / 10)

surveys_plus <- mutate(surveys,
                       hindfoot_length_cm = hindfoot_length / 10)

### EXERCISE 1 ###

#1-2
shrub <- read_csv("data/shrub-volume-data.csv")
names(shrub)
str(shrub)

#3
select(shrub, length)

#4
select(shrub, site, experiment)

#5
filter(shrub, height >= 5)

#6
shrub_data_w_vols <- mutate(shrub, volume = length*width*height)

## Basic Aggregation ##
group_by(surveys, species_id)
surveys_by_species <- group_by(surveys, species_id)

summarize(surveys_by_species, abundance = n())

surveys_by_species_plot <- group_by(surveys, species_id, plot_id)
summarize(surveys_by_species_plot, abundance = n())

species_weight <- summarize(surveys_by_species, avg_weight = mean(weight))
na.omit(species_weight)

ds_data <- filter(surveys, species_id == "DS")
ds_data_by_year <- group_by(ds_data, year)
ds_weight_by_year <- summarize(ds_data_by_year,
                               avg_weight = mean(weight, na.rm = TRUE))

### EXERCISE 2 ###

#1
surveys_new_1 <- select(surveys, year, month, day, species_id)

#2
surveys_new_2 <- select(surveys, year, species_id, weight)
surveys_new_2 <- mutate(surveys_new_2, weight = weight/1000)
surveys_new_2 <- na.omit(surveys_new_2)

#3
surveys_new_3 <- filter(surveys, species_id == "SH")

#4
surveys_new_4 <- group_by(surveys, species_id)
summarize(surveys_new_4, abundance = n())

#5
surveys_new_5 <- group_by(surveys, species_id, year)
summarize(surveys_new_5, abundance = n())

#6
surveys_data <- filter(surveys, species_id == "DO")
surveys_new_6 <- group_by(surveys_data, year)
summarize(surveys_new_6, avg_weight = mean(weight, na.rm = TRUE))

### Exercise 3 ###

#1 
surveys_pipe_1 <- surveys %>%
  select(year, species_id, weight) %>%
  mutate(weight = weight/1000) %>%
  na.omit()

#2
surveys_pipe_2 <- surveys %>%
  filter(species_id == "SH") %>%
  select(year, month, day, species_id)

#3
surveys_pipe_3 <- surveys %>%
  group_by(species_id) %>%
  summarize(abundance = n())

#4
surveys_pipe_4 <- surveys %>%
  group_by(species_id, year) %>%
  summarize(abundance = n())

#5
surveys_pipe_5 <- surveys %>%
  filter(species_id == "DO") %>%
  group_by(year) %>%
  summarize(avg_weight = mean(weight, na.rm = T))

view(surveys_pipe_5)

## Extra ##

filter(surveys, species_id == "DS", year > 1995)

filter(surveys, species_id == "DS" | species_id == "DM" | species_id == "DO")

species_weights <- surveys %>%
  group_by(species) %>%
  filter(n() > 100) %>%
  summarize(avg_weight = mean(weight, na.rm = TRUE))
