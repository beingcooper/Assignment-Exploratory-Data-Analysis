

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mod_data<-split(NEI,NEI$year)

points_x<-unique(NEI$year)

points_y<-sapply(mod_data,function(x){ 
                     temp<-x$Emissions  
                     temp2<-sum(temp)})

points_y<-points_y/1000000

plot(points_x,points_y,pch=19,xlab="Year",ylab="Total PM2.5 emission (in million tons)",
     main="PM 2.5 emission per Year",xlim=c(1998,2008),ylim=c(3,8))
dev.copy(png,file="plot1.png")
dev.off()