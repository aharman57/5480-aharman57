library(stringr)
install.packages("gapminder")
gDat <- gapminder::gapminder
str(gDat)

(strings <- c("a", "ab", "acb", "accb", "acccb", "accccb"))
grep("ac*b", strings, value = TRUE)
grep("ac+b", strings, value = TRUE)
grep("ac?b", strings, value = TRUE)
grep("ac{2}b", strings, value = TRUE)
grep("ac{2,}b", strings, value = TRUE)
grep("ac{2,3}b", strings, value = TRUE)


#1
grep("e{2}", levels(gDat$country), value = T) ## finds countries that have exactly 2 es (next to each other?)

#2
grep(".R$", dir(), value = T)


(strings <- c("^ab", "ab", "abc", "abd", "abe", "ab 12"))
grep("ab.", strings, value = TRUE)
grep("ab[c-e]", strings, value = TRUE)
grep("ab[^c]", strings, value = TRUE)
grep("^ab", strings, value = TRUE)
grep("\\^ab", strings, value = TRUE)
grep("abc|abd", strings, value = TRUE)
gsub("(ab) 12", "\\1 34", strings)


#3
countries <- grep("[i, t]", levels(gDat$country), value = T)
final_countries <- grep("land$", countries, value = T) 

countries
final_countries ## new zealand?? comes thru in first grep statement

gsub("land", "LAND", final_countries)


#4
grep("o", levels(gDat$continent), value = T, ignore.case=T)


