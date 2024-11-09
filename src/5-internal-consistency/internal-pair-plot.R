library(GGally)

figure_internal_pairs <-
  data %>% 
  select(
    bat_exhaustion,
    bat_mental_distance,
    bat_cog_impairment,
    bat_emo_impairment,
    bat_psych_distress,
    bat_psych_symptoms
  ) %>% 
  GGally::ggpairs(columnLabels = c('Exhaust',
                                   'Men Dist',
                                   'Cog Impair',
                                   'Emo Impair',
                                   'Distress',
                                   'Symptoms'),
                  upper = list(continuous = GGally::wrap(ggally_cor, 
                                                         stars = FALSE))
                  )
figure_internal_pairs



ggsave(plot = figure_internal_pairs, 
       filename = 'output/figure-internal-pairs.jpeg',
       bg = "transparent", width = 6, height = 4.75, dpi = 300)
