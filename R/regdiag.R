
# Residuals are independent
# Not tested statistically

# Residuals normally distributed
# ggplot() + geom_density(aes(residuals(m1)))  # density plot
# qqPlot(m1)  # qq plot

# Homoscedasticity
# (variance of residuals doesn't differ by predicted values)
# spreadLevelPlot(m1)



# Outliers ====
# Cook's Distance
# plot(m1, which = 4)

# Leverage (hat) values
# lev <- hatvalues(m1)
# plot(lev)
# Run the following two lines of code if you need to identify outliers:
# out <- identify(lev)
# View(lcfs[out, ])
