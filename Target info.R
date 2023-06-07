#Clear the global environment
rm(list = ls())
#Load KEGGREST library
library (KEGGREST)
# To retrieve a KEGG gene entry,name,definition,organism,pathway,BRITE,PDB codes
# This example is for the AR gene (KEGG Id=367)
ENTRY2 <- keggGet("hsa:367")[[1]]$ENTRY 
NAME2 <- keggGet("hsa:367")[[1]]$NAME
ORGANISM2 <- keggGet("hsa:367")[[1]]$ORGANISM
PATHWAY2 <- keggGet("hsa:367")[[1]]$PATHWAY
BRITE2 <- keggGet("hsa:367")[[1]]$BRITE
STRUCTURE2 <- keggGet("hsa:367")[[1]]$STRUCTURE
# The resulting .csv contains all the info above
write.csv(rbind(ENTRY2,NAME2,ORGANISM2,PATHWAY2,BRITE2,STRUCTURE2),
          file = "hsa367-GENEINFO.csv", row.names = T) 
# Code below gives the AA and DNA sequences of the gene
AASEQ2 <- keggGet("hsa:367")[[1]]$AASEQ
NTSEQ2 <- keggGet("hsa:367")[[1]]$NTSEQ
write.csv (AASEQ2, file = "hsa367-AASEQUENCE.csv", row.names = T) 
write.csv (NTSEQ2, file = "hsa367-NTSEQUENCE.csv", row.names = T)