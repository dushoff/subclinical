library(deSolve) 

symPars <- makePars(base, R0, 1)
asymPars <- makePars(base, R0, sympProp)

print(symPars)
print(asymPars)

symsim <- runModel(init1, days, symPars)
symsim$Symptomatic <- paste(round(100*symPars['symp']), "%", sep="")

asymsim <- runModel(init1, days, asymPars)
asymsim$Symptomatic <- paste(round(100*asymPars['symp']), "%", sep="")

sims <- rbind(symsim, asymsim)
print(summary(sims))
