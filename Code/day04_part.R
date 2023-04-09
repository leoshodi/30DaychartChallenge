############################################
## #30DayChartChallenge contributions - April 2023
# Day 4: Historical
# Data source: 
################################
# 1.0 Start ------
# Clear all
rm(list=ls()) 
graphics.off() #Closing all previously open graphs

#####################################
## Load library
library(tidyverse)

####
# Import data
tt_data <- read_csv("data/dependency-age-groups-to-2100.csv")

# Wrangle data

tt_Nig_UK <- tt_data %>% 
  janitor::clean_names() %>% 
  rename(country = entity) %>% 
  filter(country %in% c("Nigeria", "United Kingdom" )) %>% 
  drop_na() 

tt_Nig_UK1 <-  tt_Nig_UK %>% 
  group_by(country, year) %>% 
  mutate(total = sum(x65+x15_64+x0_14)) %>% 
  mutate(prop = x0_14/total) %>% 
  ungroup()

tt_Nig_UK1 %>% 
  ggplot(aes(year, prop, color = country)) +
  geom_line() +
  expand_limits(y = 0) +
  scale_y_continuous(labels = scales::label_percent()) +
 labs(x= "Year",
       y = "Percentage",
       title = "Comparing Nigeria and United Kingdom",
      subtitle = "Ratio of Children (0-14 years) to the whole population",
       caption = "#30DayChartChallenge | Day 4 | Comparisons: Historical\n Data: https://ourworldindata.org/") +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(legend.position="bottom", legend.direction="horizontal",
        legend.title = element_blank())+
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 10),
        plot.caption = element_text(size = 8, family = "Tahoma", colour="black"))

ggsave(filename = here::here("Figures", "day04_historical.png"), height = 5, width = 10, dpi = 300)
  