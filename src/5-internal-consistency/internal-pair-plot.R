library(GGally)

pairs_loess <- function(data, mapping, method="loess", ...){
  plot <- 
    ggplot(data = data, mapping = mapping) + 
    geom_point(
      alpha = .75, 
      color = '#440154FF',
      position = 'jitter'
    ) + 
    geom_smooth(method = method, 
                span = 1,
                color = '#FDE725FF', 
                fill =  '#FDE725FF',
                ...) +
    theme_minimal()
  plot
}


pairs_lm <- function(data, mapping, method="lm", ...){
  plot <- 
    ggplot(data = data, mapping = mapping) + 
    geom_point(
      alpha = .75, 
      color = '#440154FF',
      position = 'jitter'
    ) + 
    geom_smooth(method = method, 
                color = '#FDE725FF', 
                fill =  '#FDE725FF',
                ...) +
    theme_minimal()
  plot
}


pairs_hist <- function(data, mapping, ...){
  plot <- 
    ggplot(data = data, mapping = mapping) + 
    geom_histogram(
      bins = 20,
      alpha = .75, 
      fill = '#440154FF',
      color = 'black'
    )
  plot
}


# Create Helper function to do correlation in paired plot
cor_func <- function(data, mapping, ...){
  
  ## Reads the pairs of variables
  x <- eval_data_col(data, mapping$x)
  y <- eval_data_col(data, mapping$y)
  
  ## Calculate correlation
  corr <- cor(x, y, method = 'pearson', use = 'complete.obs')
  
  ## Prints correlation coefficient as text in a ggplot object
  ggally_text(
    label = 
      str_replace(string =
                    as.character(round(corr, 3)),
                       pattern = '0.',
                       replacement = '.'
                       ),
    , 
    mapping = aes(),
    xP = 0.5, yP = 0.5,
    color = 'black',
    ...
  ) + 
  ## Removes the ggplot background theme
    theme_void()
}


# Create the figure
figure_internal_pairs <-
  data %>% 
  
  ## Select these variables
  select(
    bat_exhaustion,
    bat_mental_distance,
    bat_cog_impairment,
    bat_emo_impairment,
    bat_psych_distress,
    bat_psych_symptoms
  ) %>% 
  
  GGally::ggpairs(
    ## How to display the names of the variables
    columnLabels = c('Exhaust',
                     'Men Dist',
                     'Cog Impair',
                     'Emo Impair',
                     'Distress',
                     'Symptoms'),
    
    ## Display a scatter plot with LOESS line using helper function
    lower = list(continuous = pairs_loess),
    
    ## Display the correlation coefficient using helper function
    upper = list(continuous = cor_func)
                    )

# Print
figure_internal_pairs

# Write to file
ggsave(plot = figure_internal_pairs, 
       filename = 'output/figure-internal-pairs.jpeg',
       bg = "transparent", width = 6, height = 4.75, dpi = 300)
