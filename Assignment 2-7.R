
df1 = read.csv("wellBeing(1).csv")

df1$jobSat_c = df1$jobSat - mean(df1$jobSat, na.rm = TRUE)

df1$stress_c = df1$stress - mean(df1$stress, na.rm = TRUE)

df1$jobSat_c_by_stress_c = df1$jobSat_c * df1$stress_c


model.01 = lm(wellBeing ~ 1 + jobSat_c + stress_c + jobSat_c_by_stress_c,
              data = df1,
              na.action = na.exclude)
summary(model.01)

sd(data$jobSat, na.rm = TRUE)
sd(data$stress, na.rm = TRUE)  


pred_data = data.frame( jobSat_c = c(-1.010, +1.010, -1.010, +1.010),
                        stress_c = c(-0.968, -0.968, +0.968, +0.968),
                        
                        jobSat_label = c('Low', 'High', 'Low', 'High'),
                        stress_label = c('Low', 'Low', 'High', 'High'))


pred_data$jobSat_c_by_stress_c = pred_data$jobSat_c * pred_data$stress_c

pred_data$pred_value = predict(model.01, pred_data)



ggplot(data = pred_data,
       aes(x = jobSat_c, 
           y = pred_value,
           color = stress_label)) +
  geom_line(size = 1.5) +
  theme_classic() +
  xlab("Job Satisfaction") +
  ylab("Predicted Well-Being") +
  labs(color = "Stress") +
  scale_x_continuous(breaks = c(-1.01, 1.01),
  labels = c("Low", "High")) +
  ggtitle('Predicted Well-Being at Different Levels of Stress and Job Satisfaction') +
  theme(axis.title = element_text(size = 20, color = 'black'),
        axis.text  = element_text(size = 16, color = 'black'))



