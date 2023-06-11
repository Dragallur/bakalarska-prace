library(gridExtra)
library(stringr)
library(e1071)
library(xlsx)
library(geosphere)
library(ggplot2)
library(lmtest)
library(data.table)
library(lubridate)
library(car)
library(pscl)

setwd("/home/vojta/Desktop/mffuk/bakalarka/analyze/")
source("functions_analyze.r")

c1kvil01 <- c(49.0192269, 13.5792156)
c1hkvi01 <- c(49.0537242, 13.5651661)
c1blad01 <- c(48.9904850, 13.6620817)
c4japi01 <- c(49.0361536, 13.4212786)
c1chur01 <- c(49.0682586, 13.6156192)

tim_c <- c("all")
minmax_c <- c("min", "max")
height_c <- c("15cm", "0cm")
bayerischer_wald_c <- c(TRUE)
dist_cutoff_c <- 0
station_cutoff <- c(c1chur01, deparse(substitute(c1chur01)))
insol <- TRUE
size_nrow <- 228

setwd("~/Desktop/mffuk/bakalarka/ZETA_Klimes")
load("zeta.RData")

for (tim in tim_c){
for (minmax in minmax_c){
for (height in height_c){
for (bayerischer_wald in bayerischer_wald_c){
for (dist_cutoff in dist_cutoff_c){
print(paste("Starting with: time: ", tim, ", temperature: ", minmax, " and height: ", height, ".", sep = ""))

setwd("~/Desktop/mffuk/bakalarka/ZETA_Klimes")
lokalita_data <- read.xlsx("Lokalita.xlsx",sheetIndex=1)
if (bayerischer_wald == TRUE) {
	size_nrow <- 228 + 65
} else {
	lokalita_data <- lokalita_data[lokalita_data$Projekt_lokalita == "TAČR Zeta", ]
}
out <- data.frame(matrix(ncol = 8, nrow = size_nrow))
out_err <- data.frame(matrix(ncol = 8, nrow = size_nrow))
out_prob <- data.frame(matrix(ncol = 8, nrow = size_nrow))
diff_mean <- vector(length=size_nrow)
rsquared <- vector(length=size_nrow)
durbwatson <- vector(length=size_nrow)
gqtest_c <- vector(length=size_nrow)
station_arr <- vector(length=size_nrow)
ndays <- vector(length=size_nrow)
availability_data <- data.frame(data=vector(length=size_nrow))
availability_data$data <- NA
all_loggers <- c()
date_availability <- data.frame(dates=vector(length=588))
date_availability$dates <- 0
date_availability$day <- seq(as.Date("2019-10-12"), as.Date("2021-05-21"), by="+1 day")
rownames(date_availability) <- sapply(date_availability$day, dashdate_to_dotdate)
coords <- data.frame(matrix(ncol = 2, nrow = size_nrow))
vif_fit <- matrix(nrow = size_nrow, ncol = 6)
resid <- data.frame(matrix(nrow=length(seq(as.Date("2019-01-01"), as.Date("2021-12-31"), by="+1 day")), ncol=2))
resid[,1] <- seq( as.Date("2019-01-01"), as.Date("2021-12-31"), by="day")
resid[,2] <- 0

for (out_ind in 1:size_nrow){
setwd("~/Desktop/mffuk/bakalarka/ZETA_Klimes/data_all")
station_name <- lokalita_data$ID_lokalita[out_ind]
#check if file with the station name exists for both _a and _b, then proceed to calculate
if (isTRUE(file.exists(paste(station_name, "_a.csv", sep = "")))){
 #print(c(station_name, out_ind))
 da <- read.csv(paste(station_name,"_a.csv",sep=""),sep=";",header=FALSE)
 db <- read.csv(paste(station_name,"_b.csv",sep=""),sep=";",header=FALSE)
 lok <- zeta[zeta$ID_lokalit == station_name,]
 coords[out_ind,1] <- lok$Lat_WGS84
 coords[out_ind,2] <- lok$Lon_WGS84
} else {next}

if (dist_cutoff > 0){
if (dist_f2(c(lok$Lat_WGS84,lok$Lon_WGS84), as.numeric(station_cutoff[1:2])) > dist_cutoff){
	#print(paste(station_name," skipped for being too far.", sep=""))
	next
}
}
da <- da[,1:9]
colnames(da) <-  c("n","name","b","date","temp-6cm","temp2cm","temp15cm","humraw","hum")

db <- db[,1:5]
colnames(db) <- c("n","name","b","date","temp2m")

dat <- c()
dat <- str_split_fixed(da$date," ",2)
da$date <- str_pad(dat[,1], 10, pad="0")
da$time <- dat[,2]
dat <- str_split_fixed(da$date,"\\.",3)
da$day <- dat[,1]
da$month <- dat[,2]
da$year <- dat[,3]
dat <- str_split_fixed(da$time,"\\:",3)
da$hour <- dat[,1]
da$minute <- dat[,2]
da$second <- dat[,3]

dat <- str_split_fixed(db$date," ",2)
db$date <- str_pad(dat[,1], 10, pad="0")
db$time <- dat[,2]
dat <- str_split_fixed(db$date,"\\.",3)
db$day <- dat[,1]
db$month <- dat[,2]
db$year <- dat[,3]
dat <- str_split_fixed(db$time,"\\:",3)
db$hour <- dat[,1]
db$minute <- dat[,2]
db$second <- dat[,3]

setwd("~/Desktop/mffuk/bakalarka/SYNOP")
synop <- read.csv("11457.txt",header=TRUE)
synop$datetime <- synop$Date
synop$Nt[synop$Nt==9] <- NA
synop$Nt <- synop$Nt/8
dat <- str_split_fixed(synop$Date," ",2)
synop$Date <- dat[,1]
synop$time <- dat[,2]
dat <- str_split_fixed(synop$Date,"\\-",3)
synop$day <- dat[,3]
synop$month <- dat[,2]
synop$year <- dat[,1]
synop$Date <- paste(synop$day,synop$month,synop$year,sep=".")
if (tim == "winter"){
	synop <- synop[((synop$month == "12" | synop$month == "01") | synop$month == "02"),]
} else if (tim == "spring") {
	synop <- synop[((synop$month == "03" | synop$month == "04") | synop$month == "05"),]
} else if (tim == "summer") {
	synop <- synop[((synop$month == "06" | synop$month == "07") | synop$month == "08"),]
} else if (tim == "autumn") {
	synop <- synop[((synop$month == "09" | synop$month == "10") | synop$month == "11"),]
} 
dat <- str_split_fixed(synop$time,"\\:",3)
synop$hour <- dat[,1]

#Delete non complete last day, this can be different for da and db
if (nrow(da[da$date==unique(da$date)[length(unique(da$date))],])!=96){
	da <- da[-which(da$date==unique(da$date)[length(unique(da$date))]),]
}
if (nrow(db[db$date==unique(db$date)[length(unique(db$date))],])!=96){
	db <- db[-which(db$date==unique(db$date)[length(unique(db$date))]),]
}

fin_date <- rev(intersect(intersect(unique(synop$Date),unique(da$date)),unique(db$date)))
final_data <- data.frame(date=fin_date)

da <- da[da$date %in% final_data$date,]
synop <- synop[synop$Date %in% final_data$date,]

#fill missing cloud cover values in SYNOP file with ERA5 values
setwd("/home/vojta/Desktop/mffuk/bakalarka/analyze/out/")
era5 <- read.csv("era5_total_cloud_cover.csv", sep="\t", header=TRUE)
era5$datetime <- era5$time
dat <- str_split_fixed(era5$time," ",2)
era5$Date <- dat[,1]
era5$time <- dat[,2]
dat <- str_split_fixed(era5$Date,"\\-",3)
era5$day <- dat[,3]
era5$month <- dat[,2]
era5$year <- dat[,1]
era5$Date <- paste(era5$day,era5$month,era5$year,sep=".")
era5 <- era5[era5$Date %in% final_data$date,]

era5tcc_subset <- era5$tcc[match(synop$datetime[is.na(synop$Nt)], era5$datetime)]
synop$Nt[is.na(synop$Nt)] <- era5tcc_subset
#leave out previous line to plot synop vs ERA5 or calculate correlation
#synop <- synop[!duplicated(synop),]
#synop <- synop[!is.na(synop$Nt),]
#ttime <- rev(intersect(unique(synop$datetime),unique(era5$datetime)))
#plot(era5$tcc[era5$datetime %in% ttime], synop$Nt[synop$datetime %in% ttime])

#function to find time at which max temperature is reached
f <- function(temp,dat,tim){
	max_temp <- c()
	temp_time <- c()
	for (i in 1:length(unique(dat))){
		ind <- which(dat==unique(dat)[i])
		if (minmax == "max"){
			max_temp <- c(max_temp,max(temp[ind],na.rm=TRUE))
		} else {
			max_temp <- c(max_temp,min(temp[ind],na.rm=TRUE))
		}
		ind <- which(max_temp[i]==temp[ind])[1]
		temp_time <- c(temp_time,tim[ind])
	}
	return(as.data.frame.matrix(cbind(max_temp,temp_time)))
}

#choose -8 cm, 0 cm or 15 cm
if (height == "0cm"){
	maxdennitep <- data.frame(date=unique(da$date),f(da$temp2cm,da$date,da$time))
} else if (height == "15cm"){
	maxdennitep <- data.frame(date=unique(da$date),f(da$temp15cm,da$date,da$time))
}
colnames(maxdennitep) <- c("date","maxtemp15cm","time15cm")
dat <- str_split_fixed(maxdennitep$time15cm,"\\:",3)
maxdennitep$hour15cm <- dat[,1]

#match max temperature at 15cm with temperature measured at 2m
#maxtemp2m <- c()
maxtemp2m <- vector(length=length(maxdennitep$date))
for (i in 1:length(maxdennitep$date)){
	ind <- which(maxdennitep$date[i]==db$date)
	#ind <- ind[db$hour[ind]==maxdennitep$hour15cm[i]][1]
	ind <- ind[str_pad(db$time[ind], 5, pad="0", side="left")==str_pad(maxdennitep$time[i], 5, pad="0", side="left")][1]
	if (!is.na(ind)){
	if (length(ind)!=1){stop()}
	ii <- 0
	while(is.na(db$temp2m[ind])){ 
		ii <- ii + 1
		print(paste("NA in 2m detected, taking 15 minutes older value.", " Station: ", station_name, sep=""))
		ind <- ind - 1
		if (ii == 2) {break} #at most 30 minutes older value
	}
	}
	#maxtemp2m <- c(maxtemp2m,db$temp2m[ind])
	maxtemp2m[i] <- db$temp2m[ind]
}
maxdennitep$maxtemp2m <- maxtemp2m
chmu_stations <- rbind(c1kvil01, c1hkvi01, c1blad01, c4japi01, c1chur01)

station_latlon <- c(lok$Lat_WGS84, lok$Lon_WGS84) #function to calculate the distance between sensor and all stations

dist_vec <- apply(chmu_stations, 1, dist_f2, station_latlon)
min_dist <- which(dist_vec == min(dist_vec))

if (row.names(chmu_stations)[min_dist] == "c1chur01"){
	snowcm <- f(synop$Snow, synop$Date, synop$time)
} else {
	setwd("~/Desktop/mffuk/bakalarka/chmu_data/")
	chmu_data_sce <- read.csv(paste("f", toupper(row.names(chmu_stations)[min_dist]), "_SCE.csv", sep=""))
	chmu_data_sce <- chmu_data_sce[chmu_data_sce$date %in% final_data$date,] #chmu_data is always superset of final_data
	snowcm <- data.frame(cm = chmu_data_sce$Snowcm, time = chmu_data_sce$time)
}
#print(paste("Used the station ", row.names(chmu_stations)[min_dist], " for snow cover.", sep=""))

#snowcm <- f(synop$Snowcm,synop$Date,synop$time)
colnames(snowcm) <- c("cm","time")
snowcm$cm <- as.numeric(gsub("-Inf",0,snowcm$cm))
snowcm$cm <- as.numeric(gsub("Inf",0,snowcm$cm))
final_data$diff <- as.numeric(maxdennitep$maxtemp15cm)-as.numeric(maxdennitep$maxtemp2m)
#final_data$diff[is.na(final_data$diff)] <- 0
#final_data$diff <- predict(caret::BoxCoxTrans(final_data$diff), final_data$diff)
#final_data$diff <- final_data$diff^(1/2)*sign(final_data$diff)
#setwd("~/Desktop/mffuk/bakalarka/out_fit/diff_pics/")
#plt <- ggplot(data=final_data, aes(x=1:length(diff), y=diff)) + geom_point()
#ggsave(paste(station_name, ".png", sep=""), plt)
final_data$snowcm  <- snowcm$cm
final_data$station_snowcm <- row.names(chmu_stations)[min_dist]

nt_vec <- c()
for (i in 1:length(maxdennitep$date)){
	ind <- which(maxdennitep$date[i]==synop$Date)
	ind <- ind[synop$hour[ind]==maxdennitep$hour15cm[i]][1]
	nt_vec <- c(nt_vec,synop$Nt[ind])
}
final_data$nt <- nt_vec
pr24 <- f(synop$pr24,synop$Date,synop$time)
colnames(pr24) <- c("pr24","time")
pr24$pr24[pr24$pr24=="-Inf"] <- 0 ###vynulovány chybějící hodnoty
pr24$time[pr24$time=="-Inf"] <- 0 ###

final_data$pr24 <- pr24$pr24
hum_vec <- c()
for (i in 1:length(maxdennitep$date)){
	ind <- which(maxdennitep$date[i]==da$date)
	ind <- ind[da$hour[ind]==maxdennitep$hour15cm[i]][1]
	hum_vec <- c(hum_vec,da$hum[ind])
}
final_data$hum <- as.numeric(hum_vec)
chmu_stations <- rbind(c1chur01, c1blad01)
dist_vec <- apply(chmu_stations, 1, dist_f2, station_latlon)
min_dist <- which(dist_vec == min(dist_vec))

if (row.names(chmu_stations)[min_dist] == "c1chur01"){
	synop$Precmm[grepl("Tr", synop$Precmm)] <- 0 #Tr zřejmě znamená trace.
	synop$Precmm[grepl("6h", synop$Precmm)] <- "NA"
	synop$Precmm[grepl("12h", synop$Precmm)] <- "NA"
	synop$Precmm[grepl("24h", synop$Precmm)] <- "NA"
	synop$Precmm[grepl(NA, synop$Precmm)] <- "NA"
	split_on_slash <- function(x) {
  		parts <- strsplit(x, "/")
  		return(parts[[1]][1])
	}
	synop$Precmm[grepl("1h", synop$Precmm)] <- sapply(synop$Precmm[grepl("1h", synop$Precmm)], split_on_slash)
	synop$Precmm[synop$Precmm=="NA"] <- 0 #chtelo by to komplikovanejsi nahrazeni casu kde bylo puvodne 6h, 12h a 24h
	precmm_vec <- c()
	for (i in 1:length(maxdennitep$date)){
		ind <- which(maxdennitep$date[i]==synop$Date)
		ind <- ind[synop$hour[ind]==maxdennitep$hour15cm[i]][1]
		precmm_vec <- c(precmm_vec,synop$Precmm[ind])
	}
} else {
	setwd("~/Desktop/mffuk/bakalarka/chmu_data/")
	chmu_data_sra10m <- read.csv(paste("f", toupper(row.names(chmu_stations)[min_dist]), "_SRA10M.csv", sep=""))
	chmu_data_sra10m <- chmu_data_sra10m[chmu_data_sra10m$date %in% final_data$date,] #chmu_data is always superset of final_data
	precmm_vec <- c()
	for (i in 1:length(maxdennitep$date)){
		ind <- which(maxdennitep$date[i]==chmu_data_sra10m$date)
		ind <- ind[chmu_data_sra10m$hour[ind]==maxdennitep$hour15cm[i]]
		precmm_vec <- c(precmm_vec,sum(chmu_data_sra10m$Precmm[ind]))
	}
}
#print(paste("Used the station ", row.names(chmu_stations)[min_dist], " for 10 min precipitation.", sep=""))
final_data$precmm <- as.numeric(precmm_vec)
final_data$station_precmm <- row.names(chmu_stations)[min_dist]

ffkmh <- c()
for (i in 1:length(maxdennitep$date)){
	ind <- which(maxdennitep$date[i]==synop$Date)
	ind <- ind[synop$hour[ind]==maxdennitep$hour15cm[i]][1]
	ffkmh <- c(ffkmh,synop$ffkmh[ind])
}
final_data$ffkmh <- as.numeric(ffkmh)
dat <- str_split_fixed(final_data$date, "\\.", 3)

f_insolation <- function(S0, d, dd, phi, delta, h){
	return(S0*(d/dd)^2*(sin(phi)*sin(delta)+cos(phi)*cos(delta)*cos(h)))
}
if (insol == TRUE){
	dday <- yday(as.Date(maxdennitep$date, format='%d.%m.%Y'))
	hhour <- as.numeric(substr(str_pad(substr(maxdennitep$time15cm, 1, 5), 5, pad="0"), 1, 2))
	mmin <- as.numeric(substr(str_pad(substr(maxdennitep$time15cm, 1, 5), 5, pad="0"), 4, 5))
	delta <- -23.45*pi/180 * cos(2*pi/365*(dday+10))
	fractionalyear <- 2*pi/365*(dday-1+(hhour-12)/24)
	eot <- 229.18*(0.000075+0.001868*cos(fractionalyear)-
		0.032077*sin(fractionalyear)-
		0.014615*cos(2*fractionalyear)-
		0.040849*sin(2*fractionalyear))
	longv <- 4*lok$Lon_WGS84
	hourangle <- ((hhour+mmin/60+(eot+longv)/60)-12)*15*pi/180
	sunearth_dist <- 1-0.01672*cos(pi/180*360/365.256363*(dday+10))
	final_data$month <- f_insolation(1361, 1, sunearth_dist, lok$Lat_WGS84*pi/180, delta, hourangle)
} else {
	final_data$month <- as.numeric(dat[, 2])
}

final_data$snowcm <- as.numeric(final_data$snowcm)
final_data$nt <- as.numeric(final_data$nt)
final_data$pr24 <- as.numeric(final_data$pr24)
final_data$month <- as.numeric(final_data$month)
final_data$station_name <- station_name
final_data <- final_data[!is.na(final_data$diff), ]
all_loggers <- rbind(all_loggers, final_data)
} #end for loop for 1 station

setwd("~/Desktop/mffuk/bakalarka/analyze/out/")
bw_text <- ifelse(bayerischer_wald == 1, "yes", "no")
if (dist_cutoff > 0){
	dist_cutoff <- paste(station_cutoff[3],dist_cutoff, sep="")
} else { dist_cutoff <- "" }
#print(paste("Fitting was done for ", sum(complete.cases(out)), " stations.", sep = ""))
print(paste("Total of  ", nrow(all_loggers), " data points.", sep = ""))

all_loggers$month <- (abs(all_loggers$month)+all_loggers$month)/2
save(all_loggers, file=paste("data_", minmax, tim, height, "_BW", bw_text, dist_cutoff, ".RData", sep = ""))

}}}}}