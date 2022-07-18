library(RColorBrewer)
library(tm)
library(wordcloud)

# text <- readLines("news.txt")
text <- readLines("trump.txt",encoding = "UTF-8")
# 지시사항 1번을 수행하세요.
doc_ids <- seq(1, length(text), 1)
df <- data.frame(doc_id = doc_ids, text = text, stringsAsFactors = FALSE)
head(df)
# 지시사항 2번을 수행하세요.
docs <- Corpus(DataframeSource(df))

# 지시사항 3번을 수행하세요.
docs <- tm_map(docs, content_transformer(tolower))
inspect(head(docs))
# 불용어 및 불필요한 단어들을 제거하는 과정입니다. 수정하지 마세요.
docs <-
  tm_map(
    docs,
    removeWords,
    c("advertisement", "said", "will", "also", "new")
  )
docs <- tm_map(docs, removeWords, stopwords("english"))

# wordcloud를 그리는 과정입니다. 수정하지 마세요.
pal <- brewer.pal(8, "Dark2")
set.seed(1234)

wordcloud(
  docs,
  min.freq = 5,
  random.order = F,
  rot.per = .1,
  scale = c(4, 0.3),
  colors = pal
)


