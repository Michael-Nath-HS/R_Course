# Lesson 4: Filtering your data
# Objectives:
  #1.) Remove chr prefixes from chromosome name
  #2.) Order the chromosomes correctly
  #3.) Pick a subset of the types and rename them. 
library(ggplot2)

filename <- "lesson_3/Encode_HMM_data.txt"

my_data <- read.csv(filename, sep="\t", header=FALSE)

head(my_data)

names(my_data)[1:4] <- c("chrom", "start", "stop", "type")

ggplot(my_data, aes(x=chrom, fill=type)) + geom_bar()

dim(my_data)


summary(my_data$chrom)
summary(my_data$type)



# levels = possibilities/categories
# remove "chr" prefix
# gsub() allows you to replace a certain substring with another substring for any given levels.
# factor() allows you to create a data object that has those new categories
my_data$chrom <- factor(gsub("chr", "", my_data$chrom))
summary(factor(gsub("chr", "", my_data$chrom)))
summary(my_data$chrom)
ggplot(my_data, aes(x=chrom, fill=type)) + geom_bar()

# seq() works like range but is inclusive on both ends
seq(1,22)

c(seq(1,22), "X", "Y")

my_data$chrom <- factor(my_data$chrom, levels=c(seq(1,22), "X", "Y"))
factor(my_data$chrom)
summary(my_data$chrom)

# Run the plot to make sure that the prefixes have been renamed and reordered
ggplot(my_data, aes(x=chrom, fill=type)) + geom_bar()

# Filter the data to just only get plots of a few, interesting types
# The %in% returns a bool value for each entry in the data frame

my_data <- my_data[my_data$type %in% c("1_Active_Promoter", "4_Strong_Enhancer", "8_Insulator"), ]
summary(my_data$type)

# Rename the types
library(plyr) # We need the revalue() function from plyr

my_data$type <- revalue(my_data$type, c("1_Active_Promoter"="Promoter", 
                                        "4_Strong_Enhancer"="Enhancer",
                                        "8_Insulator"="Insulator"))
# check the updated plot
png("lesson_4/updatedplot.png")
ggplot(my_data, aes(x=chrom, fill=type)) + geom_bar()
dev.off()








