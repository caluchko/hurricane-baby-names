library(dplyr)
library(babynames)

hurricanes <- read.csv("hurricanes.csv", header = TRUE)
hurricanes$X <- NULL
hurricanes$X.1 <- NULL
hurricanes$X.2 <- NULL
hurricanes$X.3 <- NULL
hurricanes$X.4 <- NULL

for (i in 1:93){
  if (hurricanes$Gender_MF[i] == 1){
    hurricanes$Gender_MF[i] <- "F"
  } else hurricanes$Gender_MF[i] <- "M"
}
fun <- function (Name, Sex, Year){
  data <- babynames %.%
    filter (name == Name, sex == Sex, year %in% c(Year, Year-1, Year+1))
  before <- (data$n[data$year == Year]-data$n[data$year == Year-1])/
                  data$n[data$year == Year-1]*100
  after <- (data$n[data$year == Year+1]-data$n[data$year == Year])/
    data$n[data$year == Year]*100
  diff <- after-before

  #return(data)
  return(list(before,after,diff))
}
# for each hurricane name calculate percent change in year before 
# and in year after.
# test with 100 random baby names

m <- mapply(fun, hurricanes$Name, hurricanes$Gender_MF, hurricanes$Year)
m <- as.numeric(m)
before <- m[seq(1, length(m), 3)]
after <- m[seq(2, length(m), 3)]
diff <- m[seq(3, length(m), 3)]
hurricanes <- cbind(hurricanes, before, after, diff)