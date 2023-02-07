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

g_barras = praias %>%
  ggplot(aes(y = reorder(Beach, maximo), x = maximo, fill = Beach)) +
  geom_bar(stat="identity") +
  geom_text(aes(x = maximo - 60, label = paste0(round(100 * (maximo / sum(maximo)), 1), "%"))) +
  labs(
    title = "Grafico Barra",
    x = "Máximo",
    y = "Praia",
    fill = "Praia"
  )
