############################################
## #30DayChartChallenge contributions - April 2023
# Day 9: High/Low
# Data source: IMF
################################
# 1.0 Start ------
# Clear all
rm(list=ls()) 
graphics.off() #Closing all previously open graphs

#####################################
## Load library
library(tidyverse)
library(ggthemes)

#####
# Load data
tt_data <- read_csv("data/commodity.csv")

# Wrangle data
tt_data <- tt_data %>% 
  janitor::clean_names()

# Plot

tt_data %>% 
  ggplot(aes(x= price, y = commodity)) +
  geom_line() +
  geom_point(aes(color = classification), size = 3) +
  theme_bw() +
  labs(title= "Monthly Average Price of Selected Commodities, 2022") +
  labs(x= "Price (USD/ton)",
       y = "Commodity",
       caption = "#30DayChartChallenge | Day 9 | High/Low | Source: IMF") +
  theme_economist() +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank(), legend.position = "none") +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 10),
        plot.caption = element_text(size = 8, family = "Tahoma", colour="black")) 

ggsave(filename = here::here("Figures", "day09_high.png"), height = 5, width = 10, dpi = 300)
