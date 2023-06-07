#Clear the Global environment 
rm(list = ls())
setwd("C:/Users/nicki/Desktop/TS2")
library(RISmed)

#now let's look up the term androgenetic alopecia
res <- EUtilsSummary('androgenetic alopecia', type='esearch', db='pubmed')
summary(res)

#what are the PubMed ids for our search?
QueryId(res)

#limit by date
res2 <- EUtilsSummary('alopecia', type='esearch', db='pubmed', mindate='1950', maxdate='2021')
summary(res2)
QueryId(res2)

tally <- array()
x <- 1
for (i in 1950:2021){
  Sys.sleep(1)
  r <- EUtilsSummary('alopecia', type='esearch', db='pubmed', mindate=i, maxdate=i)
  tally[x] <- QueryCount(r)
  x <- x + 1
}

names(tally) <- 1950:2021
max(tally)

barplot(tally, las=2, ylim=c(0,1500), main="PubMed articles on ANDROGENETIC ALOPECIA")
#------------------------------------------------------------------------------
#Clear the Global environment 
rm(list = ls())
#Set TS2 folder on the desktop as the working directory
setwd("C:/Users/nicki/Desktop/TS2")
library(pubmed.mineR)
#Here we need to download a .txt file from Pubmed containing abstracts for
#the search term 'ANDROGENETIC ALOPECIA'
abstracts<-readabs("C://users/nicki/desktop/TS2/AGA.txt")
abstracts@Abstract
abstrac.bodoes<-abstracts@Abstract
abstrac.bodoes
SentenceToken(abstrac.bodoes[1])
#find word
word_atomizations(abstracts)
Words<-word_atomizations(abstracts)
write.csv(Words,"AGA-WORDS.csv")
#find gene
gene_atomization(abstracts)
abs_genes = gene_atomization(abstracts)
abs_genes
write.csv(abs_genes,"AGA-GENES.csv")
abstracts@PMID
pmids<-abstracts@PMID
PMIDS<-pmids
write.csv(PMIDS,"AGA-PMIDS.csv")
pubtator_out<-pubtator_function(pmids)
pubtator_out$Genes    # shows associated genes along with their NCBI gene number
write.csv(pubtator_out$Genes ,"AGA-genes.csv")
pubtator_out$Diseases # shows associated diseases along with their MESH Id
write.csv(pubtator_out$Diseases ,"AGA-DISEASES.csv")
pubtator_out$Chemicals # shows associated chemicals along with their MESH Id
write.csv(pubtator_out$Chemicals ,"AGA-CHEMICALS.csv")
pubtator_out$Species # shows associated species along with NCBI's Taxonomy Id
write.csv(pubtator_out$Species ,"AGA-SPECIES.csv")
#--------------------------------------------------------------------------------
