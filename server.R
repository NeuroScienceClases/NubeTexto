# Text of the books downloaded from:
# A Mid Summer Night's Dream:
#  http://www.gutenberg.org/cache/epub/2242/pg2242.txt
# The Merchant of Venice:
#  http://www.gutenberg.org/cache/epub/2243/pg2243.txt
# Romeo and Juliet:
#  http://www.gutenberg.org/cache/epub/1112/pg1112.txt

function(input, output, session) {
  # Define a reactive expression for the document term matrix
  terms <- reactive({
    # Change when the "update" button is pressed...
    input$update
    # ...but not for anything else
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTermMatrix(input$text)
      })
    })
  })
  
  # Make the wordcloud drawing predictable during a session
  wordcloud_rep <- repeatable(wordcloud)
  #wordcloud_rep <- repeatable(wordcloud2)
  output$plot <- renderPlot({
    v <- terms()
    wordcloud_rep(names(v), v, scale=c(2.4,0.4),
                 min.freq = input$freq, max.words=input$max,
                  colors=brewer.pal(8, "Dark2"),res=3000)
   # wordcloud_rep(cbind(names(v),v))
  })
}