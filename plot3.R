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
require(lubridate)
data$Date_time<-as.POSIXlt(dmy(data$Date)+hms(data$Time))
data<-data[,c(10,3:9)]

View(data)

#Drow and safe plot


png(filename=paste0(filePath,"/","plot3.png"))

lineCol<-c("black","red","blue")
legenD<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")

plot(data[,1],data[,6],type="l",col=lineCol[1], xlab="",
     ylab="Energy sub metering")
lines(data[,1],data[,7],col=lineCol[2])
lines(data[,1],data[,8],col=lineCol[3])

# add legend
legend("topright",legend=legenD,col=lineCol,lty="solid")

x<-dev.off()
