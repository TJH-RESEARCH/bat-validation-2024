
data %>% 
  select(
    bat_sum,
    bat_sec_sum,
    meaningful_work_mean,
    org_support_mean,
    resilience_mean,
    uwes_3_sum
  ) %>% 
  GGally::ggpairs()
