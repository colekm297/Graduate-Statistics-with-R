library(tidyverse)
library(dplyr)
library(psych)

Meditation_Data <- read.csv("Meditation_Data.csv")

head(Meditation_Data)

mean(Meditation_Data$MeditationHrs, na.rm = TRUE)
mean(Meditation_Data$Stress, na.rm = TRUE)

median(Meditation_Data$MeditationHrs, na.rm = TRUE)
median(Meditation_Data$Stress, na.rm = TRUE)

mode(Meditation_Data$MeditationHrs, na.rm = TRUE)
mode(Meditation_Data$Stress, na.rm = TRUE)

table(Meditation_Data$MeditationHrs)
table(Meditation_Data$Stress)

var(Meditation_Data$MeditationHrs, na.rm = TRUE)
var(Meditation_Data$Stress, na.rm = TRUE)

sd(Meditation_Data$MeditationHrs, na.rm = TRUE)
sd(Meditation_Data$Stress, na.rm = TRUE)


cor.test(Meditation_Data[,c("MeditationHrs", "Stress")], use = "complete.obs")


cor.test(Meditation_Data$MeditationHrs, Meditation_Data$Stress, use = "complete.obs")


