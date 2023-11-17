df <- read.table("epa-http/epa-http.csv",sep = " ", quote = '"', fill = TRUE)

colnames(df) <-c("host", "timestamp", "request", "status", "bytes")

          