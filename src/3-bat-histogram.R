
# BAT Combined
histogram_bat <-
  data %>% 
  ggplot(aes(bat_total)) + 
  geom_histogram(bins = 20,
                 alpha = .75, 
                 fill = '#440154FF',
                 color = 'black') +
  labs(x = 'BAT', y = 'Count') +
  theme_bw()

histogram_bat

ggsave(plot = histogram_bat, 
       filename = 'output/figure-bat-total.jpeg',
       bg = "transparent", width = 6, height = 4, dpi = 300)


# BAT-Core
#histogram_bat_12 <-
#  data %>% 
#  ggplot(aes(bat_sum)) + 
#  geom_histogram(aes(y=after_stat(density)),
#                 bins = 20) +
#  geom_density()
#histogram_bat_12
#ggsave(plot = histogram_bat, 
#       filename = 'output/figure-bat-12.jpeg',
#       bg = "transparent", width = 6, height = 4, dpi = 300)


# BAT-Secondary 
#histogram_bat_sec <-
#  data %>% 
#  ggplot(aes(bat_sec_sum)) + 
#  geom_histogram(aes(y=after_stat(density)),
#                 bins = 20) +
#  geom_density()

#histogram_bat_sec

#ggsave(plot = histogram_bat, 
#       filename = 'output/figure-bat-sec.jpeg',
#       bg = "transparent", width = 6, height = 4, dpi = 300)

