library(sf)
library(ggplot2)
library(rnaturalearth)
library(rnaturalearthdata)
library(dplyr)

# Cargar datos del mapa mundial
world <- ne_countries(scale = "medium", returnclass = "sf")

# Filtrar por América
americas <- world %>% filter(continent %in% c("North America", "South America"))

# Definir los regímenes autocráticos históricos y actuales
countries_americas <- data.frame(
  name = c('Argentina', 'Brazil', 'Chile', 'Cuba', 'Mexico', 'Nicaragua', 'Venezuela',
           'United States', 'Canada', 'Colombia', 'Peru', 'Ecuador', 'Bolivia',
           'Paraguay', 'Uruguay', 'Guatemala', 'Honduras', 'El Salvador',
           'Haiti', 'Dominican Republic'),
  regime = c('Autocracy (historical)', 'Autocracy (historical)', 'Autocracy (historical)',
             'Autocracy (current)', 'Autocracy (historical)', 'Autocracy (current)',
             'Autocracy (current)', 'Democracy', 'Democracy', 'Democracy', 'Democracy',
             'Democracy', 'Democracy', 'Democracy', 'Democracy', 'Autocracy (historical)',
             'Autocracy (historical)', 'Autocracy (historical)', 'Autocracy (historical)',
             'Autocracy (historical)')
)

# Unir los datos del régimen con el mapa
americas <- americas %>% left_join(countries_americas, by = c("name" = "name"))

# Crear el mapa
ggplot(data = americas) +
  geom_sf(aes(fill = regime)) +
  scale_fill_manual(values = c('Autocracy (historical)' = 'orange',
                               'Autocracy (current)' = 'red',
                               'Democracy' = 'blue',
                               'Other' = 'grey')) +
  theme_minimal() +
  labs(title = "Map of the Americas Highlighting Historical and Current Autocratic Regimes",
       fill = "Regime Type")
