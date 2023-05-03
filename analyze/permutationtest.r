library(nlme)
library(profvis)
library(data.table)

setwd("/home/vojta/Desktop/mffuk/bakalarka/analyze/")
source("functions_analyze.r")

tim_c <- c("all")
height_c <- c("15cm")
minmax_c <- c("max")
bayerischer_wald_c <- c(TRUE)
dist_cutoff_c <- 0
station_cutoff <- "c1chur01"

permutation_str <- "snowcm"

p<-profvis({

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
all_loggers <- all_loggers[order(all_loggers$date),]
all_loggers <- all_loggers[!(all_loggers$date %in% as.Date(c("2021-05-18","2021-05-19","2021-05-20","2021-05-21"))),]

loggers_95 <- unique(as.vector(sapply(seq(as.Date("2020-12-18"), 
    as.Date("2021-05-17"), by="day"), loggers_names_for_dates, all_loggers)))
if (length(loggers_95)!=95) {warning("There is something wrong with the data!")}
loggers_153 <- unique(as.vector(sapply(seq(as.Date("2019-10-12"), 
    as.Date("2020-07-14"), by="day"), loggers_names_for_dates, all_loggers)))
if (length(loggers_153)!=153) {warning("There is something wrong with the data!")}

dates_153 <- seq(as.Date("2019-10-12"), as.Date("2020-10-12"), by="day")
for (day in seq(1, length(dates_153))){
    extra_loggers <- setdiff(all_loggers$station_name[all_loggers$date == dates_153[day]], loggers_153)
    loggers_153_subset <- all_loggers[all_loggers$date==dates_153[day],]
    loggers_153_subset <- loggers_153_subset[!(loggers_153_subset$station_name %in% extra_loggers),]
    beginend_day <- c(min(which(all_loggers$date==dates_153[day])), max(which(all_loggers$date==dates_153[day])))
    all_loggers <- rbindlist(list(all_loggers[seq(1, length=beginend_day[1]-1),], loggers_153_subset, all_loggers[seq(beginend_day[2]+1, length=nrow(all_loggers)-beginend_day[2]),]))
}

dates_95 <- seq(as.Date("2020-10-13"), as.Date("2021-05-17"), by="day")
for (day in seq(1, length(dates_95))){
    extra_loggers <- setdiff(all_loggers$station_name[all_loggers$date == dates_95[day]], loggers_95)
    loggers_95_subset <- all_loggers[all_loggers$date==dates_95[day],]
    loggers_95_subset <- loggers_95_subset[!(loggers_95_subset$station_name %in% extra_loggers),]
    beginend_day <- c(min(which(all_loggers$date==dates_95[day])), max(which(all_loggers$date==dates_95[day])))
    all_loggers <- rbindlist(list(all_loggers[seq(1, length=beginend_day[1]-1),], loggers_95_subset, all_loggers[seq(beginend_day[2]+1, length=nrow(all_loggers)-beginend_day[2]),]))
}

dates_all <- unique(all_loggers$date)
shuffle_all_loggers <- c()
shuffle_dates_all <- sample(dates_all)
#for (day in seq(1, length(dates_all))){
#for (day in seq(420, 440)){
#    print(day)
#    day_all_loggers <- all_loggers[date==dates_all[day],]
#    logger_vector <- day_all_loggers[,station_name]
#    all_val_change <- all_loggers[date==shuffle_dates_all[day], ..permutation_str]
#    for (logger in seq(1,length(logger_vector))){
#        one_row <- day_all_loggers[day_all_loggers$station_name %in% logger_vector[logger],]
#        val_change <- all_val_change[logger, ..permutation_str]
#        if (dim(val_change)[1]==0) {val_change <- all_loggers[date==shuffle_dates_all[day], ..permutation_str][sample(.N, 1)]}
#        one_row[, (permutation_str) := val_change]
#        shuffle_all_loggers <- rbindlist(list(shuffle_all_loggers, one_row))
#    }
#}
#print(nrow(shuffle_all_loggers))
#mod1 <- lme(diff ~ snowcm + nt + hum + precmm + ffkmh + month,
#    random = ~1 | station_name, data=shuffle_all_loggers, na.action=na.exclude)

shuffle_all_loggers <- c()

for (day in seq(1, length(dates_all))){
    print(day)
    day_all_loggers <- all_loggers[date==dates_all[day],]
    all_val_change <- all_loggers[date==shuffle_dates_all[day], c(..permutation_str, "station_name")]
    changed_values <- merge(day_all_loggers, all_val_change, by="station_name", all.x=TRUE)
    changed_values[, snowcm := ifelse(is.na(snowcm.y), sample(na.omit(snowcm.y),1), snowcm.y)]
    changed_values[, snowcm.x := NULL]
    changed_values[, snowcm.y := NULL]
    shuffle_all_loggers <- rbindlist(list(shuffle_all_loggers, changed_values))
}

mod2 <- lme(diff ~ snowcm + nt + hum + precmm + ffkmh + month,
    random = ~1 | station_name, data=shuffle_all_loggers, na.action=na.exclude)

print(nrow(shuffle_all_loggers))
}}}}}
})
