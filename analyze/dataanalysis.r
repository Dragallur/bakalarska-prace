library(nlme)
library(lubridate)
library(forecast)
#library(ggplot2)
#library(moments)
library(MuMIn)

setwd("/home/vojta/Desktop/mffuk/bakalarka/analyze/")
source("functions_analyze.r")

tim_c <- c("all", "coldhalf") #all, winter, spring, summer, autumn, coldhalf, warmhalf
height_c <- c("15cm")
minmax_c <- c("min", "max")
bayerischer_wald_c <- c(TRUE)
dist_cutoff_c <- 0
station_cutoff <- "c1chur01"
snow_categorical <- TRUE

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

all_loggers$curt_diff <- sign(all_loggers$diff)*abs(all_loggers$diff)^(1/3)
all_loggers <- subset(all_loggers, select=-c(pr24)) #pr24 is not needed

if (snow_categorical){
    all_loggers$snowcm <- ifelse(all_loggers$snowcm == 0, 0, ifelse(all_loggers$snowcm <= 15, 1, 2))
}

if (tim == "warmhalf"){
    mod_curt <- lme(curt_diff ~ nt + hum + precmm + ffkmh + month,
        random = ~1 | station_name, data=all_loggers, na.action=na.exclude)
    mod_curt_corARMA <- update(mod_curt, correlation=corARMA(p=2, q=2))
} else {
    mod_curt <- lme(curt_diff ~ snowcm + nt + hum + precmm + ffkmh + month,
        random = ~1 | station_name, data=all_loggers, na.action=na.exclude)
    mod_curt_corARMA <- update(mod_curt, correlation=corARMA(p=2, q=2))
}

#d_mod_curt <- data.frame(x=fitted(mod_curt_corARMA), y=resid(mod_curt_corARMA, type="n"))
#mod_resid_vs_fitted_and_qq(d_mod_curt, minmax, height, "curt")
setwd("/home/vojta/Desktop/mffuk/bakalarka/analyze/out/ARMAmods")
snow_text <- ifelse(snow_categorical == 1, "yes", "no")
#save(file=paste("ARMAmod_", minmax, height, tim, "_snowcategory_", snow_text, ".RData", sep=""), mod_curt_corARMA)
load(paste("ARMAmod_", minmax, height, tim, ".RData", sep=""))
#load(paste("ARMAmod_", minmax, height, tim, "_snowcategory_", snow_text, ".RData", sep=""))

#hist_of_diff(all_loggers, minmax, height)
print(paste("Mean of $diff is ", round(mean(all_loggers$diff), 2),
    ". Median is ",
    median(all_loggers$diff), ". For temperature ", minmax,
    ", height of ", height, " and time ", tim, ".", sep=""))

}}}}}