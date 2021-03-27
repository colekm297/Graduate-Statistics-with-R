library(afex)
library(emmeans)

df1 <- read.csv("HR_data (1).csv")


aov.01 = aov_ez(dv = 'HR',
                id = 'ID',
                within = c('Partner', 'Task'),
                data = df1)

summary(aov.01$Anova)

aov.01_mean_partner = emmeans(aov.01, ~ Partner)
summary(aov.01_mean_partner)

pairs(aov.01_mean_partner)



aov.01_cell_means = emmeans(aov.01, specs = c('Partner', 'Task'))
summary(aov.01_cell_means)


pairs(aov.01_cell_means)



