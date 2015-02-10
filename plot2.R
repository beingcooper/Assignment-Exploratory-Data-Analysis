

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

fac<-c(NEI$fips==24510)
mod_NEI<-NEI[fac,]
mod_data<-split(mod_NEI,mod_NEI$year)

points_x<-unique(mod_NEI$year)

points_y<-sapply(mod_data,function(x){ 
  temp<-x$Emissions  
  temp2<-sum(temp)})

points_y<-points_y/1000

plot(points_x,points_y,pch=19,xlab="Year",ylab="Total PM2.5 emission (in tons) / 1000 ",
     main="PM 2.5 emission per Year in Baltimore City",xlim=c(1998,2008),ylim=c(1.5,4))
dev.copy(png,file="plot2.png")
dev.off()