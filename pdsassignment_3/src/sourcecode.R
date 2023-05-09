#installing required packages
install.packages("tidytext")
install.packages("dplyr")
install.packages("wordcloud")
install.packages("tm")
install.packages("ggplot2")

# Load required libraries
library(tidytext)
library(dplyr)
library(ggplot2)
library(tm)
library(wordcloud)
library(SnowballC)

#Loading data
Data<- read.csv("../data_clean/Corona_NLP_test.csv")
print(Data)


# Tokenizationn and doing stop word rmoval
tokens <- Data %>%
  unnest_tokens(word, OriginalTweet)%>% anti_join(get_stopwords(),by="word")





# Count word frequencies
word_freq <- tokens %>%
  count(word, sort = TRUE)



# Creating word cloud
png("C:/pdsassignment_3/results/wordcloud.png", width = 800, height = 800, units = "px")
wordcloud(words = word_freq$word, freq = word_freq$n, min.freq = 1,
          max.words = 200, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))
dev.off()

