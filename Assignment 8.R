library(afex)

df1 <- read.csv("Score_data.csv")

aov.01 = aov_ez(dv = 'Score',
                between = c('Condition'),
                id = 'ID',
                data = df1)
summary(aov.01)

aov.02 = aov_ez(dv = 'Score',
                between = c('Condition'),
                covariate = 'Belief',
                id = 'ID',
                factorize = FALSE,
                data = df1)
summary(aov.02)
