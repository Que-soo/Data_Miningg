setwd("C:/DataMining/Wordcloud")

# install.packages(tm)
# install.packages(SnowballC)
# install.packages(wordcloude)
# install.packages(RColorBrewer)

library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

# part1
text <- readLines("feedback.txt", encoding = "UTF-8", warn = FALSE)
text <- paste(text, collapse = " ")

text_corpus <- Corpus(VectorSource(text))

# text preprocessing
# tolowercase
text_clean <- tm_map(text_corpus, content_transformer(tolower))
# remove num
text_clean <- tm_map(text_clean, removeNumbers)
# remove everything except letter
text_clean <- tm_map(text_clean, content_transformer(function(x) gsub("[^a-z ]", " ", x)))
#remove common english stopword
text_clean <- tm_map(text_clean, removeWords, stopwords("english"))
# remove unnecessary extra spaces
text_clean <- tm_map(text_clean, stripWhitespace)
# stemming
text_clean <- tm_map(text_clean, stemDocument)

# Part 2
#crete tdm
tdm <- TermDocumentMatrix(text_clean)
# convert tdm to matrix
m <- as.matrix(tdm)
# computes the total frequency of each word and sorts from highest → lowest
word_freqs <- sort(rowSums(m), decreasing = TRUE)
# Creates a data frame with two columns: word, frequency
df <- data.frame(word = names(word_freqs), freq = word_freqs)

# Show top 10 words
top10 <- head(df, 10)
print(top10)


png("wordcloud_exam.png", width = 800, height = 600)

set.seed(1234)

wordcloud(
  words = df$word,
  freq = df$freq,
  min.freq = 2,
  max.words = 1000,
  random.order = FALSE,
  rot.per = 0.35,
  scale = c(4, 0.5),
  colors = brewer.pal(8, "Dark2")
)
# Closes the graphics device 
dev.off()

# part 4
# creates a separate wordcloud
rare_df <- subset(df, freq == 1)

png("wordcloud_rare.png", width = 800, height = 600)

wordcloud(
  words = rare_df$word,
  freq = rare_df$freq,
  min.freq = 1,
  max.words = nrow(rare_df),
  random.order = FALSE,
  rot.per = 0.35,
  scale = c(4, 0.5),
  colors = brewer.pal(8, "Dark2")
)

dev.off()
