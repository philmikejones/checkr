# Load data ====
lcfs <- 
  sji.SPSS("UKDA-7216-spss/spss/spss14/lcf_2010_teaching_dataset_dvhh_final_july_v2.sav")

# View data frame and value labels ====
View(lcfs)
sji.viewSPSS(lcfs)



# Regression model ====
m1 <- lm(lcfs$P550tpr ~ lcfs$P344pr)
summary(m1)



# Diagnostics ====
# Linear relationship
ggplot(lcfs, aes(P344pr, P550tpr)) + 
  geom_point() + 
  geom_smooth(method = lm) +
  xlab("Gross normal weekly household income (P344pr)") +
  ylab("Total expenditure (P550tpr)")

# Residuals are independent
# Not tested statistically

# Residuals normally distributed
ggplot() + geom_density(aes(residuals(m1)))  # density plot
qqPlot(m1)  # qq plot

# Homoscedasticity
# (variance of residuals doesn't differ by predicted values)
spreadLevelPlot(m1)



# Outliers ====
# Cook's Distance
plot(m1, which = 4)

# Leverage (hat) values
lev <- hatvalues(m1)
plot(lev)
# Run the following two lines of code if you need to identify outliers:
# out <- identify(lev)
# View(lcfs[out, ])
