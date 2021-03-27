install.packages("afex", dependencies = TRUE)
install.packages('openxlsx')
install.packages('emmeans')
library(emmeans)
library('afex')



df1 <- read.csv("WellBeing_PolAff.csv")

aov.01 = aov_ez(id = 'ID',
                dv = 'WellBeing',
                between = c('PolAff'),
                data = df1)

summary(aov.01)

aov.01.means = emmeans(aov.01, ~ PolAff)

summary(aov.01.means)

pairs(aov.01.means)
