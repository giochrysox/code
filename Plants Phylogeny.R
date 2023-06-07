rm(list=ls())
setwd("C:/Users/nicki/Desktop/TS8")
require(bold)
bold_seqspec(taxon='Jatropha curcas') 
bold_seqspec(taxon='Jatropha curcas', format='xml') 
bold_seqspec(taxon='Jatropha curcas', response=TRUE) 
res <- bold_seqspec(taxon='Jatropha curcas', sepfasta=TRUE) 
res$fasta
write.csv(res, "Jatropha Curcas-FASTA.csv")
#----------------------------------------------------------------------------------
#we repeat the process for all plants and combine the .fasta files into allFASTA.fas
#----------------------------------------------------------------------------------
rm(list=ls())
require(DECIPHER)
fas <- "C:/Users/nicki/Desktop/TS8/allFASTA.fas"

dna <- readDNAStringSet(fas)
dna
dna<-RemoveGaps(dna)
DNA <- AlignSeqs(dna) # align the sequences directly without translation
DNA <- AlignTranslation(dna) # align the translation then reverse translate
#write the aligned sequences to a FASTA file
writeXStringSet(DNA, file="C:/users/NICKI/Desktop/TS8/msaPLANTS.fasta")

BrowseSeqs(DNA, highlight=0)
DNA_adjusted <- AdjustAlignment(DNA)
DNA_staggered <- StaggerAlignment(DNA)
d <- DistanceMatrix(DNA_staggered)
tree <- plot(hclust(dist(d)))

