############################################
## #30DayChartChallenge contributions - April 2023
# Day 1: part-to-whole
################################
# 1.0 Start ------
# Clear all
rm(list=ls()) 
graphics.off() #Closing all previously open graphs

#####################################
## Load library 
library(tidyverse) 
library(scales)
library(lubridate)
library(ggplot2)
theme_set(theme_light())

##########
# Load data
tt_data <- read_csv("data/uk_energy.csv")

tt_data <- janitor::clean_names(tt_data)

tt_data_prep <- tt_data %>% 
  select(year, percentage_non_renewable, percentage_renewable) %>% 
  rename("Non-renewable" = percentage_non_renewable, Renewable = percentage_renewable) %>% 
  mutate(departure = make_date(year)) %>% 
  select(departure, everything(), -year) %>% 
  pivot_longer(!departure, names_to = "source", values_to = "percentage")

####

tt_data_prep %>% 
  ggplot(aes(y= percentage, x= departure, fill= source, label = percentage)) +
  geom_col() +
  theme(legend.position="bottom", legend.direction="horizontal",
        legend.title = element_blank()) +
  scale_y_continuous(labels = dollar_format(suffix = "%", prefix = "")) +
  labs(x="Year", y="Percentage",
       title = "Proportion of Renewable Energy Consumed in the UK",
       subtitle = "The proportion of renewable energy consumed in the UK varies from 0.73% (1990) to 14.44% (2020)",
       caption = "#30DayChartChallenge | Day 1 | Comparisons: part-to-whole\nDataviz: Olalekan Oshodi") +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        plot.subtitle = element_text(size = 12, family = "Tahoma"),
        plot.caption = element_text(size = 8, family = "Tahoma", colour="black"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 10),
        axis.text.y=element_text(colour="black", size = 10))

ggsave(filename = here::here("Figures", "day01_part-to-whole.png"), height = 5, width = 10, dpi = 400)
  