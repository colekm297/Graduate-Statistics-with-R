df1 = read.csv("wellBeing(1).csv")

df1$jobSat_MC = df1$jobSat - mean(df1$jobSat, na.rm = TRUE)

df1$stress_MC = df1$stress - mean(df1$stress, na.rm = TRUE)

df1$jobSat_MC_by_stress_MC = df1$jobSat_MC * df1$stress_MC


model.01 = lm(wellBeing ~ 1 + jobSat_MC + stress_MC + jobSat_MC_by_stress_MC,
              data = df1,
              na.action = na.exclude)
summary(model.01)

df1$stress_low = df1$stress - (mean(df1$stress, na.rm = TRUE) - sd(df1$stress, na.rm = TRUE))

df1$stress_low_BY_jobSat_MC = df1$stress_low * df1$jobSat_MC


model.02 = lm(wellBeing ~ 1 + jobSat_MC + stress_low + stress_low_BY_jobSat_MC,
              data = df1,
              na.action = na.exclude)

summary(model.02)

df1$stress_high = df1$stress - (mean(df1$stress, na.rm = TRUE) + sd(df1$stress, na.rm = TRUE))

df1$stress_high_BY_jobSat_MC = df1$stress_high * df1$jobSat_MC

model.03 = lm(wellBeing ~ 1 + jobSat_MC + stress_high + stress_high_BY_jobSat_MC,
              data = df1,
              na.action = na.exclude)
summary(model.03)

