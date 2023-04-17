library(gstat)
library(sp)
library(tmap)

tim <- "all"
height <- "15cm"
minmax <- "min"
bayerischer_wald <- TRUE
bw_text <- ifelse(bayerischer_wald == 1, "yes", "no")
dist_cutoff <- 0
station_cutoff <- "c1chur01"

setwd("~/Desktop/mffuk/bakalarka/ZETA_Klimes")
load("zeta.RData")

if (dist_cutoff > 0){
	dist_cutoff <- paste(station_cutoff,dist_cutoff, sep="")
} else { dist_cutoff <- "" }

setwd("/home/vojta/Desktop/mffuk/bakalarka/out_fit")
dat <- na.omit(read.csv(paste("f", minmax, tim, height, "_BW", bw_text, dist_cutoff, ".csv",sep="")))[, -1] # nolint
f <- dat[,1:8]
f[, 1:7] <- signif((f[, 1:7]), 2)
colnames(f) <- c("intercept", "snowcm", "nt",
    "precmm", "month", "hum", "ffkmh", "station_name")

f$lat <- zeta$Lat_WGS84[zeta$ID_lokalit %in% f$station_name]
f$lon <- zeta$Lon_WGS84[zeta$ID_lokalit %in% f$station_name]

data <- data.frame(snowcm=f$snowcm)
f_spdf <- SpatialPointsDataFrame(cbind(f$lat, f$lon), data)
vario <- variogram(snowcm~1, f_spdf)
plt_vario <- plot(vario)
f_fvgm <- fit.variogram(vario, vgm(nugget=0.005, model="Mat", range=0.05, psill=0.01))

s <- spsample(f_spdf, type = "regular", n = 10000)
krig <- krige(snowcm ~ 1, f_spdf, newdata = s, model = f_fvgm)

krig_grid <- SpatialPixelsDataFrame(krig, krig@data)
levs <- c(-Inf, -0.02, -0.01, 0, 0.02, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.2, 0.3, Inf)
var_levs <- c(0, 3, 6, 9, 12, Inf)

krig_map_est <- tm_shape(krig_grid) +
                tm_raster(col = 'var1.pred', breaks = levs, title = 'Krigging', palette = 'Reds') +
                tm_layout(legend.bg.color = 'white', legend.frame = TRUE)

tmap_arrange(krig_map_est)
