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

loggers_names_for_dates <- function(d, all_loggers){
	return(unique(all_loggers$station_name[all_loggers$date==d]))
}

f_permutation_test <- function(day, shuffle_all_loggers){
	day_all_loggers <- all_loggers[date==dates_all[day],]
    all_val_change <- all_loggers[date==shuffle_dates_all[day], c(..permutation_str, "station_name")]
    changed_values <- merge(day_all_loggers, all_val_change, by="station_name", all.x=TRUE)
    changed_values[, snowcm := ifelse(is.na(snowcm.y), sample(na.omit(snowcm.y),1), snowcm.y)]
    changed_values[, snowcm.x := NULL]
    changed_values[, snowcm.y := NULL]
    shuffle_all_loggers <- rbindlist(list(shuffle_all_loggers, changed_values))
	return(shuffle_all_loggers)
}

autocorrelation <- function(logger){
	plt <- ggAcf(all_loggers[all_loggers$station_name==logger,]$diff) +
	    labs(x="lag", y="ACF", title="Autokorelační funkce rozdílu teplot") +
        theme(text=element_text(family="Latin Modern Math",size=20))
	wd <- getwd()
	setwd("/home/vojta/Desktop/mffuk/bakalarka/analyze/out/")
	ggsave(paste("acf", logger, ".png", sep=""), plot = plt, width=8, height=8, dpi=343)
	setwd(wd)
}

mod_resid_vs_fitted_and_qq <- function(data, minmax, height, transformation){
	plt <- ggplot(data, aes(x=x, y=y)) + geom_point() + 
		labs(x="Fitované hodnoty", y="Residuály", title="") +
        theme(text=element_text(family="Latin Modern Math",size=20))
	plt2 <- ggplot(data, aes(sample=y)) + geom_qq() + geom_qq_line() + 
		labs(x="Teoretické kvantily", y="Empirické kvantily", title="") +
        theme(text=element_text(family="Latin Modern Math",size=20))
	wd <- getwd()
	setwd("/home/vojta/Desktop/mffuk/bakalarka/analyze/out/")
	ggsave(paste("mod", minmax, height, "_", transformation, ".png", sep=""), plot = plt, width=8, height=8, dpi=343)
	ggsave(paste("qq_mod", minmax, height, "_", transformation, ".png", sep=""), plot = plt2, width=8, height=8, dpi=343)
	setwd(wd)
}