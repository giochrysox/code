#Clear the Global environment
rm(list=ls())
setwd("C:/Users/nicki/Desktop/TS9")
library(ChemmineR)
library(fmcsR)
#We may retrieve SDF files from PubChem using the compoounds CID 
#for the 34 most common  phytochemicals in plants used in alopecia we have: 
compounds <- pubchemCidToSDF(c(72,135,240,370,985,1183,5281,6654,7461,8468,10467,10494,11005,17868,31253,60961,64945,92139,222284,445638,445639,445858,689043,1549106,1794427,5280343,5280443,5280445,5280450,5280805,5280863,5281520,985904,10012081))
write.SDF(compounds, file = "34phytochemicals.sdf")

#Import the sdf file
sdf <- read.SDFset("C:/users/nicki/Desktop/TS9/34phytochemicals.sdf")
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

# To retrieve the MCS plots of phytochemicals found to have Tanimoto coeff >0.85
# in the matrix produced in the previous step

mcsProtphydr <- fmcs(compounds[1], compounds[2], au=2, bu=1) 
plotMCS(mcsProtphydr,regenCoords=TRUE) 

mcsProtgallic <- fmcs(compounds[1], compounds[4], au=2, bu=1) 
plotMCS(mcsProtgallic,regenCoords=TRUE) 

mcsProtvanillic <- fmcs(compounds[1], compounds[10], au=2, bu=1) 
plotMCS(mcsProtvanillic,regenCoords=TRUE)

mcsPalmiticStearic <- fmcs(compounds[5], compounds[7], au=2, bu=1) 
plotMCS(mcsPalmiticStearic ,regenCoords=TRUE)

mcsPalmiticMyristic <- fmcs(compounds[5], compounds[13], au=2, bu=1) 
plotMCS(mcsPalmiticMyristic ,regenCoords=TRUE)

mcsVanillinVanillic<- fmcs(compounds[6], compounds[10], au=2, bu=1) 
plotMCS(mcsVanillinVanillic ,regenCoords=TRUE)

mcsStearicArachidic<- fmcs(compounds[7], compounds[11], au=2, bu=1) 
plotMCS(mcsStearicArachidic ,regenCoords=TRUE)

mcsOleanolicUrsolic<- fmcs(compounds[12], compounds[17], au=2, bu=1) 
plotMCS(mcsOleanolicUrsolic ,regenCoords=TRUE)

mcsPalmitoleicOleic<- fmcs(compounds[20], compounds[21], au=2, bu=1) 
plotMCS(mcsPalmitoleicOleic ,regenCoords=TRUE)

mcsFerulicCaffeic<- fmcs(compounds[22], compounds[23], au=2, bu=1) 
plotMCS(mcsFerulicCaffeic ,regenCoords=TRUE)

mcsQuercetinApigenin<- fmcs(compounds[26], compounds[27], au=2, bu=1) 
plotMCS(mcsQuercetinApigenin ,regenCoords=TRUE)

mcsQuercetinKaempferol<- fmcs(compounds[26], compounds[28], au=2, bu=1) 
plotMCS(mcsQuercetinKaempferol ,regenCoords=TRUE)

mcsQuercetinLuteolin<- fmcs(compounds[26], compounds[31], au=2, bu=1) 
plotMCS(mcsQuercetinLuteolin ,regenCoords=TRUE)

mcsApigeninLuteolin<- fmcs(compounds[27], compounds[28], au=2, bu=1) 
plotMCS(mcsApigeninLuteolin ,regenCoords=TRUE)

mcsApigeninKaempferol<- fmcs(compounds[27], compounds[31], au=2, bu=1) 
plotMCS(mcsApigeninKaempferol ,regenCoords=TRUE)

mcsLuteolinKaempferol<- fmcs(compounds[28], compounds[31], au=2, bu=1) 
plotMCS(mcsLuteolinKaempferol ,regenCoords=TRUE)
#-------------------------------------------------------------------------------
library(readr)
library(dplyr)
setwd("C:/Users/nicki/Desktop/TS9/TRANSLATION SERVICE")

#Load the translation csv's
CHEMBL<-read.csv('PUBCHEM-CHEMBL.CSV')
BINDINGDB<-read.csv('PUBCHEM-BINDINGDB.CSV')
ATC<-read.csv('PUBCHEM-ATC.CSV')
CHEBI<-read.csv('PUBCHEM-CHEBI.CSV')
DRUGBANK<-read.csv('PUBCHEM-DRUGBANK.CSV')
KEGG<-read.csv('PUBCHEM-KEGG.CSV')
#translate pubchem cid=4201 (minoxidil) to other databases

