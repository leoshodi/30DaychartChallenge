############################################
## #30DayChartChallenge contributions - April 2023
# Day 13: Pop Culture
# Data source: Maven Analytics and IMDB
################################
# 1.0 Start ------
# Clear all
rm(list=ls()) 
graphics.off() #Closing all previously open graphs

#####################################
## Load library
library(tidyverse)
library(scales)

# Load data
tt_data <-  read_csv("data/3_Movies.csv") %>% 
  janitor::clean_names()

# Transform data
tt_data <- tt_data %>% 
  mutate(revenue = box_office/1000000)

# plot data
tt_data %>% 
  ggplot(aes(x=rating, y= revenue)) +
  geom_point(size = 2) +
  scale_y_continuous(limits = c(800, 1400)) +
  scale_x_continuous(limits = c(7.4, 8.2)) +
  labs(title= "Harry Potter Movie",
       subtitle= "Correlation between Box Office Revenue and IMDb rating") +
  labs(y= "Box Office Revenue (Million USD)",
       x = "IMDb Rating",
       caption = "#30DayChartChallenge | Day 13 | Pop Culture | Source: Maven Analytics and IMDb") +
  theme(panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
            panel.border = element_blank(), 
        panel.background = element_blank()) +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
            text=element_text(family="Tahoma"),
            axis.text.x=element_text(colour="black", size = 10),
            axis.text.y=element_text(colour="black", size = 10)) +
  theme(panel.border = element_rect(linetype = "solid", fill = NA, linewidth = 1))

ggsave(filename = here::here("Figures", "day13_Pop.png"), height = 5, width = 10, dpi = 300)
