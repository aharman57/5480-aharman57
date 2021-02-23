library(tidyverse)

surveys <- read_csv("data/surveys.csv")

select(surveys, year, month, day)

filter(surveys, species_id == "DS")

mutate(surveys, hindfoot_length_cm = hindfoot_length / 10)

surveys_plus <- mutate(surveys,
                       hindfoot_length_cm = hindfoot_length / 10)
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
