# plot hurricane name diff vs fatalities

hurricanes2 <- filter(hurricanes, Name != "Katrina")

p1 <- ggplot(hurricanes2, aes(x = alldeaths, y = diff))+
  geom_point(colour = "blue", alpha = .5, size = 3)+
  stat_smooth(method = lm, colour = "navyblue")
  #change axis titles
  #add title?
  