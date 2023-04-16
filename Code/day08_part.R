############################################
## #30DayChartChallenge contributions - April 2023
# Day 8: Humans
# Data source: Kaggle
################################
# 1.0 Start ------
# Clear all
rm(list=ls()) 
graphics.off() #Closing all previously open graphs

#####################################
## Load library
library(tidyverse)
library(hrbrthemes)

#####
# Load data
tt_data <- read_csv("data/nba_2020_advanced.csv")

tt_data <-tt_data %>% 
  janitor::clean_names()

# Plot

tt_data %>% 
  ggplot( aes(x=age)) +
  geom_histogram( binwidth=3, fill="#69b3a2", color="#e9ecef", alpha=0.9) +
  ggtitle("Bin size = 3") +
  theme_ipsum() +
  labs(title= "Age distribution of NBA players, 2019-20 season") +
  labs(x= "Age",
       y = "Count",
       caption = "#30DayChartChallenge | Day 8 | Humans | Source: Kaggle") +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank(), legend.position = "none") +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 10),
        plot.caption = element_text(size = 8, family = "Tahoma", colour="black"))
  
ggsave(filename = here::here("Figures", "day08_human.png"), height = 5, width = 10, dpi = 300)
