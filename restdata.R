
data<-read.csv("restdata.csv", sep=",", header=TRUE)
#combine all category vectors into a long string
cats<-paste(data$businesses.categories)
#switch to lowercase to compare strings
cats<-tolower(cats)
#extract only unique words from each category string, as each string represents a resto
cats<-vapply(lapply(strsplit(cats, " "), unique), paste, character(1L), collapse = " ")
#put everyithing back together in one big string
cats<-paste(cats, collapse=' ')
#split string by individual words into a vector
split_cats<-unlist(strsplit(cats, split=", "))


top_category<-unlist(as.vector(names(sort(table(split_cats),decreasing=TRUE)[1:1])))