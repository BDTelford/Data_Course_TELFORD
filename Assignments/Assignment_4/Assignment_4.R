# Read in the data
df = read.csv("../..//Data/ITS_mapping.csv", sep ="\t")

#Explore the Data
summary(df)
class(df$Ecosystem)
class(df$Lat)
summary(df$Ecosystem)

#Box plot of ecosystem and Lat
boxplot(Lat~Ecosystem,data= df, main="Ecosystem & Lat", xlab="Ecosystem", ylab="Lat")

#Saving png of Boxplot
png(filename = "./silly_boxplot.png")
boxplot(Lat~Ecosystem,data= df, main="Ecosystem & Lat", xlab="Ecosystem", ylab="Lat")
dev.off()