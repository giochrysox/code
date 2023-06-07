setwd("C:/Users/nicki/Desktop/TS14")
library(glue)
library(jsonlite)
EggnogID<-'KOG0690'
url <- glue('http://eggnogapi45.embl.de/nog_data/json/go_terms/{EggnogID}')
GoTerms <- fromJSON(url) 
A<- rbind(GoTerms$go_header,GoTerms$go_terms$`Molecular Function`,GoTerms$go_terms$`Biological Process`,GoTerms$go_terms$`Cellular Component`)
write.csv



