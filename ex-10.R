# Aine Roonan
# August 19
# Homework exercises day 10 geometries

library(USAboundaries)
library(tidyverse)
library(sf)

USAboundaries::us_states()
conus = USAboundaries::us_states() %>%
  filter(!state_name %in% c("Puerto Rico", "Alaska", "Hawaii"))

states <- us_states()

states <- st_cast(states, 'MULTILINESTRING') %>% select(geometry)

plot(states$geometry, col = 'lavender')
states


outline <- st_union(states$geometry) %>% st_cast('MULTILINESTRING')

plot(outline, col = 'turquoise')
outline
