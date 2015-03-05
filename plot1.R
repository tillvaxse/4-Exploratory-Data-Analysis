#Initial data
filePath<-"./data/ExpData"
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName<-"data.zip"

#Download data
if(!file.exists(filePath)){dir.create(filePath)}
if(!file.exists(paste0(filePath,"/",fileName))){
download.file(fileUrl,destfile=paste0(filePath,"/",fileName),mode="wb")
unzip(paste0(filePath,"/",fileName),exdir=filePath)
unzip(paste0(filePath,"/",fileName),list=TRUE)}
dataName<-"household_power_consumption.txt"

#Read necessary data
data<-read.table(paste0(filePath,"/",dataName),
                 header=FALSE,nrow=2880,skip=66637,sep=";")
names(data)<-names(read.table(paste0(filePath,"/",dataName),
                              header=TRUE,nrow=1,skip=0,sep=";"))
View(data)

#Drow and safe plot
hist(data[,3],col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
png(filename=paste0(filePath,"/","plot1.png"))
dev.off()
