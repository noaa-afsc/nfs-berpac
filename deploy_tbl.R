library(tidyverse)
library(googlesheets4)

read_sheet(
  "1geSmkVzPK_nOkR-bdO5WpM0qHo8Xsw0poYWOz-k2trk"
) %>% 
  select(2,5,10) %>% 
  janitor::clean_names() %>% 
  rename(deployid = deploy_id) %>% 
  mutate(deploy_date_time_gmt = lubridate::force_tz(deploy_date_time_gmt,"UTC")) %>% 
  readr::write_rds(file = here::here('data/deploy_tbl.rds'))
