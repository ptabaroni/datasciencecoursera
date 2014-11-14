corr <- function(directory, threshold = 0) {
  valid <- complete(directory)
  mask<-subset(valid,nobs>threshold)
  selection<- mask$id
  ans<-numeric()
  if (length(selection)>0)
  {
  monitor<-file.path(directory,paste(formatC(selection,width=3, flag="0"),".csv",sep=""), fsep = "/" )
  
  for (i in 1:length(monitor))
  {
    ds <- read.csv(monitor[i], header =TRUE, sep=",")
    a<-ds[["sulfate"]]
    b<-ds[["nitrate"]]
    ans <-append(ans, cor(a,b,use="pairwise.complete.obs"))
  }
}
ans

}