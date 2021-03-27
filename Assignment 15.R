library(afex)
library(emmeans)
library(ggplot2)

df1 <- read.csv("Test_data.csv")
df2 <- read.csv("WellBeing_PolAff.csv")

aov.01 = aov_ez(dv = 'WellBeing',
                id = 'ID',
                between = c('PolAff', 'Gender'),
                data = df2)
aov.01

aov.01.cellmeans = emmeans(aov.01, specs = ~ PolAff + Gender)
aov.01.cellmeans

cellMeans.df = data.frame(aov.01.cellmeans)

cellMeans.df

ggplot(data = cellMeans.df, aes(x = PolAff, y = emmean, fill = Gender)) +
  geom_bar(stat 		= 'identity',
           width 		= .5,
           position	= position_dodge(.5),
           color		= 'black') +
  theme_classic() +
  ylab("Average Well-Being") +
  xlab("Political Affiliation") +
  geom_errorbar(aes(ymin = emmean - SE,
                    ymax = emmean + SE),
                width = .2,
                position = position_dodge(.5))


aov.02 = aov_ez(dv = 'NegAff',
                id = 'ID',
                between = c('Sensitivity'),
                within = c('Test'),
                data = df1)
aov.02
  
aov.02.cellmeans = emmeans(aov.02, specs = ~ Test + Sensitivity)
aov.02.cellmeans

cellmeans2.df = data.frame(aov.02.cellmeans)
cellmeans2.df

cellmeans2.df$Test_num = c(1, 3, 2, 1, 3, 2)
cellmeans2.df


ggplot(data = cellmeans2.df, aes(x = Test_num, y = emmean, color = Sensitivity)) +
  geom_point(size = 3.5) +
  geom_line(size = 2)  +
  theme_classic() +
  ylab('Negative Affect') +
  xlab('Test Difficulty') +
  scale_x_continuous( breaks = c(1, 2, 3) ,
                      labels = c('Easy', 'Moderate', 'Hard'),
                      limits = c(1, 3)) +
  theme( axis.title = element_text(size = 20, color = 'black'),
         axis.text = element_text(size = 16, color = 'black')) +
  geom_errorbar(aes(	ymin = emmean - SE,
                     ymax = emmean + SE),
                width = .1)



  