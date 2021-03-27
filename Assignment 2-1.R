df1 = read.csv('salary_data.csv')

cor(df1$salary, df1$no_of_pubs, use = 'pairwise.complete.obs')

cor.test(df1$salary, df1$no_of_pubs, use = 'pairwise.complete.obs')

cor(df1$salary, df1$years_job, use = 'pairwise.complete.obs')

cor.test(df1$salary, df1$years_job, use = 'pairwise.complete.obs')

