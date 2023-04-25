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

setwd("/home/vojta/Desktop/mffuk/bakalarka")
source("functions.r")

c1kvil01 <- c(49.0192269, 13.5792156)
c1hkvi01 <- c(49.0537242, 13.5651661)
c1blad01 <- c(48.9904850, 13.6620817)
c4japi01 <- c(49.0361536, 13.4212786)
c1chur01 <- c(49.0682586, 13.6156192)

tim_c <- c("all")
minmax_c <- c("max", "min")
height_c <- c("15cm", "0cm")
bayerischer_wald_c <- c(FALSE)
dist_cutoff_c <- 2000
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
if (station_name != "NPS_4311_D_TMS") {next}
#check if file with the station name exists for both _a and _b, then proceed to calculate
if (isTRUE(file.exists(paste(station_name, "_a.csv", sep = "")))){
 print(c(station_name, out_ind))
 da <- read.csv(paste(station_name,"_a.csv",sep=""),sep=";",header=FALSE)
 db <- read.csv(paste(station_name,"_b.csv",sep=""),sep=";",header=FALSE)
 lok <- zeta[zeta$ID_lokalit == station_name,]
 coords[out_ind,1] <- lok$Lat_WGS84
 coords[out_ind,2] <- lok$Lon_WGS84
} else {next}

