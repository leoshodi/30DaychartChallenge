############################################
## #30DayChartChallenge contributions - April 2023
# Day 7: Hazards
# Data source: Metropolitan Police
################################
# 1.0 Start ------
# Clear all
rm(list=ls()) 
graphics.off() #Closing all previously open graphs

#####################################
## Load library
library(tidyverse)
library(maps)
library(mapproj)

####
# Import and Wrangle data
# Preprocessed the data using pivot tables in Microsoft Excel
tt_data <- read_csv("data/police1_data.csv")

tt_data1 <- hh 

tt_data$Day <- factor(tt_data$Day, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

# Plot data

tt_data %>%
  ggplot( aes(x=Day, y=Frequency, fill= Day)) +
  geom_bar(stat="identity", alpha=.6, width=.8) +
  scale_fill_manual(values = c("Sunday"="red", "Saturday" = "red", "0" = "gray100"))+
  labs(title= "Drink driving incidents in London and its boroughs, 2021",
       subtitle = "Over 45% of drunk driving incidents occurred on Saturday and Sunday") +
  labs(x= "# of drunk driving incidents",
       y = "",
       caption = "#30DayChartChallenge | Day 7 | Hazards | Source: Metropolitan Police") +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank(), legend.position = "none") +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 10),
        plot.caption = element_text(size = 8, family = "Tahoma", colour="black"))

ggsave(filename = here::here("Figures", "day07_hazards.png"), height = 5, width = 10, dpi = 300)
