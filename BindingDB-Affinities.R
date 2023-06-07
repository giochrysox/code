setwd("C:/Users/nicki/Desktop/TS13")
library(XML)
library(httr)
xml.url <- "http://bindingdb.org/axis2/services/BDBService/getLigandsByUniprot?uniprot=P31749;100"
doc <- xmlParse(rawToChar(GET(xml.url)$content))
xL<- t(xmlToList(doc, simplify = TRUE))
data <- ldply(xL, data.frame)
write.csv(data,'BindingDB-AKT1.csv')