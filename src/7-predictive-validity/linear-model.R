

# NULL MODEL ---------------------------------------------------------
lm_turnover_intent_null <-
  data %>% 
  lm(turnover_intent_mean ~ 1, .)

lm_turnover_intent_null %>% summary()


# WITH COVARIATES ---------------------------------------------------------
lm_turnover_intent_cov <-
  data %>% 
  lm(turnover_intent_mean ~ 
       gender_male +
       police +
       fire +
       ems +
       race_asian + 
       race_black +
       race_latino + 
       race_white +
       income_num +
       second_job_dummy +
       years_tenure +
       relationship, .)

lm_turnover_intent_cov %>% summary()



# WITH COVARIATES ---------------------------------------------------------
lm_turnover_intent_bat <-
  data %>% 
  lm(turnover_intent_mean ~ 
       bat_total +
       gender_male +
       police +
       fire +
       ems +
       race_asian + 
       race_black +
       race_latino + 
       race_white +
       income_num +
       second_job_dummy +
       years_tenure +
       relationship, .)

lm_turnover_intent_bat %>% summary()


# COMPARE MODELS TABLE
table_lm_comparison <-
  anova(
    lm_turnover_intent_cov,
    lm_turnover_intent_bat
  ) %>% 
  broom::tidy() %>% 
  mutate(
    r_squared = c(
      summary(lm_turnover_intent_cov)$r.squared,
      summary(lm_turnover_intent_bat)$r.squared
    ),
    aic = AIC(lm_turnover_intent_cov,lm_turnover_intent_bat)[,2],
    df_used = AIC(lm_turnover_intent_cov,lm_turnover_intent_bat)[,1]
  )

table_lm_comparison

table_lm_comparison %>% write_csv('output/table-lm-compare.csv')


# COEFFICENTS TABLE
table_lm_coefs <-
  lm_turnover_intent_bat %>% 
  lm.beta::lm.beta() %>% 
  broom::tidy(conf.int = TRUE)

table_lm_coefs

table_lm_coefs %>% write_csv('output/table-lm-coeficients.csv')
