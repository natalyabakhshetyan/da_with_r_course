library('ggplot2')
data('faithful')

# histogram
qplot(x=waiting,
      data=faithful,
      binwidth=3,
      main = 'Waiting time to next eruption (min)')

ggplot(faithful, aes(x=waiting)) + geom_histogram(binwidth = 1)


data("mtcars")
data('mpg')

library('GGally')

plot(mtcars$hp,
     mtcars$mpg,
     pch = mtcars$am,
     xlab = "horsepower",
     cex = 1.2,
     ylab = "miles per gallon",
     main = "mpg vs hp by transmission")
legend("topright", c("automatic", "manual"), pch = c(0,1))


qplot(x = wt,
      y = mpg,
      data = mtcars,
      size = cyl,
      main = "MPG vs weight (x1000 lbs) by cylinder")

qplot(disp,
      mpg,
      data = mtcars,
      main = "MPG vs Eng. Displacement") + stat_smooth(
        method = "loess",
        defree = 0,
        span = 0.2,
        se = TRUE
      )


# facets

# first create new columns with descriptive values
mtcars$amf[mtcars$am == 0] = 'automatic'
mtcars$amf[mtcars$am == 1] = 'manual'
mtcars$vsf[mtcars$vs == 0] = 'flat'
mtcars$vsf[mtcars$vs == 1] = 'V-shape'

qplot(x = wt,
      y = mpg,
      facets = .~amf,
      data = mtcars,
      main = "MPG vs weight by transmission")


qplot(x = wt,
      y = mpg,
      facets = vsf~.,
      data = mtcars,
      main = "MPG vs weight by engine")


qplot(x = wt,
      y = mpg,
      facets = vsf~amf,
      data = mtcars,
      main = "MPG vs weight by transmission and engine")


DF = mpg[,c('cty', 'hwy', 'displ')]

library(GGally)
ggpairs(DF)


# Contour plots
x_grid = seq(-1, 1, length.out = 100)
y_grid = x_grid
R = expand.grid(x_grid, y_grid)
names(R) = c('x', 'y')
R$z = R$x^2 + R$y^2
ggplot(R, aes(x=x, y=y, z=z)) + stat_contour()


# Box Plot
ggplot(mpg,
       aes("", hwy)) + geom_boxplot() + coord_flip() + scale_x_discrete("")

ggplot(mpg,
       aes(reorder(class, 
                   -hwy, 
                   median), hwy)) + geom_boxplot() + coord_flip() + scale_x_discrete()

# QQPlot
D = data.frame(samples = c(rnorm(200, 1, 1),
                           rnorm(200, 0, 1),
                           rnorm(200, 0, 2)))

D$parameter[1:200] = 'N(1,1)';
D$parameter[201:400] = 'N(0,1)';
D$parameter[401:600] = 'N(0,2)';

qplot(samples,
      facets = parameter~.,
      geom = 'histogram',
      data = D)


ggplot(D, aes(sample=samples)) +
  stat_qq() +
  facet_grid(.~parameter)
