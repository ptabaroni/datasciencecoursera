complete <- function(directory, ids = 1:332) {
  monitor<-file.path(directory,paste(formatC(ids,width=3, flag="0"),".csv",sep=""), fsep = "/" )
  id <-NULL
  nobs <-NULL
  for (i in 1:length(monitor))
   {
    ds <- read.csv(monitor[i], header =TRUE, sep=",")
    eval <- nrow(ds[complete.cases(ds),])
    if (eval > 0)
    {
      id<-append(id,ids[[i]])
      nobs<-append(nobs,eval)
    }
  }
#final<-data.frame(id,nobs)
#colnames(final)<-(c("id","nobs"))
#return(final)
return(data.frame(id, nobs))
}