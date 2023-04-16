library(xlsx)
library(ggplot2)
library(cowplot)
library(plyr)

tim <- c("all")
height <- c("15cm")
minmax <- "max"
bayerischer_wald <- TRUE
bw_text <- ifelse(bayerischer_wald == 1, "yes", "no")
dist_cutoff <- 0
station_cutoff <- "c1chur01"
if (dist_cutoff > 0){
	dist_cutoff <- paste(station_cutoff,dist_cutoff, sep="")
} else { dist_cutoff <- "" }
#nahrani dat z predchoziho skriptu. Tj. fit vsech stanic
setwd("/home/vojta/Desktop/mffuk/bakalarka/out_fit")
dat <- na.omit(read.csv(paste("f", minmax, tim, height, "_BW", bw_text, dist_cutoff, ".csv",sep="")))[, -1] # nolint
f <- dat[,1:8]
f[, 1:7] <- signif((f[, 1:7]), 2)
colnames(f) <- c("intercept", "snowcm", "nt",
    "precmm", "month", "hum", "ffkmh", "station_name")

f_err <- dat[,9:16]
f_err[, 1:7] <- signif((f_err[, 1:7]), 2)
colnames(f_err) <- c("intercept", "snowcm", "nt",
    "precmm", "month", "hum", "ffkmh", "station_name")

f_prob <- dat[,17:24]
f_prob[, 1:7] <- signif((f_prob[, 1:7]), 2)
colnames(f_prob) <- c("intercept", "snowcm", "nt",
    "precmm", "month", "hum", "ffkmh", "station_name")

if (length(setdiff(f$station_name, f_prob$station_name))>0) {print("ASDF")}
inter <- intersect(intersect(f$station_name, f_prob$station_name), f_err$station_name)
f <- f[f$station_name %in% inter, ]
f_prob <- f_prob[f_prob$station_name %in% inter, ]
f_err <- f_err[f_err$station_name %in% inter, ]
row.names(f) <- 1:nrow(f)
row.names(f_err) <- 1:nrow(f_err)
row.names(f_prob) <- 1:nrow(f_prob)

print(paste("There are ", length(which(as.numeric(f_prob$snowcm)<0.05)), " stations with significant trend for snow.", sep=""))
print(paste("There are ", length(which(as.numeric(f_prob$nt)<0.05)), " stations with significant trend for cloudiness.", sep=""))
print(paste("There are ", length(which(as.numeric(f_prob$precmm)<0.05)), " stations with significant trend for precipitation.", sep=""))
print(paste("There are ", length(which(as.numeric(f_prob$month)<0.05)), " stations with significant trend for month.", sep=""))
print(paste("There are ", length(which(as.numeric(f_prob$hum)<0.05)), " stations with significant trend for humidity.", sep=""))
print(paste("There are ", length(which(as.numeric(f_prob$ffkmh)<0.05)), " stations with significant trend for wind speed.", sep=""))

#nahrat info o lokalitach
setwd("/home/vojta/Desktop/mffuk/bakalarka/ZETA_Klimes")
lokalita_data <- read.xlsx("Lokalita.xlsx", sheetIndex = 1)
#lokalita_data <- lokalita_data[lokalita_data$Projekt_lokalita == "TAČR Zeta", ]

f$lat <- lokalita_data$Lat_WGS84[lokalita_data$ID_lokalita %in% f$station_name] # nolint
f$lon <- lokalita_data$Lon_WGS84[lokalita_data$ID_lokalita %in% f$station_name] # nolint
f$dist_churanov <- ((f$lat-49.0707)^2+(f$lon-13.6173)^2)^(1/2) #nolint

#plt <- ggplot(f, aes(x = lat, y = lon)) +
#    geom_point(size = 10, aes(colour = factor(snowcm))) +
#    scale_color_discrete(guide = "none")
#show(plt)
snowcm <- data.frame(snowcm = f$snowcm[which(as.numeric(f_prob$snowcm)<0.05)])
nt <- data.frame(nt = f$nt[which(as.numeric(f_prob$nt)<0.05)])
precmm <- data.frame(precmm = f$precmm[which(as.numeric(f_prob$precmm)<0.05)])
month <- data.frame(month = f$month[which(as.numeric(f_prob$month)<0.05)])
hum <- data.frame(hum = f$hum[which(as.numeric(f_prob$hum)<0.05)])
ffkmh <- data.frame(ffkmh = f$ffkmh[which(as.numeric(f_prob$ffkmh)<0.05)])

