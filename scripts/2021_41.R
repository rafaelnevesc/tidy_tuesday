# Loading the data ----


tuesdata <- tidytuesdayR::tt_load(2021, week = 41)

nurses <- tuesdata$nurses


# Loading libraries ----


library(tidyverse)


# Glimpse ----


nurses %>% 
  arrange(desc(Year)) %>% 
  group_by(Year) %>% 
  summarise(mean = mean(`Hourly Wage Avg`, na.rm = TRUE)) %>% 
  
  ggplot() +
  
  geom_boxplot(data = nurses, aes(group = Year, y = `Hourly Wage Avg`, x = Year)) +
  
  geom_line(aes(Year, mean), size = 2)+
  
  labs(title = "Hourly average nurse wage distribution in USA by year.") 