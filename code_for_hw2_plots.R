
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

base = ggplot(data = mydata) 
plot1 = base + 
  aes(x = gear) + 
  geom_bar(fill = "lightgrey") + 
  geom_text(aes(label = ..count..), stat = "count", colour = "blue", size = 10, hjust = 1) +
  coord_flip() +
  labs(
    title = "Count of Cars per GEAR",
    caption = "Source: mtcars data",
    x ="Gear") +
  theme_classic() +
  theme(plot.title = element_text(size = 25, colour = "lightgrey", face = "bold"),
    axis.title.x = element_blank(),
          axis.line.x = element_blank(),
          axis.text.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.title.y = element_text(face = "bold"))
plot1




# save Draft ----------------------------------------------------------
saveRDS(plot1, file = "plot1.rds")


# plot 2 ----------------------------------------------------------

plot2 = base + 
  aes(x = factor(carb)) + 
  geom_bar(fill = "yellow") +
  geom_text(aes(label= ..count..), stat="count", colour = "darkgreen", vjust=-0.1) +
  labs(
    title = "Count of Cars per CARB",
    caption = "Source: mtcars data",
    x='CARB') +
  theme_classic() +
  theme(plot.title = element_text(size = 25, colour = "black", face = "bold"),
        axis.title.y = element_blank(),
        axis.line.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.x = element_text(face = "bold"))

plot2


# save plot2 ----------------------------------------------------------
saveRDS(plot2, file = "plot2.rds")


# plot 3 ----------------------------------------------------------



plot3 = base + 
  aes(x = factor(cyl)) + 
  geom_bar(fill = "yellow") +
  geom_text(aes(label = scales::percent(..count.. / 32)),
            stat = "count", size = 3, fontface = "bold", vjust = 1.6) +
  facet_grid(gear~carb,labeller = label_both) +
  labs(
    title = "Distribution of Cylinder Counts by Carburetors and Gears",
    caption = "Source: mtcars data",
    x = "cylinders",
    y = "count") +
  theme_light()

    
plot3

# save plot3 ----------------------------------------------------------
saveRDS(plot3, file = "plot3.rds")

