# Aine Roonan
# August 13
# Homework exercises day 7

library(tidyverse)
url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'
covid = read_csv(url)
library(dplyr)
library(ggplot2)

region = data.frame(state = state.name, region = state.region)
head(region)

covid %>%
  right_join(region, by = "state") %>%
  group_by(region, date) %>%
  summarize(cases  = sum(cases),
            deaths = sum(deaths)) %>%
  pivot_longer(cols = c('cases', 'deaths')) ->
  covidregion

ggplot(covidregion, aes(x = date, y = value)) +
  geom_line(aes(col = region)) +
  facet_grid(name~region, scale = "free_y") +
  theme_linedraw() +
  theme(legend.position = "bottom") +
  theme(legend.position = "NA") +
  labs(title = "Cummulative Cases and Deaths: Region",
       y = "Daily Cumulative Count",
       x = "Date",
       caption = "Daily Exercise 07",
       subtitle = "COVID-19 Data: NY-Times" )

ggsave(file="img/covidbyregion.png")
