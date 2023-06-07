A<-read.daelim("C:/Users/nicki/Desktop/TS16/ENZYMES-TRANSPORTERS.csv")
Pgp <- subset.data.frame(A, METABOLISM.ENZYME.AND.TRANSPORTERS=='P-gp')
CYP3A4 <- subset.data.frame(A, METABOLISM.ENZYME.AND.TRANSPORTERS=='3A4')
PubChemCID <- subset.data.frame(A, PubChem.CID=='4201')
PubChemCIDandRef <- subset.data.frame(A, PubChem.CID=="4201", select = c('METABOLISM.ENZYME.AND.TRANSPORTERS','Relation','References'))

