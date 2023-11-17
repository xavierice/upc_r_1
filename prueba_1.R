#df <- read.table("epa-http/epa-http.csv",sep = " ", quote = '"', fill = TRUE)

#colnames(df) <-c("host", "timestamp", "request", "status", "bytes")


library(readr)
epa_http <- read_table("epa-http/epa-http.csv", col_names = FALSE)

colnames(epa_http) <-c("host", "timestamp", "method", "path", "http_ver", "status", "bytes")

View(epa_http)