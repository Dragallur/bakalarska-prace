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

#according to https://stackoverflow.com/questions/8708048/position-of-the-sun-given-time-of-day-latitude-and-longitude
sunPosition <- function(year, month, day, hour, min, sec,
                    lat, long, declination) {
	if (anyNA(as.vector(c(year, month, day, hour, min, sec, lat, long)))){
		return(NA)
	}
    twopi <- 2 * pi
    deg2rad <- pi / 180

    # Get day of the year, e.g. Feb 1 = 32, Mar 1 = 61 on leap years
    month.days <- c(0,31,28,31,30,31,30,31,31,30,31,30)
    day <- day + cumsum(month.days)[month]
    leapdays <- year %% 4 == 0 & (year %% 400 == 0 | year %% 100 != 0) & 
                day >= 60 & !(month==2 & day==60)
    day[leapdays] <- day[leapdays] + 1

    # Get Julian date - 2400000
    hour <- hour + min / 60 + sec / 3600 # hour plus fraction
    delta <- year - 1949
    leap <- trunc(delta / 4) # former leapyears
    jd <- 32916.5 + delta * 365 + leap + day + hour / 24

    # The input to the Atronomer's almanach is the difference between
    # the Julian date and JD 2451545.0 (noon, 1 January 2000)
    time <- jd - 51545.

    # Ecliptic coordinates

    # Mean longitude
    mnlong <- 280.460 + .9856474 * time
    mnlong <- mnlong %% 360
    mnlong[mnlong < 0] <- mnlong[mnlong < 0] + 360

    # Mean anomaly
    mnanom <- 357.528 + .9856003 * time
    mnanom <- mnanom %% 360
    mnanom[mnanom < 0] <- mnanom[mnanom < 0] + 360
    mnanom <- mnanom * deg2rad

    # Ecliptic longitude and obliquity of ecliptic
    eclong <- mnlong + 1.915 * sin(mnanom) + 0.020 * sin(2 * mnanom)
    eclong <- eclong %% 360
    eclong[eclong < 0] <- eclong[eclong < 0] + 360
    oblqec <- 23.439 - 0.0000004 * time
    eclong <- eclong * deg2rad
    oblqec <- oblqec * deg2rad

    # Celestial coordinates
    # Right ascension and declination
    num <- cos(oblqec) * sin(eclong)
    den <- cos(eclong)
    ra <- atan(num / den)
    ra[den < 0] <- ra[den < 0] + pi
    ra[den >= 0 & num < 0] <- ra[den >= 0 & num < 0] + twopi
    dec <- asin(sin(oblqec) * sin(eclong))

    # Local coordinates
    # Greenwich mean sidereal time
    gmst <- 6.697375 + .0657098242 * time + hour
    gmst <- gmst %% 24
    gmst[gmst < 0] <- gmst[gmst < 0] + 24.

    # Local mean sidereal time
    lmst <- gmst + long / 15.
    lmst <- lmst %% 24.
    lmst[lmst < 0] <- lmst[lmst < 0] + 24.
    lmst <- lmst * 15. * deg2rad

    # Hour angle
    ha <- lmst - ra
    ha[ha < -pi] <- ha[ha < -pi] + twopi
    ha[ha > pi] <- ha[ha > pi] - twopi

    # Latitude to radians
    lat <- lat * deg2rad

    # Azimuth and elevation
    el <- asin(sin(dec) * sin(lat) + cos(dec) * cos(lat) * cos(ha))
    az <- asin(-cos(dec) * sin(ha) / cos(el))

    # For logic and names, see Spencer, J.W. 1989. Solar Energy. 42(4):353
    cosAzPos <- (0 <= sin(dec) - sin(el) * sin(lat))
    sinAzNeg <- (sin(az) < 0)
    az[cosAzPos & sinAzNeg] <- az[cosAzPos & sinAzNeg] + twopi
    az[!cosAzPos] <- pi - az[!cosAzPos]

    # if (0 < sin(dec) - sin(el) * sin(lat)) {
    #     if(sin(az) < 0) az <- az + twopi
    # } else {
    #     az <- pi - az
    # }


    el <- el / deg2rad
    az <- az / deg2rad
    lat <- lat / deg2rad

	#hour angle: tan(HA) = sin(AZ)*cos(EL) / (cos(LAT)*sin(EL) - sin(LAT)*cos(AZ)*cos(EL))
	#according to: https://www.cloudynights.com/topic/777661-hour-angle-and-declination-from-azimuth-and-elevation/
	#ha = atan(sin(az) * cos(el) / (cos(lat) * sin(el) - sin(lat) * cos(az) * cos(el)))
	ha = acos((sin(el)-sin(lat)*sin(declination))/(cos(lat)*cos(declination)))

	
    return(ha)
}
