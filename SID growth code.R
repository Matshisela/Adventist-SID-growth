###########################################################################
#             SID growth 2003- 2016 
#         Analysis using animated graphs
##########################################################################

# Load packages ----
library(tidyverse)
library(gganimate)
library(gapminder)
library(plotly)
library(tibble)
library(lubridate)
library(maps)
library(ggthemes)
library(babynames)
library(hrbrthemes)
library(viridis)
library(gridExtra)
library(cowplot)
library(xlsx)

#Load data ----
sid <- read.xlsx(file.choose(), 1)  # read first sheet

#Baptism statistic
sid_1 <- sid %>%
  group_by(Region, Year) %>%
  summarise(baptism = sum(Bapt))

#Churches Statistic ----
sid_2 <- sid %>%
  group_by(Region, Year) %>%
  summarise(churches = sum(Church))

glimpse(sid_1)


# Gaphs ----


ggplot(sid_1, aes(x=Year, y= baptism)) +
  geom_line(aes(linetype=Region, color = Region)) +
  geom_point(aes(linetype=Region, color = Region)) +
  ggtitle("Yearly baptisms in the SID") +
  theme_ipsum() +
  xlab('Year') +
  ylab("Number of baptisms") +
  transition_reveal(Year)

# Save at gif:
anim_save("Yearly baptisms in the Adventist SID.gif")

#Number of churches
ggplot(sid_2, aes(x=Year, y= churches)) +
  geom_line(aes(linetype=Region, color = Region)) +
  geom_point(aes(linetype=Region, color = Region)) +
  ggtitle("Number of Churches in the SID by year") +
  theme_ipsum() +
  xlab('Year') +
  ylab("Number of churches") +
  transition_reveal(Year)

# Save at gif:
anim_save("Churches in the Adventist SID.gif")
