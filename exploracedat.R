library(ggplot2)
library(gridExtra)
library(stringr)
library(e1071)

setwd("~/Desktop/mffuk/bakalarka/ZETA_Klimes")
load("zeta.RData")
setwd("~/Desktop/mffuk/bakalarka/ZETA_Klimes/data")

station_name <- "NPS_1220_TMS"
da <- read.csv(paste(station_name,"_a.csv",sep=""),sep=";",header=FALSE)
db <- read.csv(paste(station_name,"_b.csv",sep=""),sep=";",header=FALSE)
lok <- zeta[zeta$ID_lokalit == station_name,]

da <- da[,1:9]
colnames(da) <-  c("n","name","b","date","temp-6cm","temp2cm","temp15cm","humraw","hum")

db <- db[,1:5]
colnames(db) <- c("n","name","b","date","temp2m")

dat <- c()
dat <- str_split_fixed(da$date," ",2)
da$date <- dat[,1]
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
db$date <- dat[,1]
db$time <- dat[,2]
dat <- str_split_fixed(db$date,"\\.",3)
db$day <- dat[,1]
db$month <- dat[,2]
db$year <- dat[,3]
dat <- str_split_fixed(db$time,"\\:",3)
db$hour <- dat[,1]
db$minute <- dat[,2]
db$second <- dat[,3]

#Histogram pro maximalni teploty ve 2m
par(mfrow=c(1,2))

f <- function(x) max(db$temp2m[db$date == x])
db_Tdaymax <- data.frame(date = unique(db$date), tmax = sapply(unique(db$date),f))
dat <- str_split_fixed(db_Tdaymax$date,"\\.",3)
db_Tdaymax$month <- dat[,2]
row.names(db_Tdaymax) <- 1:nrow(db_Tdaymax)

g1 <- ggplot(db_Tdaymax, aes(x=as.factor(month), y=tmax), fill=class) + geom_point(position = "jitter",fill="slateblue", alpha=0.2)+geom_boxplot(fill="slateblue", alpha=0.8, notch = TRUE, coef = 999)

#Histogram pro maximalni teploty v +15cm (tedy pod zemi)
f <-  function(x) max(da$temp15cm[da$date == x])
da_Tdaymax <- data.frame(date = unique(da$date), tmax15cm = sapply(unique(da$date),f))
dat <- str_split_fixed(da_Tdaymax$date,"\\.",3)
da_Tdaymax$month <- dat[,2]
row.names(da_Tdaymax) <- 1:nrow(da_Tdaymax)

g2 <- ggplot(da_Tdaymax, aes(x=as.factor(month), y=tmax15cm), fill=class) + geom_point(position = "jitter",fill="slateblue", alpha=0.2)+geom_boxplot(fill="slateblue", alpha=0.8, notch = TRUE, coef = 999)

grid.arrange(g1, g2, ncol=2)
par(mfrow=c(1,1))

############################################
#Rozlozeni teplot ve 2m, jake ma rozdeleni?
g3 <- ggplot(db, aes(x=temp2m)) + geom_histogram()
qqnorm((db$temp2m-mean(db$temp2m))/sd(db$temp2m))
abline(0, 1, col = 'red')
skewness(db$temp2m)

#Spocteme Spearmanův korelacní koeficient pro vsechny teploty mezi sebou
m <- matrix(unlist(cbind(da[,5:7],db$temp2m)),ncol=4)
m <- m[!rowSums(!is.finite(m)),] 
M <- cor(m,method="pearson")
M

