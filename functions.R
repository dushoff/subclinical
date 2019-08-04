seirModel <- function(t,y,params){
	with(c(as.list(y),params), {
		N <- S + E + I + R
		T <- beta*S*I/N 

		dS <- -T
		dE <- T - sigma*E 
		dI <- symp*sigma*E - gamma*I
		dR <- gamma*(1-cfr)*I + (1-symp)*sigma*E

		dDead <- gamma*cfr*I
		dCases <- symp*sigma*E 
		dInfections <- sigma*E

		return(list(c(
			dS=dS,dE=dE,dI=dI,dR=dR,
			dDead=dDead, dCases=dCases, dInfections=dInfections
		)))
	})
}

beta.calc<-function(Ro,params) { 
    with(as.list(params),
    		 Ro*gamma/symp
)}

makePars <- function(base, R0, symp){
	base['symp'] <- symp
	base['beta'] <- beta.calc(R0, base)
	return(base)
}

runModel <- function(inits, days, params){
	tc <- data.frame(lsoda(
		inits, days, seirModel, params
	))  
	tc$N <-  rowSums(tc[,c('S','E','I','R')]) 
	names(tc)[[1]] <- "day"

	return(tc)
}

incfun <- function(sim){
	simweek <- subset(sim, day%%7==0)
	inc <- with(simweek, {data.frame(
		week = day[-1]/7
		, cases = cases[-1]-cases[-length(cases)]
		, infections = infections[-1]-infections[-length(infections)]
		, Symptomatic=Symptomatic[-1]
	)})
	inc <- within(inc, {weekEnd <- as.Date(start)+7*week})
	return(inc)
}
