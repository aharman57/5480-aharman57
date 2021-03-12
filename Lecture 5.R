library(nycflights13)
library(tidyverse)
library(maps)

airlines
airports
planes
weather

flights

#1
new_flights <- flights %>%
  group_by(dest) %>%
  mutate(total_delay = arr_delay + dep_delay) %>%
  summarize(avg_delay=mean(total_delay, na.rm = T)) %>%
  left_join(airports, c("dest" = "faa"))

## was having troubles making this into a single pipeline, something to do with the summarize command   
ggplot(new_flights, aes(lon, lat)) +
  borders("state") +
  geom_point(aes(color = avg_delay)) +
  coord_quickmap()

#2
new_flights2 <- flights %>%
  select(origin, dest, tailnum) %>%
  left_join(airports, c("dest" = "faa"))

new_flights3 <- flights %>%
  left_join(airports, c("origin" = "faa")) %>%
  select(lat, lon, tailnum)

hello <- new_flights2 %>%
  left_join(new_flights3, by = "tailnum")

## not sure why this isn't working... it works if I just do a regular left_join but then it only has one set of the lat/lons
## can't figure out how to do 2 variables at the same time

#3
age_plane <- flights %>%
  left_join(planes, by = "tailnum") %>%
  mutate(plane_age = year.x - year.y) %>%
  mutate(total_delay = arr_delay + dep_delay)

plot(age_plane$plane_age, age_plane$total_delay)

ggplot(age_plane, aes(x=plane_age,y=total_delay)) +
  geom_smooth()

## weak relationship when plane is old (>20y), but seems like 10yo planes have highest delay


