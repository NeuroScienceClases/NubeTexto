fluidPage(
  # Application title
  titlePanel("NeuroScience Nube de Texo"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(h5("NeuroScience 1.0 te brinda esta aplicacion para que realizes de manera rapida los graficos de nube de texo para tus investigaciones o reportes"),
                  textInput("text","Pegue una URL de su PDF"),
     #selectInput("selection", "Choose a book:",
                  #choices = books),
      actionButton("update", "Actualizar"),
      hr(),
      sliderInput("freq",
                  " Frequencia minima:",
                  min = 1,  max = 50, value = 15),
      sliderInput("max",
                  "Numero maximo de palabras:",
                  min = 1,  max = 300,  value = 100),
     img(src = "Neuro.png", height = 70, width = 150)
    ),
    
    # Show Word Cloud
    mainPanel(
      fluidPage(
        br(),br(),
      plotOutput("plot",width = "100%"))
    )
  )
)
