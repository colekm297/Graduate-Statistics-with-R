

df1 <- read.csv("HR_Data.csv")
t.test(HR ~ Meditation, df1)

install.packages("effsize")
library(effsize)

cohen.d(df1$HR, df1$Meditation,
        paired = FALSE,
        na.rm = TRUE)

sd(df1$HR, na.rm = TRUE)



df2 <- read.csv("RT_Data.csv")
t.test(df2$Pre_RT, df2$Post_RT, paired = TRUE, data = df2)

cohen.d(df2$Post_RT, df2$Pre_RT,
        paired = TRUE,
        na.rm = TRUE)

meandiff <- mean(df2$Post_RT - df2$Pre_RT, na.rm = TRUE)



