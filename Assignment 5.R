library(afex)

df1 <- read.csv("WellBeing_PolAff.csv")

unique(df1$Gender)
unique(df1$PolAff)

aov.01 <- aov_ez(dv = 'WellBeing',
          id = 'ID',
          between = c('Gender', 'PolAff'),
          data = df1)

summary(aov.01)