if (dist_cutoff > 0){
if (dist_f2(c(lok$Lat_WGS84,lok$Lon_WGS84), as.numeric(station_cutoff[1:2])) > dist_cutoff){
	print(paste(station_name," skipped for being too far.", sep=""))
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

#get rid of the part with weird fit residuals (currently worsens results)
#mar <- rev(unique(synop$Date))[which(rev(unique(synop$Date)) == "01.03.2020"):length(unique(synop$Date))]
fin_date <- rev(intersect(unique(synop$Date),unique(da$date)))
#fin_date <- fin_date[min(which((fin_date %in% mar) == TRUE)):length(fin_date)]
final_data <- data.frame(date=fin_date)
#if (sum(nchar(as.character(fin_date))==10)!=length(fin_date)) {stop()}
#if (sum(final_data$date %in% "01.04.2020") == 0) {stop()}
#get rid of small datasets
if (nrow(final_data)<60) next
da <- da[da$date %in% final_data$date,]
synop <- synop[synop$Date %in% final_data$date,]

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
maxdennitep$hour15cm <- dat[,1] #zaokrouhluji hodiny dolu

#match max temperature at 15cm with temperature measured at 2m
maxtemp2m <- c()
for (i in 1:length(maxdennitep$date)){
	ind <- which(maxdennitep$date[i]==db$date)
	ind <- ind[db$hour[ind]==maxdennitep$hour15cm[i]][1]
	maxtemp2m <- c(maxtemp2m,db$temp2m[ind])
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
print(paste("Used the station ", row.names(chmu_stations)[min_dist], " for snow cover.", sep=""))

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
print(paste("Used the station ", row.names(chmu_stations)[min_dist], " for 10 min precipitation.", sep=""))
final_data$precmm <- as.numeric(precmm_vec)

ffkmh <- c()
for (i in 1:length(maxdennitep$date)){
	ind <- which(maxdennitep$date[i]==synop$Date)
	ind <- ind[synop$hour[ind]==maxdennitep$hour15cm[i]][1]
	ffkmh <- c(ffkmh,synop$ffkmh[ind])
}
final_data$ffkmh <- as.numeric(ffkmh)
dat <- str_split_fixed(final_data$date, "\\.", 3)

f_insolation <- function(S0, d, dd, phi, delta, h){
	return(S0*(d/dd)^2*(sin(phi)*sin(delta)+cos(phi)*cos(delta)*h))
}
if (insol == TRUE){
	delta <- -23.45*pi/180 * cos(2*pi/365*(yday(as.Date(maxdennitep$date, format='%d.%m.%Y'))+10))
	coshour <- (sin(-pi/180*0.83)-sin(lok$Lat_WGS84*pi/180)*sin(delta))/(cos(lok$Lat_WGS84)*cos(delta))
	sunearth_dist <- 1-0.01672*cos(pi/180*360/365.256363*(yday(as.Date(maxdennitep$date, format='%d.%m.%Y'))+10))
	final_data$month <- f_insolation(1361, 1, sunearth_dist, lok$Lat_WGS84*pi/180, delta, coshour)
} else {
	final_data$month <- as.numeric(dat[, 2])
}

final_data$snowcm <- as.numeric(final_data$snowcm)
final_data$nt <- as.numeric(final_data$nt)
final_data$pr24 <- as.numeric(final_data$pr24)
final_data$month <- as.numeric(final_data$month)
#final_data <- final_data[complete.cases(final_data),]
#fit <- glm(diff ~ snowcm + nt + precmm + month + hum + ffkmh, data = final_data)
fit <- glm(diff ~ snowcm + nt + precmm + month + hum + ffkmh, data = final_data)
if (anyNA(fit$coefficients)){
	print("One or more NA values in fit were detected. Skipping station.")
	next
}
if (anyNA(summary(fit))){
	print("One or more NA values in summary fit were detected. Skipping station.")
	next
}

rsquared[out_ind] <- pR2(fit)['McFadden']# summary(fit)$adj.r.square
#durbwatson[out_ind] <- dwtest(fit)$statistic
#gqtest_c[out_ind] <- gqtest(fit)$p.value
#gqtest_c[out_ind] <- bptest(fit)$p.value
gqtest_c[out_ind] <- skedastic::white(fit)
availability_data$data[out_ind] <- nrow(final_data)
date_availability$dates[rownames(date_availability) %in% final_data$date] <- date_availability$dates[rownames(date_availability) %in% final_data$date] + 1
#gqtest(fit)
#if (gqtest(fit)$p.value == 1.0) {stop()}

station_arr[out_ind] <- station_name
ind_resid <- seq(which(resid[,1]==as.Date(final_data$date[1], format="%d.%m.%Y")), length.out=nrow(final_data))
resid[ind_resid,2] <- resid[ind_resid,2]+residuals(fit)

v_out <- c(as.vector(fit$coefficients[1:7]), station_name)
out[out_ind,] <- v_out
v_out <- c(as.vector(summary(fit)$coefficients[,2]), station_name)
out_err[out_ind,] <- v_out
v_out <- c(as.vector(summary(fit)$coefficients[,4]), station_name)
out_prob[out_ind,] <- v_out
diff_mean[out_ind] <- mean(final_data$diff)
} #end for loop for 1 station

#supp_out <- cbind(rsquared, durbwatson, ndays, vif_fit, station_arr)
supp_out <- cbind(rsquared, ndays, vif_fit, station_arr)
final_out <- cbind(out, out_err, out_prob)
setwd("~/Desktop/mffuk/bakalarka/out_fit")
bw_text <- ifelse(bayerischer_wald == 1, "yes", "no")
if (dist_cutoff > 0){
	dist_cutoff <- paste(station_cutoff[3],dist_cutoff, sep="")
} else { dist_cutoff <- "" }
print(paste("Fitting was done for ", sum(complete.cases(out)), " stations.", sep = ""))

#gg_hist_data_availability(availability_data)
#gg_plot_date_availability(date_availability)
#gg_hist_hour(maxdennitep, minmax, height)
gg_plot_minmax_temp(maxdennitep, minmax, height)
#write.csv(final_out,paste("f", minmax, tim, height, "_BW", bw_text, dist_cutoff, ".csv", sep = ""))
#write.csv(supp_out,paste("supp", minmax, tim, height, "_BW", bw_text, dist_cutoff, ".csv", sep = ""))
}}}}}
#write.csv(out,paste("f_T", minmax, tim, height, "_BW", bw_text, dist_cutoff, ".csv", sep = ""))
#write.csv(out_err,paste("f_T", minmax, tim, height, "_BW", bw_text, dist_cutoff, "_err.csv", sep = ""))
#write.csv(out_prob,paste("f_T", minmax, tim, height, "_BW", bw_text, dist_cutoff, "_prob.csv", sep = ""))
### f_T + 
	#time interval + 
	#min or max if we are looking for minimum or maximum for the day +
	#temperature sensor height + 
	#_BW + if sensors from Bayerischer Wald are included +
	#nothing or name of station around which we use only subset of sensors depending on radius