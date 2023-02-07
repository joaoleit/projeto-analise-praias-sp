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

g_barras = praias %>%
  ggplot(aes(y = reorder(Beach, amostras), x = amostras, fill = Beach)) +
  geom_bar(stat="identity") +
  geom_text(aes(x = amostras - 60, label = paste0(round(100 * (amostras / sum(amostras)), 1), "%"))) +
  labs(
    title = "Grafico Barra",
    x = "Amostras",
    y = "Praia",
    fill = "Praia"
  )
