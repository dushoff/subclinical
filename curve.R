par(cex=1.6)
O <- ansatz(R, S)

bfun <- function(R, O, logscale){
	plot(R, O
		, type="l"
		, log=logscale
		, ylim=c(min(O), S)
		, ylab="Expected outbreak size"
	)
	abline(h=S, lty=3)
}

bfun(R, O, "xy")

bfun(R, O, "xy")
curve(pmax(1/(1-x), 0), add=TRUE, col="blue")
curve(pmax(S*(x-1)/x, 0), add=TRUE, col="blue")

bfun(R, O, "x")
curve(pmax(1/(1-x), 0), add=TRUE, col="blue")
curve(pmax(S*(x-1)/x, 0), add=TRUE, col="blue")
