#Carga de CSV 
epa_http <- read.table("epa-http/epa-http.csv",sep = " ", quote = '"', fill = TRUE)
colnames(epa_http) <-c("host", "timestamp", "request", "status", "bytes")

library(stringr)
library(data.table)

#limpieza de datos
epa_http$timestamp <- as.POSIXct(epa_http$timestamp, format="[%d:%H:%M:%S]", tz="UTC")

#parceo de datos
epa_http <- tidyr::separate(epa_http, request, c("tipo", "url", "protocolo"), sep = " ")

View(epa_http)

