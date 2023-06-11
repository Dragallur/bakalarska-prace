library(nlme)
library(lubridate)
library(forecast)
library(ggplot2)
library(moments)

setwd("/home/vojta/Desktop/mffuk/bakalarka/analyze/")
source("functions_analyze.r")

tim_c <- c("all")
height_c <- c("15cm", "0cm")
minmax_c <- c("max", "min")
bayerischer_wald_c <- c(TRUE)
dist_cutoff_c <- 0
station_cutoff <- "c1chur01"

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

#all_loggers$diff[all_loggers$diff==0] <- jitter(all_loggers$diff[all_loggers$diff==0])
#mod <- lme(diff ~ snowcm + nt + hum + precmm + ffkmh + month,
#   random = ~1 | station_name, data=all_loggers, na.action=na.exclude)
#print("Next is ARMA model")
#mod_corARMA <- update(mod, correlation=corARMA(p=2, q=2))
#d_mod <- data.frame(x=fitted(mod_corARMA), y=resid(mod_corARMA, type="n"))
#mod_resid_vs_fitted_and_qq(d_mod, minmax, height, "none")
#
#all_loggers$diff <- sign(all_loggers$diff)*log(abs(all_loggers$diff))
#all_loggers$time <- factor(as.numeric(format(as.Date(all_loggers$date, format="%Y-%m-%d"), "%m")))
#mod_log <- lme(diff ~ snowcm + nt + hum + precmm + ffkmh + month,
#   random = ~1 | station_name, data=all_loggers, na.action=na.exclude)
#
#mod_log_corARMA <- update(mod_log, correlation=corARMA(p=2, q=2))
#d_mod_log <- data.frame(x=fitted(mod_log_corARMA), y=resid(mod_log_corARMA, type="n"))
#mod_resid_vs_fitted_and_qq(d_mod_log, minmax, height, "log")

#
#all_loggers$diff <- sign(all_loggers$diff)*sqrt(abs(all_loggers$diff))
#mod_sqrt <- lme(diff ~ snowcm + nt + hum + precmm + ffkmh + month,
#   random = ~1 | station_name, data=all_loggers, na.action=na.exclude)
#mod_sqrt_corARMA <- update(mod_sqrt, correlation=corARMA(p=2, q=2))
#d_mod_sqrt <- data.frame(x=fitted(mod_sqrt_corARMA), y=resid(mod_sqrt_corARMA, type="n"))
#mod_resid_vs_fitted_and_qq(d_mod_sqrt, minmax, height, "sqrt")
#
#all_loggers$curt_diff <- sign(all_loggers$diff)*abs(all_loggers$diff)^(1/3)
#mod_curt <- lme(curt_diff ~ snowcm + nt + hum + precmm + ffkmh + month,
#   random = ~1 | station_name, data=all_loggers, na.action=na.exclude)
#mod_curt_corARMA <- update(mod_curt, correlation=corARMA(p=2, q=2))
#d_mod_curt <- data.frame(x=fitted(mod_curt_corARMA), y=resid(mod_curt_corARMA, type="n"))
#mod_resid_vs_fitted_and_qq(d_mod_curt, minmax, height, "curt")

hist_of_diff(all_loggers, minmax, height)
#print(nrow(all_loggers))
print(paste("Mean of $diff is ", round(mean(all_loggers$diff), 2),
    ". Median is ",
    median(all_loggers$diff), ". For temperature ", minmax,
    " and height of ", height, ".", sep=""))

}}}}}