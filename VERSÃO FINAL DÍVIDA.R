# INSTALAR O PACOTE (somente se ainda não instalado)
# install.packages("GetBCBData")

# CARREGAR AS BIBLIOTECAS NECESSÁRIAS
library(GetBCBData)
library(tidyverse)

# DEFINIR O CÓDIGO DA SÉRIE (ex: Dívida líquida SC)
my.id <- c(Dívida_SC = 15552)

# COLETAR OS DADOS
df.bcb <- gbcbd_get_series(
  id = my.id,
  first.date = '2007-12-01',
  last.date = Sys.Date(),
  format.data = 'long',
  use.memoise = TRUE,
  cache.path = tempdir(),
  do.parallel = FALSE
)

# VISUALIZAR ESTRUTURA DO DATAFRAME (opcional)
glimpse(df.bcb)

# CRIAR O GRÁFICO
p <- ggplot(df.bcb, aes(x = ref.date, y = value)) +
  geom_line(color = "#0072B2", size = 1) +  # azul elegante
  geom_point(color = "#D55E00", size = 1, alpha = 0.6) +  # pontos laranja
  labs(
    title = 'Dívida Líquida do Governo de SC (2007 - Atualidade)',
    subtitle = paste0(format(min(df.bcb$ref.date), "%B/%Y"),
                      ' até ',
                      format(max(df.bcb$ref.date), "%B/%Y")),
    x = 'Período',
    y = 'Valor (em Milhões R$)',
    caption = 'Fonte: Banco Central do Brasil - SGS'
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 12, margin = margin(b = 10)),
    axis.title = element_text(face = "bold"),
    panel.grid.minor = element_blank()
  )

# IMPRIMIR O GRÁFICO
print(p)
