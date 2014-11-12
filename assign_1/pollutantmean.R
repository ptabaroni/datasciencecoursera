pollutantmean <- function(directory, pollutant, id = 1:332) {
  monitor<-file.path(directory,paste(formatC(id,width=3, flag="0"),".csv",sep=""), fsep = "/" )
  mean_fin <-NULL 
  for (i in 1:length(monitor))
  {
    ds <- read.csv(monitor[i], header =TRUE, sep=",")
    mean_fin<- append(mean_fin, ds[[pollutant]])
  }
round(mean(mean_fin,na.rm=TRUE),3)
}