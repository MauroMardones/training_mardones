library(readr)
library(tidyverse)
data2 <- read_csv("data/byerlySalmonByRegion.csv")
names(data2)
glimpse(data2)
datopi <- data2 %>%
  pivot_longer(cols = c( "Sockeye" , "Coho" ,       
                        "Pink" ,"Chum"), 
               names_to = "Species", values_to = "catch")
names(datopi)
unique(datopi$Species)

as <- ggplot(datopi,
             aes(y=catch, x=Year, 
             colour=Species)) +
  geom_point()+
  scale_colour_viridis_d(option = "A")+
  stat_smooth(method = "loess")+
  facet_wrap(~Region, scales="free_y")+
  theme_bw()+
  xlab("")+
  ylab("")
as
