rmse<- function(y,yp){
  t=sqrt(sum(y-yp)*2/length(y))
  t
  avgy<-mean(y)
  avgyp<-mean(yp)
  c(avgy,avgyp,t)
}