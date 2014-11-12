pollutantmean <- function(directory, pollutant, id = 1:332) {
  monitor<-file.path(directory,paste(formatC(id,width=3, flag="0"),".csv",sep=""), fsep = "/" )
  ds <- lapply(monitor, read.csv)
  #result <-mean(ds[[pollutant]],na.rm = TRUE)
  #result
  monitor
  
#  mean_fin= rep(NA,length(id)) #vector di NA in cui verranno salvate le medie per monitor
#    for(i in id ){
#      infile<-file.path(directory,paste(formatC(id,width=3, flag="0"),".csv",sep=""), fsep = "/" ) #genera il path dei monitor
#      ds <- read.csv(infile,header = TRUE,sep=",") #csv->dataframe
#      mean_fin[i]<-mean(ds[[pollutant]],na.rm = TRUE) #store della media
#  }
#  mean(mean_fin,na.rm=TRUE)
 
}