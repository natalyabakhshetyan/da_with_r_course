library(ggplot2movies) 
data(movies)

library(plyr)  
data(baseball)
data(ozone)

library(ggplot2)  
data(diamonds)


library("robustHD")

mean(movies$budget)

#mean avg budget, remove missing values
mean(movies$budget, na.rm = TRUE)

# frequency of missing budget
mean(is.na(movies$budget))

# returns a dataset with all missing data removed
moviesNoNa = na.omit(movies)

# plot
qplot(rating, budget, data=moviesNoNa, size = (1.2))+
  stat_smooth(color='red', size = (2), se = F)


