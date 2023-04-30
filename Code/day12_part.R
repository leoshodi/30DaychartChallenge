############################################
## #30DayChartChallenge contributions - April 2023
# Day 12: Theme day: BBC News
# Data source: ggparliament package
################################
# 1.0 Start ------
# Clear all
rm(list=ls()) 
graphics.off() #Closing all previously open graphs


#####
# Load library
library(tidyverse)
library(ggalt)

#####
# Load data
tt_data <- read_csv("data/2_gdp.csv")

tt_data <- tt_data %>% 
  drop_na()

# Prepare data
tt_data1 <- tt_data %>% 
  mutate(gap = `2021` - `1960`) %>% 
  arrange(desc(gap)) %>%
  head(10)
  
font <- "YuGothic"


#Make plot
My_BBC_Chart <-  tt_data1 %>% 
  ggplot(aes(x = `1960`, xend = `2021`, y = reorder(Country, gap), group = Country)) +
  geom_dumbbell(colour = "#dddddd",
                size = 3,
                colour_x = "#FAAB18",
                colour_xend = "#1380A1") +
  theme(legend.position = "top") +
  labs(title="GDP per capital - constant 2015 US$",
       subtitle="Biggest GDP per capita rise, 1960-2021",
       caption = "#30DayChartChallenge | Day 12 | Theme day: BBC News <br>**_______________________________________________________________________________________________________________________**<br><br>Source: The World Bank") +
  theme(plot.title = ggplot2::element_text(family = font, 
                                           size = 28, face = "bold", color = "#222222"), 
        plot.subtitle = ggplot2::element_text(family = font, size = 22, margin = ggplot2::margin(9, 0, 9, 0)), 
        plot.caption = ggtext::element_textbox_simple(family = font, size = 8, halign = 0,
                                                      margin = margin(t = 0.5, b = 0.5, unit = "cm"),
                                                      colour = "#1b1b1b",
                                                      lineheight = 0.2),
        legend.position = "top", legend.text.align = 0, legend.background = ggplot2::element_blank(), 
        legend.title = ggplot2::element_blank(), legend.key = ggplot2::element_blank(), 
        legend.text = ggplot2::element_text(family = font, size = 18, 
                                            color = "#222222"), axis.title = ggplot2::element_blank(), 
        axis.text = ggplot2::element_text(family = font, size = 18, 
                                          color = "#222222"), axis.text.x = ggplot2::element_text(margin = ggplot2::margin(5, 
                                                                                                                           b = 10)), axis.ticks = ggplot2::element_blank(), 
        axis.line = ggplot2::element_blank(), panel.grid.minor = ggplot2::element_blank(), 
        panel.grid.major.y = ggplot2::element_line(color = "#cbcbcb"), 
        panel.grid.major.x = ggplot2::element_blank(), panel.background = ggplot2::element_blank(), 
        strip.background = ggplot2::element_rect(fill = "white"), 
        strip.text = ggplot2::element_text(size = 22, hjust = 0))
 
                                       

My_BBC_Chart        
        
ggsave(filename = here::here("Figures", "day12_BBC.png"), height = 5, width = 10, dpi = 300)













