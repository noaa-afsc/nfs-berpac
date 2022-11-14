temp_interp <- function(data) {
  doy <- lubridate::yday(data$date)
  nx = max(doy)-min(doy)
  ny = min(data$depth)*-1
  res <- akima::interp(
    x=doy,
    y=data$depth,
    z=data$max_te,
    duplicate = "mean", nx = nx, ny = ny) %>% 
    akima::interp2xyz() %>% 
    as_tibble() %>% 
    rename(doy = x, depth = y, max_te = z) %>% 
    na.omit()
}
