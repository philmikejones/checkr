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
# philmikejones.net/



# Libraries ====
install.packages("sjPlot", "ggplot2")
library(sjPlot); library(ggplot2)

# Load data ====
lcfs <- 
  sji.SPSS("UKDA-7216-spss/spss/spss14/lcf_2010_teaching_dataset_dvhh_final_july_v2.sav")

# View data frame and value labels ====
View(lcfs)
sji.viewSPSS(lcfs)



# Regression model ====
m1 <- lm(lcfs$P550tpr ~ lcfs$P344pr)
summary(m1)

ggplot(lcfs, aes(P344pr, P550tpr)) + 
  geom_point() + 
  geom_smooth(method = lm) +
  xlab("Gross normal weekly household income (P344pr)") +
  ylab("Total expenditure (P550tpr)")
