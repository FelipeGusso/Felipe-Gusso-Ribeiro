# Instalar e carregar pacotes necessários
#install.packages("WDI")
#install.packages("ggplot2")
#install.packages("tidyverse")

library(WDI)
library(ggplot2)
library(tidyverse)

# Definir os códigos das variáveis
variaveis <- c("SP.DYN.LE00.IN", "SL.UEM.TOTL.ZS")

# Coletar dados para o corte transversal (2022)
dados_corte <- WDI(indicator = variaveis, country = "all", start = 2022, end = 2022) %>% na.omit()

# Criar gráfico de dispersão (Corte Transversal)
grafico_corte <- ggplot(dados_corte, aes(x = SL.UEM.TOTL.ZS, y = SP.DYN.LE00.IN)) +
  geom_point(color = "blue", size = 3, alpha = 0.6) +
  labs(title = "Expectativa de Vida vs Taxa de Desemprego (2022)",
       x = "Taxa de Desemprego (%)",
       y = "Expectativa de Vida (anos)") +
  theme_minimal() +
  geom_smooth(method = "lm", se = FALSE, color = "red")

# Salvar a imagem do gráfico de dispersão
ggsave("grafico_corte.png", plot = grafico_corte, width = 8, height = 5)

# Coletar dados para a série temporal do Brasil
dados_serie <- WDI(indicator = "SP.DYN.LE00.IN", country = "BR", start = 1960, end = 2022)

# Criar gráfico de série temporal
grafico_serie <- ggplot(dados_serie, aes(x = year, y = SP.DYN.LE00.IN)) +
  geom_line(color = "blue", size = 1) +
  labs(title = "Evolução da Expectativa de Vida no Brasil",
       x = "Ano",
       y = "Expectativa de Vida (anos)") +
  theme_minimal()

# Salvar a imagem do gráfico de série temporal
ggsave("grafico_serie.png", plot = grafico_serie, width = 8, height = 5)

# Exibir os gráficos no RStudio
print(grafico_corte)
print(grafico_serie)
