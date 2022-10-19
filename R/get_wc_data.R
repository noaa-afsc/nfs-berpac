get_wc_data <- function() {
  ids <- c("6333a5fc17e8480e28ae482a",
           "6333a5fc17e8480e28ae482c",
           "6333a5fc17e8480e28ae482e",
           "6333a5fc17e8480e28ae4830",
           "6333a5fc17e8480e28ae4832",
           "6333c6eb17e8480e28ae4fe0",
           "633601df17e8480e28ae9e99",
           "633601e017e8480e28ae9e9d",
           "633601e017e8480e28ae9e9f",
           "633601e017e8480e28ae9ea4",
           "633601e017e8480e28ae9eaa",
           "633610f017e8480e28aea03e")
  
  res <- map(ids, wcGetDownload)
  
  locs_tbl <- map(res,"all_locations") %>% 
    bind_rows() %>% 
    drop_na(any_of(c("latitude", "longitude")))
  
  ecdf_tbl <- map(res,"ecdf") %>% 
    bind_rows()
  
  return(list(locs=locs_tbl,ecdf=ecdf_tbl))
}
