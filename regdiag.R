# Regression Diagnostics in R

# License ====
# Regdiag - regression diagnostics in R.
# Copyright (C) 2014 Phil Mike Jones (ORDIC: 0000-0001-5173-3245)
# 
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program. If not, see <http://www.gnu.org/licenses/>.
# 
# philmikejones.net or github.com/philmikejones

# Data file license ====
# The data file is licensed under the Open Government License:
# http://discover.ukdataservice.ac.uk/catalogue?sn=7216#administrative



# Introduction ====
# This file performs regression diagnostics in R (something I've found difficult
# to implement) using the Living Costs and Food Survey 2010. This is a teaching
# dataset provided by the UK Data Service:
# http://discover.ukdataservice.ac.uk/catalogue/?sn=7216

# The instructions and companion blog article are here:
#  http://www.philmikejones.net/regression-diagnostics-with-r/



# Libraries ====
# Uncomment 'install.packages...' lines if you get errors using libraries
# install.packages("sjPlot")
# install.packages("ggplot2")
# install.packages("car")
library(sjPlot); library(ggplot2); library(car)

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
