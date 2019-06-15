basURL <- "http://membership.developer.factiva.com/3.6/api/"
id <- "PILEG51"
pwd <- "inazuma79"

fac_log <- function(basURL, id, pwd) {
  paste0(basURL, "PerformLogin?userid=", id, "&password=", pwd, "&namespace=16")
}

httr::GET("http://retrieval.developer.factiva.com/3.6/api/GetArticle?sid=27137ZzZINAUQSKTAAAGUAIAAAAAADQYAAAAAA&references=distdoc%3Aarchive%2FArchiveDoc%3A%3AArticle%2FEXPNSN0020061220e3110000z%2Cdistdoc%3Aarchive%2FArchiveDoc%3A%3AArticle%2FBBD0000020061221e3110000g &responseDataSet=FULL")

rcites_res <- function(q_url, token, ...) {
    con <- rcites_get(q_url, token, ...)
    # check status
    httr::stop_for_status(con)
    # parsed
    httr::content(con, "parsed", ...)
}

httr::GET(q_url, httr::add_headers(token), ...)
paste0()


con <- rcites_get(q_url, token, ...)
# check status
httr::stop_for_status(con)
# parsed
httr::content(con, "parsed", ...)



library(stringr)
library(lubridate)
# list of rtf files
gg <- lapply(list.files("inst/media/", pattern = "rtf$", full.names = TRUE), readLines)
##
tt <- lapply(gg, Filter, f = function(x) grepl("HYPERLINK", x)) %>%
  lapply(str_extract,
    pattern = "uc2 [0-9]{1,2} [A-Z][a-z]{2,9} 201[6-9]\\,") %>%
    lapply(gsub, rep = "", pat = "uc2 ") %>%
    lapply(gsub, rep = "", pat = "\\,$") %>% lapply(dmy)
gg <- as_date(do.call(c, tt)) %>% ymd

table(paste0(year(gg), "-", month(gg)))


ff <- str_extract(tt, pattern = "[0-9]{1,2} [A-Z][a-z]{2,9} 201[6-9]")



# "biodiversity" or "ecosystem services" or "endangered species" or "IPBES"
# journal <- x("The Guardian", )

# The Globe and Mail, National Post, The Toronto Star, Winnipeg Free Press
# The New York Times, USA Today, The Wall Street Journal,
# The Washington Post, Financial Times, The Guardian, The Independent
# The Times
