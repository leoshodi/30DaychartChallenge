############################################
## #30DayChartChallenge contributions - April 2023
# Day 2: Waffle
# Data source: TidyTuesday (2019 Week 20)
################################
# 1.0 Start ------
# Clear all
rm(list=ls()) 
graphics.off() #Closing all previously open graphs

#####################################
## Load library
library(tidyverse)
library(waffle)
library(ggtext)
library(here)
library(patchwork)
library(extrafont)

#Import data
tt <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-05-14/nobel_winners.csv")

#Wrangle data
tt_data_prep <-  tt %>% 
  filter(category == "Economics") %>% 
  select(prize_year, category, full_name, birth_country) %>% 
  mutate(continent = factor(case_when(
    birth_country == "Norway" ~ "Europe",
    birth_country  == "Canada" ~ "North America",
    birth_country  == "France" ~ "Europe",
    birth_country  == "Netherlands" ~ "Europe",
    birth_country  == "British Mandate of Palestine (Israel)" ~ "Europe",
    birth_country  == "United States of America" ~ "North America",
    birth_country  == "British West Indies (Saint Lucia)" ~ "North America",
    birth_country  == "Russian Empire (Belarus)" ~ "Europe",
    birth_country  == "Russian Empire (Russia)" ~ "Europe",
    birth_country  == "United Kingdom" ~ "Europe",
    birth_country  == "Russia" ~ "Europe",
    birth_country  == "Sweden" ~ "Europe",
    birth_country  == "Austria" ~ "Europe",
    birth_country  == "Finland" ~ "Europe",
    birth_country  == "Germany" ~ "Europe",
    birth_country  == "Hungary" ~ "Europe",
    birth_country  == "Scotland" ~ "Europe",
    birth_country  == "Italy" ~ "Europe",
    birth_country  == "India" ~ "Asia",
    birth_country  == "Cyprus" ~ "Europe",
    birth_country  == "Germany (Poland)" ~ "Europe",
    TRUE ~ "Others"
  )))
  
  
  
tt_data_prep1 <- tt_data_prep %>% 
  group_by(category) %>% 
  count(continent) %>% 
  ungroup() %>% 
  rename(value = n) %>% 
  select(continent, value)


# Waffle plot
tt_data_prep1 %>% 
  ggplot(aes(fill = continent, values = value)) +
  geom_waffle(n_rows = 8, size = 0.33, colour = "white") +
  scale_fill_manual(name = NULL,
                    values = c("#BA182A", "#FF8288", "#FFDBDD"),
                    labels = c("Asia", "Europe", "North America")) +
  coord_equal() +
  theme_void() +
  labs(title = "Nobel Prize for Economics",
       subtitle = "Winners by Continent",
       caption = "#30DayChartChallenge | Day 2 | Comparisons: waffle\nDataviz: Olalekan Oshodi") +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        plot.subtitle = element_text(size = 12, family = "Tahoma"),
        plot.caption = element_text(size = 8, family = "Tahoma", colour="black"))

ggsave(filename = here::here("Figures", "day02_waffle.png"), height = 5, width = 10, dpi = 300)



