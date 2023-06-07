rm(list=ls())
#To retrieve DDI data using Pubchem CID. We first need to load ddis.csv
Drug_Drug_Interactions <- read.csv ('C:/Users/nicki/Desktop/TS10/ddis.csv')
# 57363 is Finasterides PubChem CID
Finasteride_ddis<- subset.data.frame(Drug_Drug_Interactions, DRUG1.CID == "57363") 
write.csv(Finasteride_ddis, file = "Finasteride_DrugDrugInteractions.csv")
# 4201 is Minoxidil's PubChem CID
Minoxidil_ddis<- subset.data.frame(Drug_Drug_Interactions, DRUG1.CID == "4201") 
write.csv(Minoxidil_ddis, file = "Minoxidil_DrugDrugInteractions.csv")
# 5311027 is Bimatoprost's PubChem CID
Bimatoprost_ddis<- subset.data.frame(Drug_Drug_Interactions, DRUG1.CID == "5311027") 
write.csv(Bimatoprost_ddis, file = "Bimatoprost_DrugDrugInteractions.csv")
# 6918296 is Dutasteride's PubChem CID
Dutasteride_ddis<- subset.data.frame(Drug_Drug_Interactions, DRUG1.CID == "6918296") 
write.csv(Dutasteride_ddis, file = "Dutasteride_DrugDrugInteractions.csv")
# 25804 is Carpronium chloride's PubChem CID
Carpronium_ddis<- subset.data.frame(Drug_Drug_Interactions, DRUG1.CID == "25804") 
write.csv(Carpronium_ddis, file = "Carpronium_DrugDrugInteractions.csv")
# 171548 is Biotin's PubChem CID
Biotin_ddis<- subset.data.frame(Drug_Drug_Interactions, DRUG1.CID == "171548") 
write.csv(Biotin_ddis, file = "Biotin_DrugDrugInteractions.csv")
# 68570 is Alfatradiol's PubChem CID
Alfatradiol_ddis<- subset.data.frame(Drug_Drug_Interactions, DRUG1.CID == "68570") 
write.csv(Alfatradiol_ddis, file = "Alfatradiol_DrugDrugInteractions.csv")
#--------------------------------------------------------------------------------
rm(list =ls())
#To retrieve DDI data from KEGG's database using KEGG ID
library(RCurl)
library(httr)
#KEGG ID D00418 is Minoxidil
query <- 'http://rest.kegg.jp/ddi/D00418'
GET(url=query)
A <- GET(url=query)
content(A, "raw")
bin <- content(A, "raw")
writeBin(bin, "Minoxidil-DDIs.csv")
#--------------------------------------------------------------------------------
#Clear the Global Environment
rm(list=ls())
#Read pubchemcid2adr which contains ADRs for drugs from MHRA
ADRs <- read.csv ('C:/Users/nicki/Desktop/TS10/pubchem2adr.csv')

#Subset the dataframe to find ADR's caused by drugs currently used in AGA
BiotinADRS<-subset.data.frame(ADRs, X187 == "171548")
write.csv(BiotinADRS, 'Biotin-ADR.csv')
MinoxidilADRS<-subset.data.frame(ADRs, X187 == "4201")
write.csv(MinoxidilADRS, 'Minoxidil-ADR.csv')
FinasterideADRS<-subset.data.frame(ADRs, X187 == "57363")
write.csv(FinasterideADRS, 'Finasteride-ADR.csv')
BimatoprostADRS<-subset.data.frame(ADRs, X187 == "5311027")
write.csv(BimatoprostADRS, 'Bimatoprost-ADR.csv')
DutasterideADRS<-subset.data.frame(ADRs, X187 == "6918296")
write.csv(DutasterideADRS, 'Dutasteride-ADR.csv')
CarproniumADRS<-subset.data.frame(ADRs, X187 == "25804")
write.csv(CarproniumADRS, 'Carpronium-ADR.csv')
AlfatradiolADRS<-subset.data.frame(ADRs, X187 == "68570")
write.csv(AlfatradiolADRS, 'Alfatradiol-ADR.csv')

#Subset the dataframe to include drugs causing alopecia as an ADR
ALOPECIA_AS_ADR <- subset.data.frame(ADRs, Therapeutic.response.unexpected == "Alopecia")
#Write the .csv file of drugs causing alopecia as an ADR
write.csv(ALOPECIA_AS_ADR, 'alopeciaasADR.csv')

#--------------------------------------------------------------------------------
rm(list=ls())
# To retrieve adverse reported drug events from FDA database
patient <- read.table("DEMO19Q1.txt", sep = "$", header = T, fill = T, quote = "")
drug <- read.table("DRUG19Q1.txt", sep = "$", header = T, fill = T, quote = "")
reaction <- read.table("REAC19Q1.txt", sep = "$", header = T, fill = T, quote = "")
outcomes <- read.table("OUTC19Q1.txt", sep = "$", header = T, fill = T, quote = "")

