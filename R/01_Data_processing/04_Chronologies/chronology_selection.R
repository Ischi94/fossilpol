library(tidyverse)

# load check list
dat_env <- read_csv("C:/Users/gmathes/Documents/OneDrive - Universität Zürich UZH/1_postdoc/fossilpol/Data/Input/Chronology_setting/Chron_control_point_types/chron_control_point_types_2024-01-30.csv")


# apply
dat_final <- dat_env %>%
  mutate(include = TRUE, 
         calibrate = TRUE)

# save
dat_final %>% 
  write_csv("C:/Users/gmathes/Documents/OneDrive - Universität Zürich UZH/1_postdoc/fossilpol/Data/Input/Chronology_setting/Chron_control_point_types/chron_control_point_types_2024-01-30.csv")


# load check list
dat_env <- read_csv("C:/Users/gmathes/Documents/OneDrive - Universität Zürich UZH/1_postdoc/fossilpol/Data/Input/Chronology_setting/Percentage_radiocarbon/potential_pmc_2024-01-30.csv")


# apply
dat_final <- dat_env %>%
  filter(fulfil_criteria == TRUE) %>% 
  mutate(include = TRUE)

# save
dat_final %>% 
  write_csv("C:/Users/gmathes/Documents/OneDrive - Universität Zürich UZH/1_postdoc/fossilpol/Data/Input/Chronology_setting/Percentage_radiocarbon/potential_pmc_2024-01-30.csv")
