# calculates the percent change in baby name usage in the year before and after a hurricane of the same name. 
# also calculates the difference between the before and after change to estimate the hurricane effect.
library(dplyr)
library(babynames)
# remove extraneous columns from hurricanes.csv
hurricanes <- read.csv("hurricanes.csv", header = TRUE)
hurricanes$X <- NULL
hurricanes$X.1 <- NULL
hurricanes$X.2 <- NULL
hurricanes$X.3 <- NULL
hurricanes$X.4 <- NULL
# replace the binary gender coding with "M" or "F:
for (i in 1:93){
  if (hurricanes$Gender_MF[i] == 1){
    hurricanes$Gender_MF[i] <- "F"
  } else hurricanes$Gender_MF[i] <- "M"
}
# function to calculate the before and after percent change, and the difference, for a specifed name, sex, and year
fun <- function (Name, Sex, Year){
  data <- babynames %.%
    filter (name == Name, sex == Sex, year %in% c(Year, Year-1, Year+1))
  before <- (data$n[data$year == Year]-data$n[data$year == Year-1])/
                  data$n[data$year == Year-1]*100
  after <- (data$n[data$year == Year+1]-data$n[data$year == Year])/
    data$n[data$year == Year]*100
  dif <- after-before
  return(list(before,after,dif))
}
# apply the function above to each hurricane in the data set.
# ammend the hurricanes data fram with the before and after percent change, and the difference.
m <- mapply(fun, hurricanes$Name, hurricanes$Gender_MF, hurricanes$Year)
m <- as.numeric(m)
before <- m[seq(1, length(m), 3)]
after <- m[seq(2, length(m), 3)]
dif <- m[seq(3, length(m), 3)]
hurricanes <- cbind(hurricanes, before, after, dif)
