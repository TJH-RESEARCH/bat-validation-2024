histogram_bat <-
  data %>% 
  ggplot(aes(bat_mean)) + 
  geom_histogram(aes(y=after_stat(density)),
                 bins = 20) +
  geom_density()

ggsave(plot = histogram_bat, 
       filename = 'output/figure-bat.jpeg',
       bg = "transparent", width = 6, height = 4, dpi = 300)

