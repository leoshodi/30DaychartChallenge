############################################
## #30DayChartChallenge contributions - April 2023
# Day 3: Fauna/Flora
# Data source: TidyTuesday (2020 Week 34)
################################
# 1.0 Start ------
# Clear all
rm(list=ls()) 
graphics.off() #Closing all previously open graphs

#####################################
## Load library
library(tidyverse)
library(gghighlight)

# Import data
threats <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-08-18/threats.csv')

# Plot
threats %>% 
  filter(threatened == 1 & group == "Flowering Plant") %>% 
  count(threat_type, sort = T) %>% 
  mutate(threat_type = fct_reorder(threat_type, n, sum)) %>% 
  ggplot(aes(n, threat_type, fill = threat_type)) +
  geom_col(width=0.9) +
  scale_fill_manual( values = c( "Agriculture & Aquaculture"="red", "0"="darkgray" ), guide = FALSE )+
  labs(title="Highlighting a Bar in Barplot in ggplt2") +
  labs(x= "# of flowering plants facing this threat",
       y = "",
       title = "What are the most common threat to flowering plants?",
       caption = "#30DayChartChallenge | Day 3 | Comparisons: Fauna/Flora") +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_line(colour = "#d3d3d3"), panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank()) +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text=element_text(family="Tahoma"),
        axis.text.x=element_text(colour="black", size = 10),
        plot.caption = element_text(size = 8, family = "Tahoma", colour="black"))

ggsave(filename = here::here("Figures", "day03_flora.png"), height = 5, width = 10, dpi = 300)
  