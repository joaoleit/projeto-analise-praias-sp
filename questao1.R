# install.packages("rstudioapi")
library("rstudioapi")
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# install.packages("readxl")
library(readxl)
# install.packages("tidyverse")
library(tidyverse)

praias <- read_excel("sp_beaches.xlsx") %>%
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
