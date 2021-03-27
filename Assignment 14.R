library(afex)
library(emmeans)

df1 <- read.csv("Test_data.csv")

aov.01 = aov_ez(dv = 'NegAff',
                id = 'ID',
                within = c('Test'),
                between = c('Sensitivity'),
                data = df1)
aov.01

aov.01.cellmeans = emmeans(aov.01, specs = c('Test', 'Sensitivity'))
aov.01.cellmeans

mycontrasts = list(
  H1 = c(+.33, +.33, +.33, -.33, -.33, -.33),
  H2 = c(+1, 0, -1, -1, 0, +1),
  H3 = c(0, -1, +1, 0, +1, -1)
)

mycontrasts

contrast(aov.01.cellmeans, mycontrasts, adj = 'none')
