

# Create the figure
figure_pairs <-
  data %>% 
  
  ## Select these variables
  select(
    bat_total,
    meaningful_work_mean,
    org_support_mean,
    resilience_mean,
    uwes_3_sum
  ) %>% 
  
  GGally::ggpairs(
    ## How to display the names of the variables
    columnLabels = c('BAT',
                     'Meaning Work',
                     'POS',
                     'Resilience',
                     'Engagement'),
    
    ## Display a scatter plot with LOESS line using helper function
    lower = list(continuous = pairs_loess),
    
    ## Display the correlation coefficient using helper function
    upper = list(continuous = cor_func)
  )

# Print
figure_pairs

# Write to file
ggsave(plot = figure_pairs, 
       filename = 'output/figure-pairs.jpeg',
       bg = "transparent", width = 6, height = 4.75, dpi = 300)
