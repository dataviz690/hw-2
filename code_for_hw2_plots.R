
# clean memory ------------------------------------------------------------
rm(list = ls())


# read in data ------------------------------------------------------------
#set working directory

filename=mtcars
mydata= filename


# see data ----------------------------------------------------------


head(mydata)


# see data types ----------------------------------------------------------

str(mydata)


# plot 1 ----------------------------------------------------------
library(ggplot2)

base= ggplot(data=mydata) 
plot1= base + 
  aes(x=gear) + 
  geom_bar() + 
  coord_flip() +
  theme(axis.title.x = element_blank(),
          axis.line.x = element_blank(),
          axis.text.x = element_blank(),
          axis.ticks.x = element_blank())
plot1




# save Draft ----------------------------------------------------------
saveRDS(plot1, file = "plot1.rds")


# plot 2 ----------------------------------------------------------

plot2= base + aes(x=factor(carb))+ geom_bar()
plot2


# save plot2 ----------------------------------------------------------
saveRDS(plot2, file = "plot2.rds")


# plot 3 ----------------------------------------------------------

plot3= base + aes(x=cyl) + geom_bar() + facet_grid(gear~carb,labeller = label_both)
plot3

# save plot3 ----------------------------------------------------------
saveRDS(plot3, file = "plot3.rds")

