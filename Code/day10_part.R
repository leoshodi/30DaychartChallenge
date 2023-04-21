############################################
## #30DayChartChallenge contributions - April 2023
# Day 10: Hybrid
# Data source: U.S. Department of Energy, Energy Vehicle Technologies Office
################################
# 1.0 Start ------
# Clear all
rm(list=ls()) 
graphics.off() #Closing all previously open graphs

#####################################
## Load library
library(tidyverse)
library(ggthemes)
library(extrafont)

#####
# Load data
tt_data <- read_csv("data/hybrid.csv")

###
#Wrangle data
tt_data <-tt_data %>% 
  janitor::clean_names() %>% 
  rename("Hybrid Electric Vehicle" = hybrid_electric, "Plug-in Hybrid Electric Vehicle" = plug_in_hybrid_electric, "Electric Vehicle" = electric) %>% 
  pivot_longer(!year, names_to = "product", values_to = "count")

# Plot data
fill <- c("#40b8d0", "#b2d183", "#d040b8")


ggplot() +
  geom_area(aes(y = count, x = year, fill = product), data = tt_data,
            stat="identity") +
  theme(legend.position="bottom", legend.direction="horizontal",
        legend.title = element_blank()) +
  scale_x_continuous(breaks=seq(2011,2021,1)) +
  labs(title = "Number of Hybrid and Electric Vehicle Sales in the US, 2011-2021")+
    labs(x="Year", y="Count",
       caption = "#30DayChartChallenge | Day 10 | Hybrid | Source: Department of Energy, Energy Vehicle Technologies Office") +
  scale_fill_manual(values=fill) +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 10),
        axis.text.y=element_text(colour="black", size = 10))

ggsave(filename = here::here("Figures", "day010_hybrid.png"), height = 5, width = 10, dpi = 300)

