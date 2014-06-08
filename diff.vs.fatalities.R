# plot hurricane name diff vs fatalities

library(ggplot2)
hurricanes2 <- filter(hurricanes, Name != "Katrina")

p1 <- ggplot(hurricanes2, aes(x = alldeaths, y = diff))+
  geom_point(colour = "blue", alpha = .5, size = 3)+
  geom_rug(size = .3)+
  stat_smooth(method = lm, colour = "steelblue")+
  xlab("Hurricane fatalities")+
  ylab("Percent change in baby name usage after hurricane")+
  ggtitle("Do changes in baby name popularity correlate with hurricane fatalities?")+
  annotate("text", x = 256, y = -45, label = "Camille", size = 4)+
  annotate("text", x = 200, y = -15, label = "Dianne", size = 4)+
  annotate("text", x = 159, y = -36, label = "Sandy", size = 4)+
  annotate("text", x = 1833, y = -55, label = "Katrina", size = 4)+
  geom_hline(yintercept = 0, color = "darkgray")+
  theme_bw()

  p2 <- p1 + facet_wrap(~ Gender_MF)