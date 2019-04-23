library(tidyverse)
#Read in Data

dat <- read.table("DNA_Conc_by_Extraction_Date.csv", sep="\t", header=TRUE)

#Task1: Histogram of Ben's Data

hist(dat$DNA_Concentration_Ben,xlab = "DNA Concentration", main = "Ben's DNA Concentrations")

#Task1: Histogram of Katy's Data

hist(dat$DNA_Concentration_Katy, xlab = "DNA Concentration", main = "Katy's DNA Concentrations")


#Task2: Ben's Plot Recreation

boxplot(DNA_Concentration_Ben~Year_Collected,data= dat, main="Ben's Extractions", 
        xlab="YEAR", ylab="DNA Concentration")

#Task2: Katy's Plot Recreation

boxplot(DNA_Concentration_Katy~Year_Collected,data= dat, main="Katy's Extractions", 
        xlab="YEAR", ylab="DNA Concentration")

#Task3: Saving Ben's Plot as JPEG

jpeg('TELFORD_Plot2.jpeg')
boxplot(DNA_Concentration_Ben~Year_Collected,data= dat, main="Ben's Extractions", 
        xlab="YEAR", ylab="DNA Concentration")
dev.off()

#Task3: Saving Katy's Plot as JPEG

jpeg('TELFORD_Plot1.jpeg')
boxplot(DNA_Concentration_Katy~Year_Collected,data= dat, main="Katy's Extractions", 
        xlab="YEAR", ylab="DNA Concentration")
dev.off()

#Task4: Year of Ben's lowest performance relative to Katy's
lowest = dat %>% group_by(Year_Collected) %>%
  summarise(avg.diff = abs(mean(DNA_Concentration_Ben) - mean(DNA_Concentration_Katy)))
lowest %>% filter(avg.diff == min(lowest$avg.diff))

#Task 5:
ben_sub = dat %>% group_by(Year_Collected) %>%
  summarise(Bens_Average = mean(DNA_Concentration_Ben))

#Highest Average DNA Concentration
ben_sub[which(ben_sub$Bens_Average == max(ben_sub$Bens_Average)), ]

