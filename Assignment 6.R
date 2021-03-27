library('afex')
library(emmeans)

df1 <- read.csv("Alc_data.csv")


model.01.aov = aov_ez(dv = 'Drinks',
                      between = c('Condition', 'Marital_Status'),
                      id = 'ID',
                      data = df1)
summary(model.01.aov)


marital_means = emmeans(model.01.aov, 'Marital_Status')

pairs(marital_means)


cell_means = emmeans(model.01.aov, c('Marital_Status', 'Condition'))
cell_means

pairs(cell_means)
