fluidPage(
  # Application title
  titlePanel("Word Cloud"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
                  textInput("text","Pegue la direccion del PDF"),
     #selectInput("selection", "Choose a book:",
                  #choices = books),
      actionButton("update", "Actualizar"),
      hr(),
      sliderInput("freq",
                  "Frecuencia Minima:",
                  min = 1,  max = 50, value = 15),
      sliderInput("max",
                  "Numero maximo de palabras:",
                  min = 1,  max = 300,  value = 100)
    ),
    
    # Show Word Cloud
    mainPanel(
      plotOutput("plot")
    )
  )
)
