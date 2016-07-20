#taken from https://rstudio-pubs-static.s3.amazonaws.com/52879_eaa8e7a9919b4bb6a2cf6e2bda587cb1.html

#this sets up the prerequisites for all the following parts

#reading all file names into a list
flist = list.files(path="babies", pattern ="*.TXT", full.names=TRUE)

#creating a unanimous data table combining all files
out <- do.call(rbind, lapply(flist, function(x) {
 df <- read.table(x, header=FALSE, sep=",")
}))

#giving column names
names(out)= c("State","Sex","Birth","Name","Fr")

str(out)

#prerequisite for following parts
install.packages("dplyr")
library(dplyr)


