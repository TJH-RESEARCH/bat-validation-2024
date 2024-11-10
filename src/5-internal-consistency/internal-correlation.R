
# Calculate correlation
correlation_internal <- 
  data %>% 
  select(
    bat_exhaustion,
    bat_mental_distance,
    bat_cog_impairment,
    bat_emo_impairment,
    bat_psych_distress,
    bat_psych_symptoms
  ) %>% 
  psych::corr.test()

# Get correlation coefficients
table_correlation_internal_r <-
  correlation_internal$r %>% 
  corrr::as_cordf() %>% 
  corrr::shave()

# Get p-values
table_correlation_internal_p <-
  correlation_internal$p %>% 
  corrr::as_cordf() %>% 
  corrr::shave(upper = FALSE)

# Print
table_correlation_internal_r
table_correlation_internal_p

# Write to file
table_correlation_internal_r %>% write_csv('output/table-correlation-internal-r.csv')
table_correlation_internal_p %>% write_csv('output/table-correlation-internal-p.csv')
