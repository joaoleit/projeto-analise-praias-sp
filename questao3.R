setwd("C:\\Users\\Joao\\Documents\\R")

library(readxl)
library(tidyverse)

praias = read_excel('sp_beaches.xlsx') %>%
  filter(City == "ITANHAÉM") %>%
  mutate(Enterococcus = as.numeric(Enterococcus)) %>% 
  group_by(Beach) %>% 
  summarise(
    media = mean(Enterococcus),
    desvioPadrao = sd(Enterococcus),
    minimo = min(Enterococcus),
    maximo = max(Enterococcus),
    mediana = median(Enterococcus),
    Q1 = quantile(Enterococcus, 0.25),
    Q3 = quantile(Enterococcus, 0.75)
  )

g_pizza = praias %>% ggplot(aes(x="", y = maximo, fill = Beach)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  theme_void() +
  geom_col(width = 1, color = 1) +
  geom_text(aes(
    label = paste0(round(100 * (maximo / sum(maximo)), 1), "%"), x = 1.3),
    position = position_stack(vjust = 0.5
    )) +
  labs(
    title = "Grafico Pizza",
    y = "Máximo",
    fill = "Praia"
  )
