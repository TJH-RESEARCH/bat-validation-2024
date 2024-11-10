
library(patchwork)

## Save residuals and fitted values
table_diagnostics <-
  tibble(residuals = lm_turnover_intent_bat$residuals,
         fits =  lm_turnover_intent_bat$fitted.values,
         turnover_intent_mean = lm_turnover_intent_bat$model$turnover_intent_mean, 
         bat_total = lm_turnover_intent_bat$model$bat_total,
         leverage = hatvalues(lm_turnover_intent_bat)
         ) %>% 
    mutate(
      bat_min = ifelse(bat_total == min(bat_total), 1, 0), 
      bat_max = ifelse(bat_total == max(bat_total), 1, 0), 
      turnover_min = ifelse(bat_total == max(turnover_intent_mean), 1, 0), 
      turnover_max = ifelse(bat_total == min(turnover_intent_mean), 1, 0), 
      residuals_z = abs((residuals - mean(residuals) ) / sd(residuals))
           )

## Predicted vs. Actual
plot_predicted_actual <-
  table_diagnostics %>% 
  ggplot(aes(turnover_intent_mean, fits)) +
  geom_point(alpha = .5, position = 'jitter',
             color = '#440154FF',size = 3) +
  geom_smooth(
    method = 'lm',
    se = FALSE,
    color = '#FDE725FF', 
    alpha = .5, 
    linewidth = 1.75, 
    span = 1) +
  labs(y = 'Predicted', 
       x = 'Actual',
       title = 'Predicted vs. Actual') +
  theme_bw()

plot_predicted_actual





### Histogram of Residuals
plot_residuals_hist <-
  table_diagnostics %>% 
  ggplot(aes(residuals)) +
  geom_histogram(bins = 20,
                 alpha = .75, 
                 fill = '#440154FF',
                 color = 'black') +
  labs(x = 'Residuals', 
       y = 'Count',
       title = 'Histogram of Residuals') +
  theme_bw()
plot_residuals_hist

### QQ Plot of Residuals
plot_qq <-
  table_diagnostics %>%
  ggplot(aes(sample = residuals)) +
  stat_qq_line(color =  '#FDE725FF', alpha = 1, linewidth = 1.75) +
  stat_qq(color = '#440154FF', alpha = .35, size = 3) +
  labs(x = 'Theoretical', 
       y = 'Residuals',
       title = 'Q-Q Plot') +
  theme_bw()
plot_qq


### Residuals vs. Fitted
plot_residuals_fitted <-
  table_diagnostics %>%
  ggplot(aes(fits, residuals)) +
  geom_point(alpha = .5, position = 'jitter',
             color = '#440154FF',size = 3) +
  geom_smooth(color = '#FDE725FF', 
              alpha = .5, 
              linewidth = 1.75, 
              span = 1) +
  labs(x = 'Fitted Values', 
       y = 'Residuals',
       title = 'Residuals vs. Fitted') +
  theme_bw()
plot_residuals_fitted

## Scale Location
plot_scale_location <-
  table_diagnostics %>% 
  ggplot(aes(fits, sqrt(residuals_z))) +
  geom_point(alpha = .5, position = 'jitter',
             color = '#440154FF',size = 3) +
  geom_smooth(color = '#FDE725FF', 
              alpha = .5, 
              linewidth = 1.75, 
              span = 1) +
  labs(x = 'Fitted Values', 
       title = 'Scale Location') +
  theme_bw()
plot_scale_location


## Leverage
plot_leverage <-
  table_diagnostics %>% 
  ggplot(aes(leverage, residuals_z)) +
  geom_point(alpha = .5, position = 'jitter',
             color = '#440154FF',size = 3) +
  geom_smooth(color = '#FDE725FF', 
              alpha = .5, 
              linewidth = 1.75, 
              span = 1) +
  labs(
       title = 'Leverage') +
  theme_bw()
plot_leverage

# Combine Plots
plot_linear_model <-
  (plot_residuals_hist + plot_residuals_fitted) /
  (plot_qq + plot_scale_location) /
  (plot_leverage + plot_predicted_actual)


# Write to file
ggsave(plot = plot_linear_model, 
       filename = 'output/figure-linear-model.jpeg',
       bg = "transparent", width = 6, height = 6, dpi = 300)


