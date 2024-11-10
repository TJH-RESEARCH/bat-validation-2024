

correlation <- 
  data %>% 
    select(
      bat_total,
      meaningful_work_mean,
      org_support_mean,
      resilience_mean,
      uwes_3_sum
    ) %>% 
  psych::corr.test()
  

table_correlation <- 
  tibble(
    variable = c('Meaningful Work',
                 'Org. Support',
                 'Resilience',
                 'Engagement'),
    r = c(correlation$r)[2:5],
    se = c(correlation$se)[2:5],
    t = c(correlation$t)[2:5],
    p = c(correlation$p)[2:5],
    ci_lower = correlation$ci2[1:4, 1],
    ci_upper = correlation$ci[1:4,3]
)

table_correlation

table_correlation %>% write_csv('output/table-correlation.csv')
