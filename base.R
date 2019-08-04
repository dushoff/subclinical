R0 <- 1.9
N0 <- 1*10^6 
sympProp <- 0.5
days<-seq(0, 420, 1) 
start<-"2014-3-1"

init1 <- c(
	S = N0-1, E = 0, I = 1, R = 0
	, dead = 0, cases = 1, infections = 1
)
days<-seq(0,420,1) 

base <-c( 
	N0=N0,
	sigma=1/9.1, 
	gamma=1/6, 
	cfr = .723
) 
