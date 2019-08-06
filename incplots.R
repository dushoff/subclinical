library(ggplot2)
theme_set(theme_bw(20))

casePlot <- (
	ggplot(incs, aes(x=weekEnd, y=cases))
	+ geom_line(aes(color=Symptomatic), size=1.5)
)

print(casePlot+scale_y_log10())
print(casePlot)