# You can find individual drugs and their reported adverse events
# by specifying their names below. Brand names can also be used
df <- drug[(grepl("PROPECIA", drug$drugname, ignore.case = T) | # drug is likely to be entered as many different brand names, use this to capture them individually
              grepl("PROPECIA", drug$drugname, ignore.case = T)) & drug$drug_seq == 1, ] # drug seq 1 == suspect drug of many possible that patient is taking

df <- merge(df, reaction, by = "primaryid") # let's merge the drug file with reactions
df <- merge(df, outcomes, by = "primaryid") # we'll bring in outcomes, too
df2 <- as.data.frame(table(df$pt, df$outc_cod)) # count the instances of reactions and their outcomes
names(df2) <- c("reaction", "outcome", "count")
df2 <- df2[order(df2$count, decreasing = T), ]
write.csv(df2, "PROPECIA_FINASTERIDE-adrs.csv")
head(df2, 20) # top 20 reactions
#---------------------------------------------------------------------------------
rm(list=ls())
library(dplyr)
# Retrieves molecules indicated in a specific disease
indications  <- file.path('C://users/nicki/Desktop/TS10', 'indications.tsv') %>% read.delim(na.strings='',header = TRUE,stringsAsFactors=FALSE)
Alopecia_Indication <- subset.data.frame(indications, meddra_name=='Alopecia')
AGA_Indiaction <- subset.data.frame(indications, meddra_name=='Androgenetic alopecia')
# Retrieves side effects caused by a specific molecule and their frequency
sideeffects <- file.path('C://users/nicki/Desktop/TS10', 'side-effects.tsv') %>% read.delim(na.strings='',header = TRUE,stringsAsFactors=FALSE)
Alopecia_As_Side_Effect <- subset.data.frame(sideeffects, side_effect_name=='Alopecia')
write.csv(Alopecia_As_Side_Effect, "Alopecia_As_Side_Effect.csv")
AGA_As_Side_Effect <- subset.data.frame(sideeffects, side_effect_name=='Androgenetic alopecia')
sideterms <- file.path('C://users/nicki/Desktop/TS10', 'side-effect-terms.tsv') %>% read.delim(na.strings='',header = TRUE,stringsAsFactors=FALSE)
sidefreq <- file.path('C://users/nicki/Desktop/TS10', 'meddra_freq.tsv.gz') %>% read.delim(na.strings='',header = FALSE,stringsAsFactors=FALSE)
AlopeciaSE_Frequency <- subset.data.frame(sidefreq, V3=='C0002170')
write.csv(AlopeciaSE_Frequency, "Alopecia_SE_Frequency.csv")
AGASE_Frequency <- subset.data.frame(sidefreq, V3=='C0162311')
#---------------------------------------------------------------------------------
#Structural comparison of phytochemicals and drugs using Tool Service 9
library(ChemmineR)
library(fmcsR)
#We may retrieve SDF files from PubChem using the compoounds CID 
#for the 34 most common  phytochemicals in plants used in alopecia we have: 
compounds <- pubchemCidToSDF(c(72,135,240,370,985,1183,5281,6654,7461,8468,10467,10494,11005,17868,31253,60961,64945,92139,222284,445638,445639,445858,689043,1549106,1794427,5280343,5280443,5280445,5280450,5280805,5280863,5281520,985904,10012081,171548,4201,57363,5311027,6918296,25804,68570))
write.SDF(compounds, file = "34phytochemicals-7drugs.sdf")
#Import the sdf file
sdf <- read.SDFset("C:/users/nicki/Desktop/TS10/34phytochemicals-7drugs.sdf")
#Structurally compares a batch of compounds with a batch of compounds. 
# CMP1 is the first phytochemical compared against the other 33 phytochemicals and so on..
sdfset <- sdf
CMP1 <- fmcsBatch(sdfset[[1]], sdfset)
CMP2 <- fmcsBatch(sdfset[[2]], sdfset)
CMP3 <- fmcsBatch(sdfset[[3]], sdfset)
CMP4 <- fmcsBatch(sdfset[[4]], sdfset)
CMP5 <- fmcsBatch(sdfset[[5]], sdfset)
CMP6 <- fmcsBatch(sdfset[[6]], sdfset)
CMP7 <- fmcsBatch(sdfset[[7]], sdfset)
CMP8 <- fmcsBatch(sdfset[[8]], sdfset)
CMP9 <- fmcsBatch(sdfset[[9]], sdfset)
CMP10 <- fmcsBatch(sdfset[[10]], sdfset)
CMP11 <- fmcsBatch(sdfset[[11]], sdfset)
CMP12 <- fmcsBatch(sdfset[[12]], sdfset)
CMP13 <- fmcsBatch(sdfset[[13]], sdfset)
CMP14 <- fmcsBatch(sdfset[[14]], sdfset)
CMP15 <- fmcsBatch(sdfset[[15]], sdfset)
CMP16 <- fmcsBatch(sdfset[[16]], sdfset)
CMP17 <- fmcsBatch(sdfset[[17]], sdfset)
CMP18 <- fmcsBatch(sdfset[[18]], sdfset)
CMP19 <- fmcsBatch(sdfset[[19]], sdfset)
CMP20 <- fmcsBatch(sdfset[[20]], sdfset)
CMP21 <- fmcsBatch(sdfset[[21]], sdfset)
CMP22 <- fmcsBatch(sdfset[[22]], sdfset)
CMP23 <- fmcsBatch(sdfset[[23]], sdfset)
CMP24 <- fmcsBatch(sdfset[[24]], sdfset)
CMP25 <- fmcsBatch(sdfset[[25]], sdfset)
CMP26 <- fmcsBatch(sdfset[[26]], sdfset)
CMP27 <- fmcsBatch(sdfset[[27]], sdfset)
CMP28 <- fmcsBatch(sdfset[[28]], sdfset)
CMP29 <- fmcsBatch(sdfset[[29]], sdfset)
CMP30 <- fmcsBatch(sdfset[[30]], sdfset)
CMP31 <- fmcsBatch(sdfset[[31]], sdfset)
CMP32 <- fmcsBatch(sdfset[[32]], sdfset)
CMP33 <- fmcsBatch(sdfset[[33]], sdfset)
CMP34 <- fmcsBatch(sdfset[[34]], sdfset)
CMP35 <- fmcsBatch(sdfset[[35]], sdfset)
CMP36 <- fmcsBatch(sdfset[[36]], sdfset)
CMP37 <- fmcsBatch(sdfset[[37]], sdfset)
CMP38 <- fmcsBatch(sdfset[[38]], sdfset)
CMP39 <- fmcsBatch(sdfset[[39]], sdfset)
CMP40 <- fmcsBatch(sdfset[[40]], sdfset)
CMP41 <- fmcsBatch(sdfset[[41]], sdfset)






