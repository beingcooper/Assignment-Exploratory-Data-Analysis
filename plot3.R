NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

fac<-c(NEI$fips==24510)
mod_NEI<-NEI[fac,]

mod_data<-split(mod_NEI,mod_NEI$year)

points_x<-c(rep(1999,4),rep(2002,4),rep(2005,4),rep(2008,4))
type<-as.factor(rep(sort(unique(mod_NEI$type)),4))


plot_points<-sapply(mod_data,function(x){ 
  
  type_mod<-split(x,x$type)
  sapply(type_mod,function(y){
    temp<-y$Emissions  
    temp2<-sum(temp)
     
  })
  })

  emission<-c()
  for( j in 1:4)
  {
   for(i in 1:4)
   {
     emission<-c(emission,plot_points[i,j])
   }
  }
pm<-data.frame(points_x,emission,type)
qplot(points_x,emission,data=pm,col=type,geom=c("point","smooth"),main="PM 2.5 emission per year (in tons)
      in Baltimore city by different Sources",xlab="Year",ylab="Total PM 2.5 emission (in tons)")

dev.copy(png,file="plot3.png")
dev.off()

