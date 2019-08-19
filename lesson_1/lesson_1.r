# You can load in a package using library()
# Install ggplot2 by going to "Packages" section of RStudio and typing in name of package
# Comments ar done using '#'
# Command + Enter combo (OSX only) allows you to run a given script in the console

library(ggplot2)


# Use "<-" to initilize a variable and for assignment

filename <- "lesson_1/Encode_HMM_data.txt"

# read.csv is a function that we can use to read in a file in a workable format
# in R, bools are CAPITALIZED
my_data <- read.csv(filename, sep="\t", header=FALSE)
# head function looks at the top 6 rows of my_data
head(my_data)

#[1:4] is basically 1,2,3,4. This is UNLIKE Python.
# names() returns the name of the headers/columns for a given data-frame
names(my_data)[1:4] <- c("chrom", "start", "stop", "type")
head(my_data)

# use ggplot2 library to plot my_data | ggplot() is a function of ggplot2 library
# geom_bar() is a function to create bar plots; aes == aesthetics ("how do we want plot to look?")


ggplot(my_data, aes(x=chrom, fill=type)) + geom_bar()


# Save the plot to a file

# creates a png file within a particular directory
png("lesson_1/hmm_plot.png")
# Creates the plot for that particular png
ggplot(my_data, aes(x=chrom, fill=type)) + geom_bar()
# dev.off() tells program to stop making any changes to the plot
# and to save it onto the file
dev.off()

tiff("lesson_1/hmm_plot.tiff")
ggplot(my_data, aes(x=chrom, fill=type)) + geom_bar()
dev.off()

jpeg("lesson_1/hmm_plot.jpeg")
ggplot(my_data, aes(x=chrom, fill=type)) + geom_bar()
dev.off()

pdf("lesson_1/hmm_plot.pdf")
ggplot(my_data, aes(x=chrom, fill=type)) + geom_bar()
dev.off()

# Super High Resolution PNG!
png("lesson_1/hmm_plot.png", 1000, 1000)
ggplot(my_data, aes(x=chrom, fill=type)) + geom_bar()
dev.off()
