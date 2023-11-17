epa_http <- read.table("epa-http/epa-http.csv",sep = " ", quote = '"', fill = TRUE)

colnames(epa_http) <-c("host", "timestamp", "request", "status", "bytes")

#Carga de CSV 
#library(readr)
#epa_http <- read_table("epa-http/epa-http.csv", col_names = FALSE, col_types = NULL)
#asignacion de headers
#colnames(epa_http) <-c("host", "timestamp", "method", "path", "http_ver", "status", "bytes")

library(stringr)
library(data.table)

#limpieza de datos
#epa_http$method <- str_replace(epa_http$method, "\"", "")
#epa_http$http_ver <- str_replace(epa_http$http_ver, "\"", "")

#Cambio de string a datetime
epa_http$timestamp <- as.POSIXct(epa_http$timestamp, format="[%d:%H:%M:%S]", tz="UTC")

epa_http <- tidyr::separate(epa_http, request, c("method", "path", "http_ver"), sep = " ")

View(epa_http)

