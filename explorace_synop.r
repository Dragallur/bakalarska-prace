library(ggplot2)
library(stringr)

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
dat <- str_split_fixed(synop$time,"\\:",3)
synop$hour <- dat[,1]
synop <- synop[nrow(synop):1,]
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
#12.10.2019-21.5.2021
synop <- synop[min(which(synop$Date == "12.10.2019")):max(which(synop$Date == "21.05.2021")),]

setwd("~/Desktop/mffuk/bakalarka/out_fit/pics/")
plt <- ggplot(data=synop, aes(x=month, y=TC)) + geom_boxplot() +
    labs(x="Měsíc v roce", y="Teplota [°C]", title="Teploty ve 2 m měřené na stanici Churáňov") +
    theme(text=element_text(family="Latin Modern Math",size=20))
ggsave("synop_temperature.png", plt, height=8, width=8, dpi=343)

plt <- ggplot(data=synop, aes(x=month, y=pr24)) + geom_boxplot() +
    labs(x="Měsíc v roce", y="Srážky za 24 hodin [mm]", title="Sumace srážek naměřená na stanici Churáňov") +
    theme(text=element_text(family="Latin Modern Math",size=20))
ggsave("synop_prec.png", plt, height=8, width=8, dpi=343)

snowcm24 <- vector(length=nrow(synop))
snowcm24 <- NA
for (day in unique(synop$Date)){
    ind <- synop$Date==day
    snowcm24[max(which(ind==TRUE))] <- max(na.omit(synop$Snowcm[ind]))
}
snowcm24[snowcm24==-Inf] <- 0
synop$snowcm24 <- snowcm24
plt <- ggplot(data=synop, aes(x=month, y=snowcm24)) + geom_boxplot() +
    labs(x="Měsíc v roce", y="Maximální denní sněhová pokrývka [cm]", title="Maximální denní sněhová pokrývka\n na stanici Churáňov") +
    theme(text=element_text(family="Latin Modern Math",size=20))
ggsave("synop_snowcm.png", plt, height=8, width=8, dpi=343)

#sub_synop <- synop[(synop$month==10 & synop$year==2020),]
plt <- ggplot(data=synop, aes(x=ffkmh)) + geom_histogram(binwidth=3.6) +
    labs(x="Rychlost větru [km/h]", y="Počet pozorování", title="Měření rychlosti větru na stanici Churáňov") +
    theme(text=element_text(family="Latin Modern Math",size=20))
ggsave("synop_ffkmh.png", plt, units="in", height=8, width=8, dpi=343) 
