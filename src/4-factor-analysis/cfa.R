library(lavaan)

model_six_factor <- 
  '
  exhaustion =~ bat1 + bat2 + bat3
  mental_distance =~ bat4 + bat5 + bat6
  cognitive_impairment =~  bat7 + bat8 + bat9
  emotional_impairment =~  bat10 + bat11 + bat12
  pyschological_distress =~ batsec1 + batsec2 + batsec3 + batsec4 + batsec5
  pyschomatic_symptoms =~   batsec6 + batsec7 + batsec8 + batsec9 + batsec10
  '

fit_six_factor <-
  cfa(
    model = model_six_factor,
    data = data
  )

fit_six_factor %>% summary()
fit_six_factor %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli'))
fit_six_factor %>% semPlot::semPaths(weighted = TRUE)

# One-Factor --------------------------------------------------------------

model_one_factor <- 
  '
  burnout =~ bat1 + bat2 + bat3 + bat4 + bat5 + bat6 + bat7 + bat8 + bat9 + bat10 + bat11 + bat12 +batsec1 + batsec2 + batsec3 + batsec4 + batsec5 + batsec6 + batsec7 + batsec8 + batsec9 + batsec10
  '

fit_one_factor <-
  cfa(
    model = model_one_factor,
    data = data
  )

fit_one_factor %>% summary()
fit_one_factor %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli'))
fit_one_factor %>% semPlot::semPaths(weighted = TRUE)


# Bifactor --------------------------------------------------------------

model_bifactor <- 
  '
  
  # General Factor
  burnout =~ bat1 + bat2 + bat3 + bat4 + bat5 + bat6 + bat7 + bat8 + bat9 + bat10 + bat11 + bat12 +batsec1 + batsec2 + batsec3 + batsec4 + batsec5 + batsec6 + batsec7 + batsec8 + batsec9 + batsec10
  
  # Factors
  exhaustion =~ bat1 + bat2 + bat3
  mental_distance =~ bat4 + bat5 + bat6
  cognitive_impairment =~  bat7 + bat8 + bat9
  emotional_impairment =~  bat10 + bat11 + bat12
  pyschological_distress =~ batsec1 + batsec2 + batsec3 + batsec4 + batsec5
  pyschomatic_symptoms =~   batsec6 + batsec7 + batsec8 + batsec9 + batsec10
  
  burnout ~~ 0 * exhaustion
  burnout ~~ 0 * mental_distance
  burnout ~~ 0 * cognitive_impairment
  burnout ~~ 0 * emotional_impairment
  burnout ~~ 0 * pyschological_distress
  burnout ~~ 0 * pyschomatic_symptoms
  
  exhaustion ~~ 0 * exhaustion
  mental_distance ~~ 0 * mental_distance
  cognitive_impairment ~~ 0 * cognitive_impairment
  emotional_impairment ~~ 0 * emotional_impairment
  pyschological_distress ~~ 0 * pyschological_distress
  pyschomatic_symptoms ~~ 0 * pyschomatic_symptoms
  

  '


fit_bifactor <-
  cfa(
    model = model_bifactor,
    data = data
  )

fit_bifactor %>% summary()
fit_bifactor %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli'))
fit_bifactor %>% semPlot::semPaths(weighted = TRUE)


# Second Order Factor --------------------------------------------------------------

model_second_order <- 
  '
  burnout =~ exhaustion + mental_distance + cognitive_impairment + emotional_impairment
  exhaustion =~ bat1 + bat2 + bat3
  mental_distance =~ bat4 + bat5 + bat6
  cognitive_impairment =~  bat7 + bat8 + bat9
  emotional_impairment =~  bat10 + bat11 + bat12
  '

fit_second_order <-
  cfa(
    model = model_second_order,
    data = data
  )

fit_second_order %>% summary()
fit_second_order %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli'))
fit_second_order %>% semPlot::semPaths(weighted = TRUE)

# FIT INDICES -------------------------------------------------------------
fit_indices <-
  tibble(
    measure = c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli'),
    one_factor = fit_one_factor %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli')) %>% as.numeric(),
    six_factor = fit_six_factor %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli')) %>% as.numeric(),
    bifactor = fit_bifactor %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli')) %>% as.numeric(),
    second_order = fit_second_order %>% fitMeasures(c("cfi", "gfi", 'agfi', 'rmr', 'rmsea', 'srmr', 'nfi', 'tli')) %>% as.numeric()
    )
fit_indices


# TABLE: FIT INDICES -------------------------------------------------------------------
table_fits <-
  fit_indices %>% 
  pivot_longer(-measure) %>% 
  rename(model = name) %>% 
  pivot_wider(names_from = measure) %>% 
  mutate(df = AIC(fit_one_factor, fit_six_factor, fit_bifactor, fit_second_order)[[1]],
         aic = AIC(fit_one_factor, fit_six_factor, fit_bifactor, fit_second_order)[[2]],
         bic = BIC(fit_one_factor, fit_six_factor, fit_bifactor, fit_second_order)[[2]]) %>% 
  select(model, df, everything())

table_fits %>% write_csv('output/table-fits.csv')

# TABLE: FACTOR LOADINGS --------------------------------------------------------------------
table_loadings <-
  fit_six_factor %>% 
  parameterEstimates(standardized = TRUE) %>% 
  filter(op == '=~') %>% 
  select(lhs, rhs, std.all) %>% 
  pivot_wider(names_from = lhs, values_from = std.all)

table_loadings %>% write_csv('output/table-loadings.csv')