write.csv(CMP1, file= "CMP1.csv")
write.csv(CMP2, file= "CMP2.csv")
write.csv(CMP3, file= "CMP3.csv")
write.csv(CMP4, file= "CMP4.csv")
write.csv(CMP5, file= "CMP5.csv")
write.csv(CMP6, file= "CMP6.csv")
write.csv(CMP7, file= "CMP7.csv")
write.csv(CMP8, file= "CMP8.csv")
write.csv(CMP9, file= "CMP9.csv")
write.csv(CMP10, file= "CMP10.csv")
write.csv(CMP11, file= "CMP11.csv")
write.csv(CMP12, file= "CMP12.csv")
write.csv(CMP13, file= "CMP13.csv")
write.csv(CMP14, file= "CMP14.csv")
write.csv(CMP15, file= "CMP15.csv")
write.csv(CMP16, file= "CMP16.csv")
write.csv(CMP17, file= "CMP17.csv")
write.csv(CMP18, file= "CMP18.csv")
write.csv(CMP19, file= "CMP19.csv")
write.csv(CMP20, file= "CMP20.csv")
write.csv(CMP21, file= "CMP21.csv")
write.csv(CMP22, file= "CMP22.csv")
write.csv(CMP23, file= "CMP23.csv")
write.csv(CMP24, file= "CMP24.csv")
write.csv(CMP25, file= "CMP25.csv")
write.csv(CMP26, file= "CMP26.csv")
write.csv(CMP27, file= "CMP27.csv")
write.csv(CMP28, file= "CMP28.csv")
write.csv(CMP29, file= "CMP29.csv")
write.csv(CMP30, file= "CMP30.csv")
write.csv(CMP31, file= "CMP31.csv")
write.csv(CMP32, file= "CMP32.csv")
write.csv(CMP33, file= "CMP33.csv")
write.csv(CMP34, file= "CMP34.csv")
write.csv(CMP35, file= "CMP35.csv")
write.csv(CMP36, file= "CMP36.csv")
write.csv(CMP37, file= "CMP37.csv")
write.csv(CMP38, file= "CMP38.csv")
write.csv(CMP39, file= "CMP39.csv")
write.csv(CMP40, file= "CMP40.csv")
write.csv(CMP41, file= "CMP41.csv")

mcsBiotinMyristic <- fmcs(compounds[35], compounds[13], au=2, bu=1) 
plotMCS(mcsBiotinMyristic,regenCoords=TRUE)

mcsMinoxidilAdenosine <- fmcs(compounds[36], compounds[16], au=2, bu=1) 
plotMCS(mcsMinoxidilAdenosine,regenCoords=TRUE)

mcsFinasterideSitosterol <- fmcs(compounds[37], compounds[19], au=2, bu=1) 
plotMCS(mcsFinasterideSitosterol,regenCoords=TRUE)

mcsBimatoprostCurcumene <- fmcs(compounds[38], compounds[18], au=2, bu=1) 
plotMCS(mcsBimatoprostCurcumene,regenCoords=TRUE)

mcsDutasterideSitosterol <- fmcs(compounds[39], compounds[19], au=2, bu=1) 
plotMCS(mcsDutasterideSitosterol,regenCoords=TRUE)

mcsCarproniumHydroxybenzoic <- fmcs(compounds[40], compounds[2], au=2, bu=1) 
plotMCS(mcsCarproniumHydroxybenzoic,regenCoords=TRUE)

mcsAlfatradiolMyristic <- fmcs(compounds[41], compounds[13], au=2, bu=1) 
plotMCS(mcsAlfatradiolMyristic,regenCoords=TRUE)





