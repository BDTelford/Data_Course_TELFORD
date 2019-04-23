
# Task 1: loads the mtcars data set
library(datasets)
data("mtcars")
str(mtcars)

# Task 2: subset the mtcars dataframe to include only automatic transmissions
auto = subset(mtcars, am == 0)

# Task 3: saves this new subset as a new file 
#called “automatic_mtcars.csv” in your Assignment_5 directory
write.csv(auto, file = "./automatic_mtcars.csv")

# Task 4: plots the effect of horsepower on miles-per-gallon
# (update plot to have meaningful labels and title)
library(tidyverse)
ggplot(data = mtcars, aes(y = hp, x = mpg)) + xlab("Miles-per-gallon") + ylab("Horsepower") +
  geom_point() + ggtitle("Effect of horsepower on miles-per-gallon") + 
  theme(plot.title = element_text(hjust = 0.5)) + geom_smooth()

#Task 5: saves this plot as a png image called “mpg_vs_hp_auto.png” 
# in your Assignment_5 directory
png('mpg_vs_hp_auto.png')
ggplot(data = mtcars, aes(y = hp, x = mpg)) + xlab("Miles-per-gallon") + ylab("Horsepower") +
  geom_point() + ggtitle("Effect of horsepower on miles-per-gallon") + 
  theme(plot.title = element_text(hjust = 0.5)) + geom_smooth()
dev.off()

# Task 6: plots the effect of weight on miles-per-gallon (with improved labels, again)
ggplot(data = mtcars, aes(y = wt, x = mpg)) + xlab("Miles-per-gallon") + ylab("Weight") +
  geom_point() + ggtitle("Effect of weight on miles-per-gallon") + 
  theme(plot.title = element_text(hjust = 0.5)) + geom_smooth()

#Task 7: saves this second plot as a tiff image called “mpg_vs_wt_auto.tiff” 
#in your Assignment_5 directory
tiff('mpg_vs_wt_auto.tiff')
ggplot(data = mtcars, aes(y = wt, x = mpg)) + xlab("Miles-per-gallon") + ylab("Weight") +
  geom_point() + ggtitle("Effect of weight on miles-per-gallon") + 
  theme(plot.title = element_text(hjust = 0.5)) + geom_smooth()
dev.off()

#Task 8: subsets the original mtcars dataframe to include only cars with displacements 
#less than or equal to 200 cu.in.
dis200 = subset(mtcars, disp <= 200)

#Task 9: saves that new subset as a csv file called mtcars_max200_displ.csv
write.csv(dis200, file = "./mtcars_max200_displ.csv")

#Task 10: includes code to calculate the maximum horsepower for each of the three dataframes 
#(original, automatic,max200)
max(mtcars$hp)
max(auto$hp)
max(dis200$hp)

# Car specs of greatest horsepower
mtcars[which.max(mtcars$hp),]
mtcars[which.max(auto$hp),]
mtcars[which.max(dis200$hp),]

#Task 11: prints these calculations (from task 10) in a readable format to a 
#new plaintext file called hp_maximums.txt
Line1 = "max(mtcars$hp)"
Line2 = "max(auto$hp)"
Line3 = "max(dis200$hp)"

FileName = "hp_maximums.txt"

fileConn<-file(FileName)
writeLines(c(Line1, Line2, Line3), fileConn)
close(fileConn)
