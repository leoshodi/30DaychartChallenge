############################################
## #30DayChartChallenge contributions - April 2023
# Day 11: Circular
# Data source: ggparliament package
################################
# 1.0 Start ------
# Clear all
rm(list=ls()) 
graphics.off() #Closing all previously open graphs


#####
# Load library
library(ggparliament)
library(tidyverse)

#####
# Wrangle data

UK <- election_data %>% 
  filter(year == 2017 & # filterings for country, year and chamber
          country == "UK" &
           house == "Commons")

# data frame to be used for plotting
UK_semicircle <-  parliament_data(election_data = UK,
                                  type = "semicircle",
                                  parl_rows = 12,
                                  party_seats = UK$seats)

# Plot data
ggplot(UK_semicircle, aes(x=x, y=y, colour = party_short)) +
  geom_parliament_seats() +
  theme_ggparliament() +
  labs(title = "The House of Commons - UK Parliament, 2017",
       subtitle = "Number of Seats held by each party") +
  scale_colour_manual(values = UK_semicircle$colour, 
                      limits = UK_semicircle$party_short) +
  labs(caption = "#30DayChartChallenge | Day 11 | Circular | Source: ggparliament package") +
  theme(legend.title = element_blank(), axis.line = element_blank(),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_blank(),
        axis.text.y=element_blank())

ggsave(filename = here::here("Figures", "day011_Circular.png"), height = 5, width = 10, dpi = 300)
  