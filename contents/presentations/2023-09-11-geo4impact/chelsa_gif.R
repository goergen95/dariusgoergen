library(stars)
library(sf)
library(lubridate)
library(rnaturalearth)
library(RColorBrewer)
library(animation)
Sys.setenv(GTIFF_SRS_SOURCE = "EPSG")

urls <- readLines("assets/chelsa-prec.txt") |> trimws()
contintents <- ne_coastline(returnclass = "sf")
bb <-  st_bbox(c(xmin = -170, ymin = -60, xmax = 170, ymax = 60), crs = st_crs(4326))

sf_use_s2(F)
contintents <- st_intersection(contintents, st_as_sfc(bb))
sf_use_s2(T)

precipitation <- lapply(urls, function(url){
  print(url)
  tmp <- read_stars(paste0("/vsicurl/", url))
  names(tmp) <- "prec"
  tmp[bb]
})

precipitation$along <- "month"
precipitation <- do.call(c, precipitation)
precipitation <- st_set_dimensions(
  precipitation, "month",
  months(seq(as.Date("2000-01-01"), as.Date("2000-12-31"), by = "month"), abbreviate = T)
)

pal <- rev(RColorBrewer::brewer.pal(n = 9, name = "Spectral"))
breaks <- c(0, 2.5, 5, 10, 20, 30, 50, 100, 200, 1500)

saveGIF({
  for (i in seq_len(12)) {
    plot(precipitation[,,,i],
         main = st_get_dimension_values(precipitation, "month")[i],
         breaks = "quantile",
         downsample = 80,
         key.pos = NULL,
         col = pal,
         reset = FALSE)
    plot(contintents, col = "black", lwd = 2, add = T)
  }
}, movie.name = "chelsa-V2-pr-1981-2010.gif", ani.height = 400, ani.width = 960)
