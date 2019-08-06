library(ggplot2)
theme_set(theme_bw(20))

casePlot <- (
	ggplot(sims, aes(x=day, y=cases))
	+ geom_line(aes(color=Symptomatic), size=1.5)
)

print(casePlot+scale_y_log10())
print(casePlot)

infPlot <- (
	ggplot(sims, aes(x=day, y=infections))
	+ geom_line(aes(color=Symptomatic), size=1.5)
)

print(infPlot+scale_y_log10())
print(infPlot)
