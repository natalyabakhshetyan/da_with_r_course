getwd()
setwd('/home/nata/Documents/Github/da_with_r_course/lesson2')

reddit <- read.csv('reddit.csv')

table(reddit$employment.status)

str(reddit)


library(ggplot2)
qplot(data = reddit, x = age.range)


# Setting Levels of Ordered Factors

reddit$age.range <- ordered(reddit$age.range, levels = c('Under 18', '18-24', 
                                                         '25-34', '35-44',
                                                         '45-54', '55-64',
                                                         '65 or Above'))
qplot(data = reddit, x = age.range)


