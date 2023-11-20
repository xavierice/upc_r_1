#Carga de CSV 
epa_http <- read.table("C:/Users/nelsonry/Downloads/prueba_1/epa-http/epa-http.csv",sep = " ", quote = '"', fill = TRUE)
colnames(epa_http) <-c("host", "timestamp", "request", "status", "bytes")

library(stringr)
library(data.table)

#limpieza de datos
epa_http$timestamp <- as.POSIXct(epa_http$timestamp, format="[%d:%H:%M:%S]", tz="UTC")

#parceo de datos
epa_http <- tidyr::separate(epa_http, request, c("tipo", "url", "protocolo"), sep = " ")

View(epa_http)

#Pregunta 1

View(nrow(epa_http))


View(ncol(epa_http))
     
valor_medio_p <- parse_number(epa_http$bytes, na = c("-", "NA"), locale = default_locale(), trim_ws = TRUE)

mean(valor_medio_p, na.rm = TRUE)

nrow(epa_http[epa_http$host %like% '.edu' | epa_http$host %like% 'edu.' ,]) 

# Pregunta 3

hh <- dplyr::select(epa_http, timestamp) %>% mutate(day(timestamp), hour(timestamp))

colnames(hh) <- c('tiempo', 'dia', 'hora')

hh_ok <- hh %>% group_by(hora) %>% mutate(hora) %>% summarise(n = n())

max(hh_ok$n)


#Pregunta 4

maxbedu <- (epa_http[epa_http$host %like% '.edu' & epa_http$url %like% '.txt$' ,]) 

sum_pp <- parse_number(maxbedu$bytes, na = c("-", 0), locale = default_locale(), trim_ws = TRUE)


sum(sum_pp,na.rm = TRUE)


#pregunta 5

nrow(epa_http[epa_http$url == '/' ,]) 


#pregunta 6

nrow(epa_http[epa_http$protocolo != 'HTTP/0.2',]) 
