df1 = read.csv("salary_data.csv")

model.01 = lm(salary ~ 1 + no_of_pubs, 
              data = df1,
              na.action = na.exclude)

summary(model.01)

install.packages('psychometric', repos = 'https://cran.r-project.org')
library(psychometric)

CI.Rsqlm(model.01)



