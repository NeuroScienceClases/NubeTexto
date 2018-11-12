library(tm)
library(wordcloud)
library(memoise)
library(shiny)
library(slam)
library(pdftools)
# The list of valid books
books <<- list("A Mid Summer Night's Dream" = "summer",
               "The Merchant of Venice" = "merchant",
               "Romeo and Juliet" = "romeo")

# Using "memoise" to automatically cache the results
getTermMatrix <- memoise(function(book) {
  # Careful not to let just any name slip in here; a
  # malicious user could manipulate this value.
 # if (!(book %in% books))
 #   stop("Unknown book")
  
#  text3 <- readLines(sprintf("./%s.txt", book),
  #                  encoding="UTF-8") 
text <-pdf_text(book)
text <- iconv(text, "UTF-8")
text = iconv(text, to="ASCII//TRANSLIT")
download.file("http://www.webmining.cl/wp-content/uploads/2011/03/stopwords.es.txt", "file.txt" )
my_data <- read.delim("file.txt")

my_data<-as.character(my_data)
  myCorpus = Corpus(VectorSource(text))
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus,stripWhitespace)
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeNumbers)
  
  sw<-my_data
  sw = iconv(enc2utf8(sw), sub = "byte")
  myCorpus <- tm_map(myCorpus, removeWords, stopwords("spanish"))
  myCorpus<- tm_map(myCorpus, removeWords, sw) 
  
  
  myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1))
  
  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
})