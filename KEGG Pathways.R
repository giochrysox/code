rm(list = ls())
library(KEGGREST)
library(png)
#Retrieve the png file of a pathway

png <- keggGet("path:hsa04310", "image")
writePNG(png, 'WNT-signaling-pathway.png')
# Mark pathway by the genes of interest and color them
url <- mark.pathway.by.objects("path:hsa04310",
                               c("hsa:207","hsa:60529","hsa:367","hsa:596","hsa:23476","hsa:595","hsa:1392","hsa:1499","hsa:22943","hsa:147409","hsa:1879",
                                 "hsa:10913","hsa:2250","hsa:2252","hsa:9734","hsa:55806","hsa:3479","hsa:3630","hsa:3662","hsa:354","hsa:121391","hsa:9119",
                                 "hsa:3892","hsa:55366","hsa:200879","hsa:10161","hsa:4047","hsa:4137","hsa:4524","hsa:4790","hsa:4851","hsa:5727","hsa:5743",
                                 "hsa:5970","hsa:861","hsa:6462","hsa:6469","hsa:4089","hsa:6615","hsa:6662","hsa:6716","hsa:7042","hsa:7124","hsa:8626",
                                 "hsa:117581","hsa:7421","hsa:80326","hsa:7480"
))
# Show pathway in the browser
if(interactive()){
  browseURL(url)
}
