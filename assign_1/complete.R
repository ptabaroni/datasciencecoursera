complete <- function(directory, id = 1:332) {
  monitor<-file.path(directory,paste(formatC(id,width=3, flag="0"),".csv",sep=""), fsep = "/" )
  final_list <- data.frame(id =NULL, nobs=NULL)
  names
  for (i in 1:length(monitor))
   {
    ds <- read.csv(monitor[i], header =TRUE, sep=",")
    eval <- nrow(ds[complete.cases(ds),])  #numero per nobs
   print (id[i])  #numero per id
    #buffer<- append(mean_fin, ds[[pollutant]])
#> final_list <- data.frame(id=numeric(0),nobs=numeric(0)) #crea il df vuoto
#> colnames(final_list)<-c("id","nobs") #rinomina le cols (meglio alla fine?)
#> final_list<-rbind(final_list, c(id=8,nobs=106))  #
#> final_list<-rbind(final_list, c(id=1,nobs=102))
#> http://stackoverflow.com/questions/14620972/how-to-combine-two-vectors-into-a-data-frame #meglio magari
  }
  #round(mean(mean_fin,na.rm=TRUE),3)
}