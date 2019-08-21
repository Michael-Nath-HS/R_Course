#Lesson 3: Interrogating your data

library(ggplot2)

filename <- "lesson_3/Encode_HMM_data.txt"

my_data <- read.csv(filename, sep="\t", header=FALSE)

head(my_data)

names(my_data)[1:4] <- c("chrom", "start", "stop", "type")

ggplot(my_data, aes(x=chrom, fill=type)) + geom_bar()

dim(my_data)


# We can ask our data some questions
# For categorical values, summary will give you how many rows have a given value
# For numerical values, summary will let you know some statistical calculations 

summary(my_data)

# using "$", we can break down the data further

summary(my_data$chrom)
summary(my_data$type)
summary(my_data$start)
summary(my_data$stop)

#by using "$", you can even create new columns with data in our data-frame
my_data$size = my_data$stop - my_data$start
# you can get basic stats on a given column using mean(), sd(), median(), max(), min()
summary(my_data$size)

mean(my_data$size)
sd(my_data$size)
median(my_data$size)
max(my_data$size)
min(my_data$size)