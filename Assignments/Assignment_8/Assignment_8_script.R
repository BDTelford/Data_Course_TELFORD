#Read in libraries
library(glmulti)
library(modelr)
library(broom)
library(dplyr)
library(fitdistrplus)
library(tidyverse)
library(reshape2)

# Read in Data
 df = read.csv("./GradSchool_Admissions.csv")

 #Relationship between rank and admit
 ggplot(df, aes(x = rank, y = admit)) +
   geom_point() +
   geom_smooth(method = "lm") + xlab("Rank") + ylab("Admit") +
   labs(title = "Addmission into Gradschool",
        subtitle = "Relationship between rank and admittance")
 
 #Relationship between admit and gpa
 ggplot(df, aes(x = gpa, y = admit)) +
   geom_point() +
   geom_smooth(method = "lm") + xlab("GPA") + ylab("Admit") +
   labs(title = "Addmission into Gradschool",
        subtitle = "Relationship between GPA and admittance")
 
 #Relationship between gre and admit
 ggplot(df, aes(x = gre, y = admit)) +
   geom_point() +
   geom_smooth(method = "lm") + xlab("GRE") + ylab("Admit") +
   labs(title = "Addmission into Gradschool",
        subtitle = "Relationship between GRE and admittance")
 
# Determines the Best Model
prednames = names(df)[2:4] 
 g1 <- glmulti("admit",xr=prednames,data=df,level=1)
 print(g1)
 plot(g1)
 plot(g1, type="s")
 
 #adds predictions
 pred = predict(loess(admit ~ gre +gpa + rank, data = df))
 df$prediction = pred

 dfs = df[,c(1,4,5)]
 dd = melt(dfs, id=c("rank"))
 
 

ggplot(dd, aes(x=rank, y=value, colour=variable)) + geom_point() + 
  geom_smooth( se = FALSE) +
   scale_colour_manual(values=c("black", "red"), name = "Data Type") + xlab("Rank") + 
  ylab("Admit (1 = yes, 0 = no)") +
  labs(title = "Addmission into Gradschool",
       subtitle = "Colored by actual/prediction")
   

