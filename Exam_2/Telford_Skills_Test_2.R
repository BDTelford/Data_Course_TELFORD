#Read in Libraries

library(tidyverse)
library(modelr)

#1.  Read in salaries.csv
df = read.csv("./salaries.csv")

#2.  Convert to usable tidy format so we can look at "Salary" as a dependent variable 

df1 = gather(df, key = "Rank", value = "Salary", c(5:7))

#3. Create boxplot of salary by University Tier, colored by Faculty Rank (10 points)
#x-axis = Tier
#y-axis = Salary
#Boxplot fill color = Rank
#Title = "Faculty Salaries - 1995"

ggplot(df1, aes(x=Tier, y= Salary, color = Rank)) + ggtitle("Faculty Salaries - 1995") +
  geom_boxplot(outlier.colour="black", outlier.shape=16,
               outlier.size=2, notch=FALSE) 
  
#4.  Export this delightful boxplot to a file named "LASTNAME_exam2_plot1.jpeg" (10 points)
jpeg('TELFORD_exam2_plot1.jpeg')
ggplot(df1, aes(x=Tier, y= Salary, color = Rank)) + ggtitle("Faculty Salaries - 1995") +
  geom_boxplot(outlier.colour="black", outlier.shape=16,
               outlier.size=2, notch=FALSE) 
dev.off()

#II. Linear modeling and predictions#

# 1.  Read in atmosphere.csv (pretty clean data set)
        
data = read.csv("./atmosphere.csv")

#2.  Create two different linear models with Diversity as the dependent variable. 
#The second model should have the same terms as the first, but an additional one or 
#two terms as well. (10 points)
mod1 = lm(Diversity ~ Aerosol_Density , data = data)

summary(mod1)

plot(data$Diversity ~ data$Aerosol_Density)
abline(mod1, col="Blue")

mean(mod1$residuals^2)

mod2 = aov(Diversity ~ Aerosol_Density*Precip, data = data)

summary(mod2)


mean(mod2$residuals^2)

#3.  Compare the residuals of the two models and document which has better explanatory power 
#for the data (10 points)
meansq_mod1 = mean(mod1$residuals^2)
meansq_mod2 = mean(mod2$residuals^2)

newdf = data.frame(meansq_mod1, meansq_mod2)
new_long = gather(newdf,key = Model, value = Mean, c(1:2))
new_long$Model[new_long$Mean == min(new_long$Mean)]

#Use these both models to predict Diversity values in the data set (10 points)
pred1 = add_predictions(data, mod1, var = "Model_1")
preds = add_predictions(pred1, mod2, var = "Model_2")

#Make a plot showing actual Diversity values, along with the two models' predicted 
#Diversity values.Use color or some other aesthetic to differentiate the actual values 
#and both predictions (10 points)
ggplot(preds, aes(x = Aerosol_Density, y = Diversity)) +
  geom_point() +
  geom_point(aes(y= Model_1), color = "Red") +
  geom_point(aes(y= Model_2), color = "Blue")

#Write code to show the predicted values of Diversity for each model using the
#hypothetical data found in hyp_data.csv (10 points)
dat = read.csv("./hyp_data.csv")
datpred1 = add_predictions(dat, mod1, var = "Model_1")
datpreds = add_predictions(datpred1, mod2, var = "Model_2")

ggplot(datpreds, aes(x = Aerosol_Density, y = Model_2)) +
  geom_point() +
  geom_point(aes(y= Model_1), color = "Red") 

#Export a text file that contains the summary output from *both* 
#your models to "model_summaries.txt" (10 points)
s <- summary(mod1)
t <- summary(mod2)

capture.output(s, file = "model_summaries.txt", append = TRUE)
capture.output(t, file = "model_summaries.txt", append = TRUE)

#Add these predicted values (from hypothetical data - Part II, Step 6) to a plot of 
#actual data and differentiate them by color. (10 bonus points possible for a pretty graph)

ggplot() +
  geom_point(data=preds, aes(x = Aerosol_Density, y = Diversity), color='black') + 
  geom_point(data=datpreds, aes(x = Aerosol_Density, y = Model_2), color='red') + 
  geom_point(data=datpreds, aes(x = Aerosol_Density, y = Model_1), color='blue') 
