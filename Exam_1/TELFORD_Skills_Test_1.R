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

datr = by(dat$Ben_relative_to_Katy, dat$Year_Collected, mean)
daty = c(2001,2002, 2003, 2004, 2005, 2006 ,2007,2008, 2009, 2010, 2011,2012 )
datd = cbind(daty,datr)
datg = [,datd$datr]
summary(datd)
max(datr)

