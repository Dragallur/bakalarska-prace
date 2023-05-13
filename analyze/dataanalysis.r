library(nlme)
library(lubridate)
library(forecast)
library(ggplot2)

setwd("/home/vojta/Desktop/mffuk/bakalarka/analyze/")
source("functions_analyze.r")

tim_c <- c("all")
height_c <- c("15cm")
minmax_c <- c("max")
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
mod <- lme(diff ~ snowcm + nt + hum + precmm + ffkmh + month,
   random = ~1 | station_name, data=all_loggers, na.action=na.exclude)
#mod_corARMA <- update(mod, correlation=corARMA(p=1, q=1))
#d_mod <- data.frame(x=fitted(mod_corARMA), y=resid(mod_corARMA, type="n"))
#mod_resid_vs_fitted_and_qq(d_mod, minmax, height, "none")

#all_loggers$diff <- sign(all_loggers$diff)*log(abs(all_loggers$diff))
#all_loggers$time <- factor(as.numeric(format(as.Date(all_loggers$date, format="%Y-%m-%d"), "%m")))
#mod_log <- lme(diff ~ snowcm + nt + hum + precmm + ffkmh + month,
#   random = ~1 | station_name, data=all_loggers, na.action=na.exclude)
#
#mod_log_corARMA <- update(mod_log, correlation=corARMA(p=1, q=1))
#d_mod_log <- data.frame(x=fitted(mod_log_corARMA), y=resid(mod_log_corARMA, type="n"))
#mod_resid_vs_fitted_and_qq(d_mod_log, minmax, height, "log")

#plot(acf(residuals(mod_log), na.action=na.exclude, plot=FALSE))
#
#all_loggers$diff <- sign(all_loggers$diff)*sqrt(abs(all_loggers$diff))
#mod_sqrt <- lme(diff ~ snowcm + nt + hum + precmm + ffkmh + month,
#   random = ~1 | station_name, data=all_loggers, na.action=na.exclude)
#mod_sqrt_corARMA <- update(mod_sqrt, correlation=corARMA(p=1, q=1))
#d_mod_sqrt <- data.frame(x=fitted(mod_sqrt_corARMA), y=resid(mod_sqrt_corARMA, type="n"))
#mod_resid_vs_fitted_and_qq(d_mod_sqrt, minmax, height, "sqrt")
#
all_loggers$diff <- sign(all_loggers$diff)*abs(all_loggers$diff)^(1/3)
mod_curt <- lme(diff ~ snowcm + nt + hum + precmm + ffkmh + month,
   random = ~1 | station_name, data=all_loggers, na.action=na.exclude)
#mod_curt_corARMA <- update(mod_curt, correlation=corARMA(p=1, q=1))
mod_curt_corARMA_21 <- update(mod_curt, correlation=corARMA(p=2, q=1))
print("ARMA_21 done")
save.image("workspace.RData")
print("Worspace saved.")
mod_curt_corARMA_12 <- update(mod_curt, correlation=corARMA(p=1, q=2))
print("ARMA_12 done")
save.image("workspace.RData")
print("Worspace saved.")
mod_curt_corARMA_22 <- update(mod_curt, correlation=corARMA(p=2, q=2))
print("ARMA_22 done")
save.image("workspace.RData")
print("Worspace saved.")

#d_mod_curt <- data.frame(x=fitted(mod_curt_corARMA), y=resid(mod_curt_corARMA, type="n"))
#mod_resid_vs_fitted_and_qq(d_mod_curt, minmax, height, "curt")

#autocorrelation("NPS_4311_D_TMS")
}}}}}