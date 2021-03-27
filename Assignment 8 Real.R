library(afex)

df1 <- read.csv("HR_data (1).csv")

model.01.aov = aov_ez(dv = 'HR',
                      id = 'ID',
                      within = c('Partner'),
                      data = df1)

summary(model.01.aov)
