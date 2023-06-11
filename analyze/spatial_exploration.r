library(gstat)
library(sp)
library(ggplot2)
library(SpatialEpi)

tim_c <- c("all")
height_c <- c("15cm")
minmax_c <- c("max")
bayerischer_wald_c <- c(TRUE)
dist_cutoff_c <- 0
station_cutoff <- "c1chur01"

setwd("/home/vojta/Desktop/mffuk/bakalarka/analyze/")
source("functions_analyze.r")

setwd("~/Desktop/mffuk/bakalarka/ZETA_Klimes")
load("zeta.RData")

for (tim in tim_c){
for (height in height_c){
for (minmax in minmax_c){
for (bayerischer_wald in bayerischer_wald_c){
for (dist_cutoff in dist_cutoff_c){

bw_text <- ifelse(bayerischer_wald == 1, "yes", "no")
if (dist_cutoff > 0){
	dist_cutoff <- paste(station_cutoff,dist_cutoff, sep="")
} else { dist_cutoff <- "" }

setwd("/home/vojta/Desktop/mffuk/bakalarka/analyze/out/")
load(paste("data_", minmax, tim, height, "_BW",
    bw_text, dist_cutoff, ".RData", sep = ""))
all_loggers$date <- as.Date(all_loggers$date, format="%d.%m.%Y")
all_loggers <- all_loggers[complete.cases(all_loggers),]

all_loggers <- all_loggers[!(all_loggers$date %in% as.Date(c("2021-05-18","2021-05-19","2021-05-20","2021-05-21"))),]
all_loggers <- all_loggers[order(as.Date(all_loggers$date, format="%Y-%m-%d")), ]

station_name_and_coordinate <- data.frame(station_name=zeta$ID_lokalit, lat=zeta$Lat_WGS84, lon=zeta$Lon_WGS84)
all_loggers_merged <- merge(all_loggers, station_name_and_coordinate, by="station_name")

vario_list <- list()
i <- 0
first_days_of_month <- seq.Date(as.Date("2020-01-01"), as.Date("2020-12-01"), by="month")
for (i in 1:12){
    sub_all_loggers_merged <- all_loggers_merged[all_loggers_merged$date %in% first_days_of_month[i],]
    data <- data.frame(diff=sub_all_loggers_merged$diff)
    f_spdf <- SpatialPointsDataFrame(latlong2grid(cbind(sub_all_loggers_merged$lat, sub_all_loggers_merged$lon)), data)
    vario_list[[i]] <- variogram(diff~1, f_spdf, boundaries=seq(0,50,l=50))
    gg_variogram(vario_list[[i]], minmax, height, first_days_of_month[i])
}

#f_fvgm <- fit.variogram(vario_list[[1]], vgm(nugget=2, model="Mat", range=20, psill=3))

}}}}}