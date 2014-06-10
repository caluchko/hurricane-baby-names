#uses babynames package installed from github
#need to add error message for unknown name
#users must specify "M" or "F" for the Sex argument

library(babynames)
library(dplyr)
library(ggplot2)

# name_ts returns a plot (p1) of number of babies of a particular name and sex over time
name_ts <- function (Name, Sex = c("M", "F")){
  myname <- filter(babynames, name == Name, sex == Sex)
  p1 <- ggplot(data = myname, aes(x = year, y = n))+
    theme_bw()+
    geom_area(fill = "blue", alpha = .2)+
    geom_line()+
    annotate("text", x = -Inf, y = Inf, label = Name, hjust = -.2, vjust = 2)+
    #annotate a particular year with vertical line and text label, e.g. 2005 for Hurricane Katrina
    #geom_vline(xintercept = 2005, linetype = "dashed")+
    #annotate("text", x=2009, y=2500, label = "2005")
  return(p1)  
} 

# name_rank returns a printed message stating the rank of a name in a specified year
name_rank <- function (Name, Sex = c("M", "F"), YOB){
  myname <- babynames %.%
    filter(sex == Sex, year == YOB) %.%
    arrange(desc(n))
  myname$rank <- rank(-myname$n, ties.method = "min")
  #str(myname)
  r <- myname$rank[myname$name == Name]
  lastdig <- substring(as.character(r), nchar(as.character(r)))
  if (lastdig == "1") suf <- "st"
  else if (lastdig == "2") suf <- "nd"
  else if (lastdig == "3") suf <- "rd"
  else suf <- "th"
  mf <- if (Sex == "M") "male" else "female"
  message <- paste(Name," was the ",r,suf," most common ",
                   mf, " name in ", YOB, sep = "" )
  print (message)  
}
  
