plot_f <- function(plt){
	wd <- getwd()
	setwd("/home/vojta/Desktop/mffuk/bakalarka/out_fit/")
	jpeg("plot.png")
	show(plt)
	dev.off()
	setwd(wd)
}

gg_hist_data_availability <- function(d){
	plt <- ggplot(data=d, aes(x=data)) + geom_histogram() +
        labs(x="Počet dostupných dnů", y="Počet čidel") +
        theme(text=element_text(family="Latin Modern Math",size=20))
	wd <- getwd()
	setwd("/home/vojta/Desktop/mffuk/bakalarka/out_fit/pics/")
	ggsave(paste("hist_numofdayavailability", ".png", sep=""), plot = plt)
	setwd(wd)
}

gg_hist_hour <- function(d, minmax, height){
	if (minmax=="max") {minmax_text <- "maximální"}
	if (minmax=="min") {minmax_text <- "minimální"}
	if (height=="0cm") {height_text <- "0 cm"}
	if (height=="15cm") {height_text <- "15 cm"}
	plt <- ggplot(data=d, aes(x=as.numeric(hour15cm))) + geom_histogram(breaks=(0:23)) +
		labs(x="Hodina (UTC)", y="Počet dnů", title=paste("Čas dosáhnutí ", minmax_text, " teploty v ", height_text, " v létě", sep="")) +
        theme(text=element_text(family="Latin Modern Math",size=20))
	wd <- getwd()
	setwd("/home/vojta/Desktop/mffuk/bakalarka/out_fit/pics/")
	ggsave(paste("hist_hour", minmax, height, ".png", sep=""), plot = plt)
	setwd(wd)
}

gg_plot_date_availability <- function(d){
	plt <- ggplot(data=d, aes(x=day, y=dates)) + geom_point() +
        labs(x="Datum", y="Počet čidel") +
        theme(text=element_text(family="Latin Modern Math",size=20))
	wd <- getwd()
	setwd("/home/vojta/Desktop/mffuk/bakalarka/out_fit/pics/")
	ggsave(paste("date_availability", ".png", sep=""), plot = plt)
	setwd(wd)
}

gg_plot_minmax_temp <- function(d, minmax, height){
	if (minmax=="max") {minmax_text <- "maximálních"}
	if (minmax=="min") {minmax_text <- "minimálních"}
	if (height=="0cm") {height_text <- "0 cm"}
	if (height=="15cm") {height_text <- "15 cm"}
	plt <- ggplot(data=d, aes(x=as.Date(date, format="%d.%m.%Y"), y=as.numeric(maxtemp2m))) + geom_point() +
        #labs(x="Datum", y="Teplota [°C]", title=paste("Průběh ", minmax_text, " teplot v ", height_text, sep="")) +
        labs(x="Datum", y="Teplota [°C]", title=paste("Průběh ", minmax_text, " teplot ve 2 m", sep="")) +
        theme(text=element_text(family="Latin Modern Math",size=20))
	wd <- getwd()
	setwd("/home/vojta/Desktop/mffuk/bakalarka/out_fit/pics/")
	ggsave(paste("maxtemp", minmax, height, ".png", sep=""), plot = plt)
	setwd(wd)

}

dashdate_to_dotdate <- function(d){
	s <- str_split_fixed(d, "-", 3)
	return(paste(s[3], s[2], s[1], sep="."))
}

dist_f2 <- function(station, sensor){
	return(distm(station, sensor, fun=distHaversine))
}