setwd(paste0(getwd(), "/projeto-analise-praias-sp"))

library(readxl)
library(tidyverse)

praias = read_excel('sp_beaches.xlsx') %>%
  filter(City == "ITANHAÉM") %>%
  mutate(Enterococcus = as.numeric(Enterococcus)) %>% 
  group_by(Beach) %>%
  summarise(
    amostras = n()
  )

g_pizza = praias %>% ggplot(aes(x="", y = amostras, fill = Beach)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  theme_void() +
  geom_col(width = 1, color = 1) +
  geom_text(aes(
    label = paste0(round(100 * (amostras / sum(amostras)), 1), "%"), x = 1.3),
    position = position_stack(vjust = 0.5
    )) +
  labs(
    title = "Grafico Pizza",
    y = "Amostras",
    fill = "Praia"
  )
