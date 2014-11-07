funzione <- function(){
  x <-rnorm(10000)
  mean(x)
}
seconda <- function(x){
  x+rnorm(length(x))
}