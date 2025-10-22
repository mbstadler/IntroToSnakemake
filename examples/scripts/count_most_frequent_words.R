words <- tolower(readLines(snakemake@input[["txt"]]))
stopwords <- tolower(readLines(snakemake@input[["stopwords"]]))
words <- words[!words %in% stopwords]
wordcount <- table(words)
wordcount <- sort(wordcount, decreasing = TRUE)
sel <- 1:as.numeric(snakemake@wildcards["n"])
tab <- data.frame(word = names(wordcount)[sel],
                  count = as.numeric(wordcount[sel]))
write.table(tab, file = snakemake@output[[1]], sep = "\t", quote = FALSE, row.names = FALSE)
