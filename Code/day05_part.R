############################################
## #30DayChartChallenge contributions - April 2023
# Day 5: Slope
# Data source: 
################################
# 1.0 Start ------
# Clear all
rm(list=ls()) 
graphics.off() #Closing all previously open graphs

#####################################
## Load library

library(CGPfunctions)
library(gapminder)
library(tidyverse)


# Wrangle data
set_data <- gapminder %>% 
  filter(country %in% c("Ghana", "Nigeria", "Liberia", "Gambia", "Sierra Leone")) %>% 
  filter(year == 1972 | year  == 2007) %>% 
  select(year, country, gdpPercap) 
  
set_data$year <- as_factor(set_data$year)

# Plot

c_color <-  set_data %>% 
  pivot_wider(id_cols = country,
              names_from = year,
              values_from = gdpPercap) %>% 
  janitor::clean_names() %>% 
  mutate(difference = x2007 - x1972) %>% 
  mutate(trend = case_when(
      difference >= 2 ~ "green",
      difference <= -1 ~ "red"
      )) %>% 
      select(country, trend) %>%
      tibble::deframe()

newggslopegraph(set_data, year, gdpPercap, country,
                Title = "GDP per capita for English speaking West-African countries",
                SubTitle = "1972-2007",
                Caption = "#30DayChartChallenge | Day 5 | Comparisons: Slope",
                ThemeChoice = "econ",
                LineThickness = .5,
                YTextSize = 4,
                LineColor = c_color) +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 10),
        plot.caption = element_text(size = 8, family = "Tahoma", colour="black"))

ggsave(filename = here::here("Figures", "day05_slope.png"), height = 5, width = 10, dpi = 300)





