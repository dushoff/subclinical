ansatz <- function(R, S){
	sr <- S*(R-1)
	return(
		(sr+sqrt(sr^2+4*R*S))/(2*R)
	)
}
