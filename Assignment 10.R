library(afex)

df1 <- read.csv("Test_data.csv")
view(df1)

aov.mixed.01 = aov_ez(dv = 'NegAff',
                      id = 'ID',
                      between = c('Sensitivity'),
                      within = c('Test'),
                      data = df1)
summary(aov.mixed.01$Anova)

