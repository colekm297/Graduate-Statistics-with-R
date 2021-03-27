library(afex)

df1 <- read.csv("HR_data (1).csv")

aov.01 = aov_ez(dv = 'HR',
                id = 'ID',
                within = c('Partner', 'Task'),
                data = df1)

summary(aov.01$Anova)



emmeans(aov.01, specs = "Task")



