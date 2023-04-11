############################################
## #30DayChartChallenge contributions - April 2023
# Day 6: OWID
# Data source: 
################################
# 1.0 Start ------
# Clear all
rm(list=ls()) 
graphics.off() #Closing all previously open graphs

#####################################
## Load library
library(tidyverse)
library(ggthemes)

####
# Import data
tt_data <- read_csv("data/labor-force-agriculture.csv")

# Wrangle data
tt_data_brics <- tt_data %>% 
  janitor::clean_names() %>% 
  rename(country = entity) %>% 
  filter(country %in% c("Brazil", "Russia", "India", "China", "South Africa")) %>% 
  mutate(percentage = share_employed_agri/100) %>% 
  select(year, country, percentage)


# Plot
tt_data_brics %>% 
  ggplot(aes(year, percentage, color = country)) +
  geom_line() +
  expand_limits(y = 0) +
  scale_y_continuous(labels = scales::label_percent()) +
  labs(x= "Year",
      y = "Percentage",
      title = "Comparing the agricultural sector in BRICS countries",
      subtitle = "Share of the labor force working in agriculture",
      caption = "#30DayChartChallenge | Day 6 | Comparisons: OWID") +
  scale_colour_wsj("colors6", "") +
  theme_wsj(color = "gray")

ggsave(filename = here::here("Figures", "day06_OWID.png"), height = 5, width = 15, dpi = 300)
  
  
  

