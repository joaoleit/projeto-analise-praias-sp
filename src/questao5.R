setwd(paste0(getwd(), "/projeto-analise-praias-sp"))

library(readxl)
library(tidyverse)

praias = read_excel('sp_beaches.xlsx') %>%
  filter(City == "ITANHAÉM") %>%
  mutate(Enterococcus = as.numeric(Enterococcus))

g_boxplot = praias %>%
  ggplot(aes(x = Beach, y = Enterococcus, fill = Beach)) +
  theme_minimal() +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
