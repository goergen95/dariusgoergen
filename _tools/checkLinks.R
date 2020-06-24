# script to check if links are not broken
library(magrittr)
dir = "_posts/"
mds = fs::dir_ls(dir, glob = "*.md")
get_links <- function(filepath){
readLines(filepath) %>%
    glue::glue_collapse(sep = "\n") %>%
    commonmark::markdown_html(normalize = T,
                              extensions = T) %>%
    xml2::read_html() %>%
    xml2::xml_find_all("//a") %>%
    xml2::xml_attr("href") -> urls
  
  tibble::tibble(file = filepath,
                 url = urls)
    
}
all_urls = purrr::map_df(mds, get_links)
# remove localhost 
all_urls = all_urls[-grep("localhost", all_urls$url),]
# check if reachable
check = lapply(all_urls$url, function(url){
  crul::ok(url)
})
# return urls which are not ok 
errors = all_urls[!unlist(check), ]
errors$url
