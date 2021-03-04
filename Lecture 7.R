g_to_lb <- function(pounds){
  grams <- pounds*453.592
  return(grams)
}

g_to_lb(3.75)

## Exercise 2 - mass from estimated skeleton length
get_mass_from_length_theropoda <- function(length){
  mass <- 0.73 * length ^ 3.63
  return(mass)
}

get_mass_from_length_theropoda(16)


get_mass_from_length_theropoda2 <- function(length, a, b){
  mass <- a * length ^ b
  return(mass)
}

get_mass_from_length_theropoda2(26, 214.44, 1.46)

## default arguments
calc_shrub_vol <- function(length = 1, width = 1, height = 1) {
  volume <- length * width * height
  return(volume)
}

calc_shrub_vol()
calc_shrub_vol(width = 2)
calc_shrub_vol(0.8, 1.6, 2.0)
calc_shrub_vol(height = 2.0, length = 0.8, width = 1.6)


## Exercise 3
get_mass_from_length_theropoda3 <- function(length, a=39.9, b=1.46){
  mass <- a * length ^ b
  return(mass)
}

get_mass_from_length_theropoda3(22, 214.44, 1.46)

get_mass_from_length_theropoda3(16)

## Exercise 4
kg_to_lb <- function(kg){
  lb <- kg*2.205
  return(lb)
}

library(dplyr)

get_mass_from_length_theropoda2(12, 10.95, 2.64) %>% 
  kg_to_lb()
