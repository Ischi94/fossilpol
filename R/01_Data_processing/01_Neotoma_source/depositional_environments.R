library(tidyverse)

# load check list
dat_env <- read_csv("C:/Users/gmathes/Documents/OneDrive - Universität Zürich UZH/1_postdoc/fossilpol/Data/Input/Depositional_environment/Neotoma/depositional_environment_selection_2024-01-24.csv")

# get environments from Table S3 in Bhatta et al., 2023
dat_dep <- c( 
  "?River basin",
  "Blanket Bog",
  "Bog",
  "Bog sediment",
  "Coastal",
  "Coastal",
  "coastal sediment",
  "Coastal swamp",
  "Drained Lake",
  "Eolian deposit",
  "Fen",
  "Floodplain Basin",
  "Fluvial basin",
  "Glacial Origin Lake",
  "Inland sea",
  "lacustrine",
  "Lacustrine",
  "lake",
  "Lake",
  "Lake sediment",
  "Marsh",
  "Mire",
  "Mire",
  "Moraine Dammed Lake",
  "Morrain depression",
  "Natural Lake",
  "Palaeosol",
  "Palsa sediment",
  "Palustrine",
  "Peat",
  "peat",
  "peat bog",
  "Peat bog",
  "peat deposits",
  "Peat sediment",
  "Peatbog",
  "Peatbog",
  "peatland",
  "Peatland",
  "Peaty soil",
  "Playa",
  "Pond",
  "Raised Bog",
  "River basin",
  "Sedge wetland",
  "shallow lake",
  "soil profile",
  "Soil profile",
  "Swamp",
  "Tectonic Origin Lake",
  "Terrestrial",
  "Terrestrial",
  "Thermokarst Lake",
  "undefined, but not marine",
  "Volcanic basin",
  "Wetland",
  "Wetland"
)

# get those environments to include
dat_inc <- dat_env %>%
  pivot_longer(cols = -include) %>% 
  mutate(is_inc = value %in% dad_dep) %>% 
  pivot_wider(names_from = name, 
              values_from = value, 
              values_fn = list) %>% 
  filter(is_inc == TRUE)

# apply
dat_final <- dat_env %>% 
  mutate(include = case_when(
    depositionalenvironment %in% dat_inc$depositionalenvironment[[1]] ~ TRUE, 
    dep_env_level_1 %in% dat_inc$dep_env_level_1[[1]] ~ TRUE, 
    dep_env_level_2 %in% dat_inc$dep_env_level_2[[1]] ~ TRUE, 
    dep_env_level_3 %in% dat_inc$dep_env_level_3[[1]] ~ TRUE, 
    dep_env_level_4 %in% dat_inc$dep_env_level_4[[1]] ~ TRUE, 
    .default = FALSE
  ))

# save
# load check list
dat_final %>% 
  write_csv("C:/Users/gmathes/Documents/OneDrive - Universität Zürich UZH/1_postdoc/fossilpol/Data/Input/Depositional_environment/Neotoma/depositional_environment_selection_2024-01-24.csv")

