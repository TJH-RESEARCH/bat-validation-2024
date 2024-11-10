
plot_bivariate <-
  data %>% 
  ggpairs(
    ## Select variables
    columns = c('bat_total', 'turnover_intent_mean'),
   
    columnLabels = c('BAT',
                     'Turnover Intent'),
                     
    ## Display a scatter plot with LOESS line using helper function
    lower = list(continuous = pairs_loess),
          
    ## Display the correlation coefficient using helper function
    upper = list(continuous = cor_func),
    
    diag = list(continuous = pairs_hist)
  )


# Print
plot_bivariate

# Write to file
ggsave(plot = plot_bivariate, 
       filename = 'output/figure-bivariate.jpeg',
       bg = "transparent", width = 6, height = 4, dpi = 300)


