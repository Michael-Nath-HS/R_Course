# Importing and Downloading Data
# Where to find publicly available big data
# UCSC -- RefSeq genes from table browser
# Ensembl -- Mouse regulatory features MultiCell
# ENCODE -- HMM: wgEncodeBroadHmmGm12878HMM.bed

# save file route to a variable "filename"

filename <- "lesson_2/micro_array_results_table1.txt"

my_data <- read.csv(filename, sep="\t", header=TRUE)
head(my_data)

# Importing RefSeq_Genes

genes <- read.csv("lesson_2/RefSeq_Genes", sep="\t", header=TRUE)

head(genes)

#dim() tells you the rows and columns a given data frame has. 
dim(genes)



regulatory_genes <- read.csv("lesson_2/mus_musculus.GRCm38.Regulatory_Build.regulatory_features.20180516.gff", sep="\t", header=FALSE)
head(regulatory_genes)
dim(regulatory_genes)

chromHMM <- read.csv("lesson_2/wgEncodeBroadHmmGm12878HMM.bed", sep="\t", header=FALSE)
head(chromHMM)
dim(chromHMM)

