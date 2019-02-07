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

plot( x = dat$DNA_Concentration_Ben, y = dat$DNA_Concentration_Katy)
dat$Ben_relative_to_Katy <- dat$DNA_Concentration_Ben - dat$DNA_Concentration_Katy
dat$Year_Collected = as.factor(dat$Year_Collected)
by(dat$Ben_relative_to_Katy, dat$Year_Collected, mean)
min(by(dat$Ben_relative_to_Katy, dat$Year_Collected, mean))
which(dat$Ben_relative_to_Katy == min(by(dat$Ben_relative_to_Katy, dat$Year_Collected, mean)))
dat$Year_Collected[dat$Ben_relative_to_Katy == min(dat$Ben_relative_to_Katy)]

#task 5

dat1 <-  subset(dat, Year_Collected == "2000")
dat2 <-  subset(dat, Year_Collected == "2001")
dat3 <-  subset(dat, Year_Collected == "2002")
dat4 <-  subset(dat, Year_Collected == "2003")
dat5 <-  subset(dat, Year_Collected == "2004")
dat6 <-  subset(dat, Year_Collected == "2005")
dat7 <-  subset(dat, Year_Collected == "2006")
dat8 <-  subset(dat, Year_Collected == "2007")
dat9 <-  subset(dat, Year_Collected == "2008")
dat10 <-  subset(dat, Year_Collected == "2009")
dat11 <-  subset(dat, Year_Collected == "2010")
dat12 <-  subset(dat, Year_Collected == "2011")

ben1 = cbind(mean(dat1$Ben_relative_to_Katy), mean(dat2$Ben_relative_to_Katy), mean(dat3$Ben_relative_to_Katy), mean(dat4$Ben_relative_to_Katy), mean(dat5$Ben_relative_to_Katy), mean(dat6$Ben_relative_to_Katy), mean(dat7$Ben_relative_to_Katy),mean(dat8$Ben_relative_to_Katy), mean(dat9$Ben_relative_to_Katy), mean(dat10$Ben_relative_to_Katy), mean(dat11$Ben_relative_to_Katy)



mean( subset(dat, Year_Collected == "2000"))
