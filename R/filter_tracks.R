filter_tracks <- function(tracks_sf) {
  
  crs <- sf::st_crs(tracks_sf)
  dat <- tracks_sf %>%
    sf::st_transform(4326) %>%
    ungroup() %>%
    arrange(deployid, datetime)
  dat_tr <- trip(dat, c("datetime","deployid"), correct_all = FALSE)
  
  suppressWarnings(
    keep <- sda(
      dat_tr,
      smax = 40 #km/hour
    )
  )
  
  tracks_filt <- dat %>%
    mutate(sda_keep = keep) %>%
    filter(sda_keep) %>%
    dplyr::select(-c(sda_keep, rank)) %>%
    st_transform(crs)
  return(tracks_filt)
}