TranslateToCHEMBL <- subset.data.frame(CHEMBL, PUBHEM.CID=='4201')
TranslateToATC <- subset.data.frame(ATC, PUBCHEM.CID=='4201')
TranslateToBINDINGDB <- subset.data.frame(BINDINGDB, PUBCHEM.CID=='4201')
TranslateToCHEBI <- subset.data.frame(CHEBI, PUBCHEM.CID=='4201')
TranslateToDRUGBANK<-subset.data.frame(DRUGBANK, PUBCHEM.CID=='4201')
TranslateToKEGG<-subset.data.frame(KEGG, PUBCHEM=='4201')

x1<- merge(TranslateToCHEMBL,TranslateToATC)  
x2<- merge(x1, TranslateToBINDINGDB)
x3<- merge(x2, TranslateToCHEBI)
x4<- merge(x3, TranslateToDRUGBANK)
x5<- merge(x4, TranslateToKEGG)

#-------------------------------------------------------------------------------
#Clear the Global environment
rm(list=ls())
setwd("C:/Users/nicki/Desktop/TS9/")
#Load library RCurl
library(RCurl)
library(httr)
#Compare compound C00389 (quercetin)  and return 10 KEGG drugs with their similarity
query <- ("http://rest.genome.jp/simcomp/C00389/drug/limit=10")
GET(url=query)
A <- GET(url=query)
content(A, "raw")
bin <- content(A, "raw")
writeBin(bin, "simcomp C00389.csv")


#-------------------------------------------------------------------------------
# To retrieve similar SMARTS patterns
library(ChemmineR)
library(ChemmineOB)
#to load an SDF file
sdfset<-read.SDFset('C:/Users/nicki/Desktop/TS9/34phytochemicals.sdf')
smartsSearchOB(sdfset[1:34],"N#Cc1ccccc1",uniqueMatches=FALSE)

#or if you want to input compound's SMILES
molRefs = forEachMol("SMILES","C1CCCCC1\ttest-compound-name",identity)
smartsSearch_OB(molRefs,"[F,Cl,Br][CX3](=[OX1])[#1,*&!$([OH1])&!$([SH1])]")
#------------------------------------------------------------------------------
#Clear the Global environment
rm(list=ls())
#Load library rcdk
library(rcdk)
#Load molecules in SDF format
Molecules<-load.molecules("C:/Users/nicki/Desktop/TS9/34phytochemicals.sdf")
#Generate 2D-CDK descriptors
CDK1<-eval.desc(Molecules,
                "org.openscience.cdk.qsar.descriptors.molecular.AutocorrelationDescriptorCharge")
CDK2<-eval.desc(Molecules,
                "org.openscience.cdk.qsar.descriptors.molecular.AutocorrelationDescriptorMass")
CDK3<-eval.desc(Molecules,
                "org.openscience.cdk.qsar.descriptors.molecular.AutocorrelationDescriptorPolarizability")
CDK4<-eval.desc(Molecules,
                "org.openscience.cdk.qsar.descriptors.molecular.CarbonTypesDescriptor")               
CDK5<-eval.desc(Molecules,
                "org.openscience.cdk.qsar.descriptors.molecular.ChiChainDescriptor")
CDK6<-eval.desc(Molecules,
                "org.openscience.cdk.qsar.descriptors.molecular.ChiClusterDescriptor")            
CDK7<-eval.desc(Molecules,
                "org.openscience.cdk.qsar.descriptors.molecular.ChiPathClusterDescriptor")
CDK8<-eval.desc(Molecules,
                "org.openscience.cdk.qsar.descriptors.molecular.ChiPathDescriptor")
CDK9<-eval.desc(Molecules,
                "org.openscience.cdk.qsar.descriptors.molecular.EccentricConnectivityIndexDescriptor")             
CDK10<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.FMFDescriptor")
CDK11<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.FragmentComplexityDescriptor")
CDK12<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.HybridizationRatioDescriptor")
CDK13<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.KappaShapeIndicesDescriptor")
CDK14<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.KierHallSmartsDescriptor")             
CDK15<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.MDEDescriptor")
CDK16<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.PetitjeanNumberDescriptor")
CDK17<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.PetitjeanShapeIndexDescriptor")
CDK18<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.TPSADescriptor")
CDK19<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.VABCDescriptor")
CDK20<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.VAdjMaDescriptor")
CDK21<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.WeightedPathDescriptor")
CDK22<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.WienerNumbersDescriptor")                
CDK23<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.ZagrebIndexDescriptor")
CDK24<-eval.desc(Molecules, 
                 "org.openscience.cdk.qsar.descriptors.molecular.BCUTDescriptor")
