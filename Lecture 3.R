library(tidyverse)
fship <- read_csv(file.path("data/The_Fellowship_Of_The_Ring.csv"))
ttow <- read_csv(file.path("data", "The_Two_Towers.csv"))
rking <- read_csv(file.path("data", "The_Return_Of_The_King.csv")) 

rking

## combine 3 similar dataframes
lotr_untidy <- bind_rows(fship, ttow, rking)
str(lotr_untidy)

write.csv(lotr_untidy, file = file.path("data","lotr_untidy.csv"))

## changes column to better represent data? <- because they are actually how many words have been said, not how many people there are
lotr_tidy <- pivot_longer(lotr_untidy, cols=c(Female, Male), names_to = 'Gender', values_to = 'Words')
lotr_tidy <- arrange(lotr_tidy, Gender)

write_csv(lotr_tidy, file = file.path("data", "lotr_tidy.csv"))


male <- read_csv(file.path("data/Male.csv"))
female <- read_csv(file.path("data/Female.csv"))

gender_blah <- bind_rows(male,female)

## only displays film and race columns, summarizes word count
(by_race_film <- lotr_tidy %>% 
    group_by(Film, Race) %>% 
    summarize(Words = sum(Words)))

## it worked, yay
(my_attempt <- by_race_film %>%
    group_by(Race) %>%
    summarize(Words = sum(Words)))


## make it messy? for some reason

lotr_tidy %>%
  spread(key = Race, value = Words)

lotr_tidy %>% 
  unite(Race_Gender, Race, Gender) %>% 
  spread(key = Race_Gender, value = Words)
