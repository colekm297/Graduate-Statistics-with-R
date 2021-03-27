library(afex)
library(emmeans)

df1 <- read.csv("Alc_data (1).csv")

model.aov01 = aov_ez(dv = 'Drinks',
                     id = 'ID',
                     between = c('Condition', 'Marital_Status'),
                     data = df1)

summary(model.aov01)

model.aov01.cell.means = emmeans(model.aov01, specs = c('Marital_Status', 'Condition'))
model.aov01.cell.means


contrast_coeff = list(
  H1 = c(0, 0, 1, 0, 0, -1),
  H2 = c(1, 0, -1, -1, 0, 1),
  H3 = c(0, 1, -1, 0, -1, 1)
)

contrast(model.aov01.cell.means, contrast_coeff, adjust = 'none')


