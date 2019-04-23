# Load packages
library(modelr)
library(broom)
library(dplyr)
library(fitdistrplus)
library(tidyverse)

# Read Data in
df = read.csv("../../Data/mushroom_growth.csv")

#creates several plots exploring relationships between the response and predictors
glimpse(df)

#Relationship between GrowthRate and light
ggplot(df, aes(x = Light, y = GrowthRate)) +
  geom_point() +
  geom_smooth(method = "lm")

#Relationship between GrowthRate and Nitrogen
ggplot(df, aes(x = Nitrogen, y = GrowthRate)) +
  geom_point() +
  geom_smooth()

#Relationship between GrowthRate and Humidity
ggplot(df, aes(x = Humidity, y = GrowthRate)) +
  geom_point() 

#Relationship between GrowthRate and Temperature
ggplot(df, aes(x = Temperature, y = GrowthRate)) +
  geom_point() +
  geom_smooth()

#defines at least 2 models that explain the dependent variable “GrowthRate”
#– One must be a lm() and
#– one must be an aov()
mod1 = lm(GrowthRate ~ Light , data = df)

summary(mod1)

plot(df$GrowthRate ~ df$Light)
abline(mod1, col="Blue")

mean(mod1$residuals^2)

mod2 = aov(GrowthRate ~ Nitrogen, data = df)

summary(mod2)

plot(df$GrowthRate ~ df$Nitrogen)
abline(mod2, col="Blue")

mean(mod2$residuals^2)

mod3 = loess(GrowthRate ~ Nitrogen, data = df)
summary(mod3)
pred = predict(loess(GrowthRate ~ Nitrogen, data = df))
ggplot(df, aes(x = Nitrogen, y = GrowthRate)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  geom_point(aes(y=pred), color = "Red")
mean(mod3$residuals^2)

# selects the best model you tried
meansq_mod1 = mean(mod1$residuals^2)
meansq_mod2 = mean(mod2$residuals^2)
meansq_mod3 = mean(mod3$residuals^2)
newdf = data.frame(meansq_mod1, meansq_mod2, meansq_mod3)
new_long = gather(newdf,key = Model, value = Mean, c(1:3))
new_long$Model[new_long$Mean == min(new_long$Mean)]

#adds predictions based on new values for the independent variables used in your model
preds = add_predictions(df, mod1)

#plots these predictions alongside the real data
ggplot(preds, aes(x = Light, y = GrowthRate)) +
  geom_point() +
  geom_point(aes(y= pred), color = "Red")
