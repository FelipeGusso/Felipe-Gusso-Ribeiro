# AULA 2

# TIRAR NOTAÇÃO CIENTÍFICA ####
options(scipen = 999)

# EXCLUIR UMA BASE DE DADOS
nomedoobjeto <- NULL

## ATALHOS DE TECLADO ####
# "<-": "ALT" + "-"
# PARA EXECUTAR A LINHA: "ALT" + "ENTER"
# PARA EXECUTAR TODO SCRIPT: "ALT" + "SHIFT" + "ENTER"

## BIBLIOTECA PARA ACESSAR DADOS DO BANCO MUNDIAL ####

install.packages('WDI') # PRIMEIRO A EXECUTAR
library(WDI) # CARREGAR O PACOTE

## VARIÁVEIS ####

# Inflação (variação anual do IPC, %): FP.CPI.TOTL.ZG
# População total: SP.POP.TOTL

# Infos: http://vincentarelbundock.github.io/WDI/

variaveis <- c('FP.CPI.TOTL.ZG',
               'SP.POP.TOTL')

# BASE DE DADOS DE CORTE TRANSVERSAL

 install.packages("tidyverse")
library(tidyverse)
dadosok <- WDI(indicator = variaveis,
               country = 'all', # TODOS = "all"
               start = 2022, end = 2022) %>% 
  na.omit()

# BASE DE DADOS DA APRESENTAÇÃO (BRASIL)

dadosbr <- WDI(indicator = variaveis,
               country = 'BR', # Código Iso2C
               start = 1961, end = 2018)



