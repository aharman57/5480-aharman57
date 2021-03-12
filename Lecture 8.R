w <- 10.2
x <- 1.3
y <- 2.8
z <- 17.5
colors <- c("red", "blue", "green")
masses <- c(45.2, 36.1, 27.8, 81.6, 42.4)
dna1 <- "attattaggaccaca"
dna2 <- "attattaggaacaca"

## Exercise 1
#1
w > 10
#2
"green" %in% colors
#3
x > y
#4
masses > 40

## Exercise 2

age_class = "sapling"
if (age_class == "sapling"){
  y <- 10
}
y

## Exercise 3
#1
age_class <- "seedling"
if (age_class == "sapling"){
  y <- 10
} else if (age_class == "seedling"){
  y <- 5
}
y
#2
age_class <- "adult"
if (age_class == "sapling"){
  y <- 10
} else if (age_class == "seedling"){
  y <- 5
} else if (age_class != "seedling"){
  y <- 0
} else if (age_class != "sapling"){
  y <- 0
}
y ## tried to use a list for both seedling and sapling, couldnt get it to work


## Exercise 4

get_mass_from_length_by_name <- function(length, name){
  if (name == "Stegosauria"){
    mass = 10.95 * length^2.46
  } else if (name == "Theropoda"){
    mass = 0.73 * length^3.63
  } else if (name == "Sauropoda"){
    mass = 214.44 * length^1.46
  } else {
    mass = NA * length^NA
  }
  return(mass)
}

get_mass_from_length_by_name(10, "Stegosauria")
get_mass_from_length_by_name(8, "Theropoda")
get_mass_from_length_by_name(12, "Sauropoda")
get_mass_from_length_by_name(13, "Ankylosauria")


## Exercise 5

library(dplyr)

#1
for (i in 2:16){
  print(i)
}

#2
for (i in 1:5){
  print(3*i)
}

#3
birds = c('robin', 'woodpecker', 'blue jay', 'sparrow')
for (i in 1:length(birds)){
  print(birds[i])
}

#4
radius <- c(1.3, 2.1, 3.5)
areas <- vector(mode = "numeric", length = 3)
for (i in 1:length(radius)){
  areas[i] <- pi * radius[i] ^ 2
}
areas

#5
lengths = c(1.1, 2.2, 1.6)
widths = c(3.5, 2.4, 2.8)
areas <- vector(length = 3)
for (i in 1:length(lengths)) {
  areas[i] <- lengths[i] * widths[i]
}
areas