setwd("~/Desktop/mffuk/bakalarka/out_fit/pics")
hist_snowcm <- ggplot(data = snowcm, aes(x=snowcm)) + geom_histogram() +
            labs(title=paste("Sníh", "\n", "(n=", nrow(snowcm), ", ", signif(mean(snowcm[,]),2), "±", signif(sd(snowcm[,]),2), ")", sep=""), x="", y="") +
            geom_vline(aes(xintercept=mean(snowcm)), linetype="dashed", color="red") +
            theme(text=element_text(family="Latin Modern Math",size=12), plot.title = element_text(hjust = 0.5))
hist_nt <- ggplot(data = nt, aes(x=nt)) + geom_histogram() +
            labs(title=paste("Oblačnost", "\n", "(n=", nrow(nt), ", ", signif(mean(nt[,]),2), "±", signif(sd(nt[,]),2), ")", sep=""), x="", y="") +
            geom_vline(aes(xintercept=mean(nt)), linetype="dashed", color="red") +
            theme(text=element_text(family="Latin Modern Math",size=12), plot.title = element_text(hjust = 0.5))
hist_precmm <- ggplot(data = precmm, aes(x=precmm)) + geom_histogram() +
            labs(title=paste("Srážky", "\n", "(n=", nrow(precmm), ", ", signif(mean(precmm[,]),2), "±", signif(sd(precmm[,]),2), ")", sep=""), x="", y="") +
            geom_vline(aes(xintercept=mean(precmm)), linetype="dashed", color="red") +
            theme(text=element_text(family="Latin Modern Math",size=12), plot.title = element_text(hjust = 0.5))
hist_month <- ggplot(data = month, aes(x=month)) + geom_histogram() +
            labs(title=paste("Měsíc", "\n", "(n=", nrow(month), ", ", signif(mean(month[,]),2), "±", signif(sd(month[,]),2), ")", sep=""), x="", y="") +
            geom_vline(aes(xintercept=mean(month)), linetype="dashed", color="red") +
            theme(text=element_text(family="Latin Modern Math",size=12), plot.title = element_text(hjust = 0.5))
hist_hum <- ggplot(data = hum, aes(x=hum)) + geom_histogram() +
            labs(title=paste("Vlhkost", "\n", "(n=", nrow(hum), ", ", signif(mean(hum[,]),2), "±", signif(sd(hum[,]),2), ")", sep=""), x="", y="") +
            geom_vline(aes(xintercept=mean(hum)), linetype="dashed", color="red") +
            theme(text=element_text(family="Latin Modern Math",size=12), plot.title = element_text(hjust = 0.5))
hist_ffkmh <- ggplot(data = ffkmh, aes(x=ffkmh)) + geom_histogram() +
            labs(title=paste("Vítr", "\n", "(n=", nrow(ffkmh), ", ", signif(mean(ffkmh[,]),2), "±", signif(sd(ffkmh[,]),2), ")", sep=""), x="", y="") +
            geom_vline(aes(xintercept=mean(ffkmh)), linetype="dashed", color="red") +
            theme(text=element_text(family="Latin Modern Math",size=12), plot.title = element_text(hjust = 0.5))

final_plot <- plot_grid(hist_snowcm, hist_nt, hist_precmm, hist_month, hist_hum, hist_ffkmh) +
    draw_plot_label("Sklon lineární funkce", x=0.25, y=0, vjust=-0.5, angle=0, family="Latin Modern Math") +
    draw_plot_label(paste("Počet čidel ", "(N=" ,nrow(f), ")", sep=""), x=0, y=0.15, vjust=1.5, angle=90, family="Latin Modern Math")

ggsave(paste("all",nrow(f), minmax, "T", tim, height, "_BW", bw_text, dist_cutoff, ".png",sep=""), plot=final_plot)

#print(colnames(lokalita_data))
#plot(f$snowcm, lokalita_data$SlopeDeg_DEM[lokalita_data$ID_lokalita %in% f$station_name])
#cor(f$snowcm, lokalita_data$SlopeDeg_DEM[lokalita_data$ID_lokalita %in% f$station_name])

#hist(f$snowcm[which(as.numeric(f_prob$snowcm)<0.05)])
#hist(f$nt[which(as.numeric(f_prob$nt)<0.05)])
#hist(f$precmm[which(as.numeric(f_prob$precmm)<0.05)])
#hist(f$month[which(as.numeric(f_prob$month)<0.05)])
#hist(f$hum[which(as.numeric(f_prob$hum)<0.05)])
#hist(f$ffkmh[which(as.numeric(f_prob$ffkmh)<0.05)])