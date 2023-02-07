setwd("C:\\Users\\Joao\\Documents\\R")
library(readxl)
library(tidyverse)
exl = read_excel('sp_beaches.xlsx') %>% filter(City == "ITANHAÉM") %>%
  mutate(Enterococcus = as.numeric(Enterococcus)) %>% 
  group_by(Beach)

p = exl %>% ggplot(aes(x = Enterococcus)) +
  geom_histogram(fill = "green",
                 alpha=1,
                 binwidth = 5,
                 position = 'identity') +
  labs(
    title = "Histograma",
    x = "Enterococcus",
    y = "Frequência",
  )

p

box = exl %>% ggplot(aes(x = Beach, y = Enterococcus, fill = Beach)) +
  theme_minimal() +
  geom_boxplot(  )

box
