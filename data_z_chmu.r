library(xlsx)
library(stringr)
library(lubridate)

setwd("/home/vojta/Desktop/mffuk/bakalarka/chmu_data/")
sce_file_names <- c("C4JAPI01_SCE.csv","C1KVIL01_SCE.csv","C1BLAD01_SCE.csv","C1HKVI01_SCE.csv")
for (i_sce in sce_file_names){
    d <- read.csv(i_sce, sep = "\t")
    out <- data.frame(station_ID = substr(i_sce, 0, 8), Snowcm = c(t(d[,6:ncol(d)])), 
    day = rep(1:31, nrow(d)), month = rep(d[,4], each=31), year = rep(d[,3], each=31), hour = strsplit(d[,5], ":")[[1]][1],
    time = rep(d[,5], each=31))
    out$date <- paste(str_pad(out$day, 2, pad="0"), str_pad(out$month, 2, pad="0"), out$year, sep = ".")
    #write.csv(out, paste("f", i_sce, sep=""))
}

sra10m_file_names <- c("C1BLAD01_SRA10M.csv")
for (i_sra10m in sra10m_file_names){
    d <- read.csv(i_sra10m, sep = "\t", na.strings = "MAX")
    Precmm <- c(t(d[,6:ncol(d)]))
    n_row <- length(Precmm)
    out_prec <- data.frame(station_ID = substr(i_sra10m, 0, 8), Precmm = Precmm,
    day = rep(rep(1:31, each=24*6+1), n_row/((24*6+1)*31)), month = rep(d[,4], each=31), year = rep(d[,3], each=31),
    time = rep(unique(d[,5]), n_row/(24*6+1)))
    out_prec$hour <- sapply(strsplit(out_prec$time, ":", fixed=TRUE), "[", 1)
    out_prec$date <- paste(str_pad(out_prec$day, 2, pad="0"), str_pad(out_prec$month, 2, pad="0"), out_prec$year, sep = ".")
    out_prec <- na.omit(out_prec)
    write.csv(out_prec, paste("f", i_sra10m, sep=""))
}