CDK25<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.ALOGPDescriptor")          
CDK26<-eval.desc(Molecules,   
                 "org.openscience.cdk.qsar.descriptors.molecular.AcidicGroupCountDescriptor")
CDK27<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.AminoAcidCountDescriptor")
CDK28<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.AromaticAtomsCountDescriptor")
CDK29<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.AromaticBondsCountDescriptor")
CDK30<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.AtomCountDescriptor")
CDK31<-eval.desc(Molecules,     
                 "org.openscience.cdk.qsar.descriptors.molecular.BasicGroupCountDescriptor")
CDK32<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.BondCountDescriptor")
CDK33<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.LargestChainDescriptor")
CDK34<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.LargestPiSystemDescriptor")
CDK35<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.LongestAliphaticChainDescriptor")
CDK36<-eval.desc(Molecules,     
                 "org.openscience.cdk.qsar.descriptors.molecular.MannholdLogPDescriptor")        
CDK37<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.RotatableBondsCountDescriptor")
CDK38<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.RuleOfFiveDescriptor")
CDK39<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.WeightDescriptor")
CDK40<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.XLogPDescriptor")
CDK41<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.AminoAcidCountDescriptor")
CDK42<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.APolDescriptor")
CDK43<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.CPSADescriptor")
CDK44<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.HBondAcceptorCountDescriptor")
CDK45<-eval.desc(Molecules,
                 "org.openscience.cdk.qsar.descriptors.molecular.HBondDonorCountDescriptor")  
CDK46<-eval.desc(Molecules, 
                 "org.openscience.cdk.qsar.descriptors.molecular.TPSADescriptor")
#Write all 2D-CDK descriptors in CSV
write.csv(c(CDK1,CDK2,CDK3,CDK4,CDK5,CDK6,CDK7,CDK8,CDK9,CDK10,CDK11,CDK12,CDK13,CDK14,CDK15,CDK16,CDK17,CDK18,CDK19,CDK20,CDK21,CDK22,CDK23,CDK24,CDK25,CDK26,CDK27,CDK28,CDK29,CDK30,CDK31,CDK32,CDK33,CDK34,CDK35,CDK36,CDK37,CDK38,CDK39,CDK40,CDK41,CDK42,CDK43,CDK44,CDK45,CDK46),"cdkall2D.csv")

#Clear the Global environment
rm(list=ls())
#Load a 3D SDF file
Molecules3D<-load.molecules("C:/Users/nicki/Desktop/TS9/34phytochemicals3d.sdf")
#Generate 3D-CDK descriptors
CDK3D1<-eval.desc(Molecules3D,
                  "org.openscience.cdk.qsar.descriptors.molecular.CPSADescriptor")
CDK3D2<-eval.desc(Molecules3D,
                  "org.openscience.cdk.qsar.descriptors.molecular.GravitationalIndexDescriptor")
CDK3D3<-eval.desc(Molecules3D,
                  "org.openscience.cdk.qsar.descriptors.molecular.LengthOverBreadthDescriptor")
CDK3D4<-eval.desc(Molecules3D,
                  "org.openscience.cdk.qsar.descriptors.molecular.MomentOfInertiaDescriptor")
CDK3D5<-eval.desc(Molecules3D,  
                  "org.openscience.cdk.qsar.descriptors.molecular.PetitjeanShapeIndexDescriptor")
CDK3D6<-eval.desc(Molecules3D,  
                  "org.openscience.cdk.qsar.descriptors.molecular.WHIMDescriptor")
#Write all 3D-CDK descriptors in a CSV file
write.csv(c(CDK3D1,CDK3D2,CDK3D3,CDK3D4,CDK3D5,CDK3D6),"cdkall3D.csv")

#-------------------------------------------------------------------------------

# To CLUSTER all 34 phytochemicals

d <- sapply(cid(compounds), function(x) fmcsBatch(compounds[x], compounds, au=0, bu=0, matching.mode="aromatic")[,"Overlap_Coefficient"]) 
d 
hc <- hclust(as.dist(1-d), method="complete")
plot(as.dendrogram(hc), edgePar=list(col=4, lwd=2)) 
