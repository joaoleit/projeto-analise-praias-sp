library("rstudioapi")
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

library(readxl)
library(tidyverse)

praias <- read_excel("sp_beaches.xlsx") %>%
  filter(City == "ITANHAÉM") %>%
  mutate(Enterococcus = as.numeric(Enterococcus))

g_histograma <- praias %>% ggplot(aes(x = Enterococcus)) +
  geom_histogram(
    fill = "green",
    alpha = 1,
    binwidth = 5,
    position = "identity"
  ) +
  labs(
    title = "Histograma",
    x = "Enterococcus",
    y = "Frequência",
  )
