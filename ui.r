# Use a fluid Bootstrap layout
fluidPage(   
  
  # Give the page a title
  titlePanel("Stress Position in German Words"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      
      selectInput("wordType", "Word type:", 
                  choices=c("All","Adjective","Noun","Verb")),
         
      sliderInput("range", "Word frequency range:",
                  min=0, max=5000, value=c(1,1000)),
      hr(),
      helpText("Use the dropdown menu and slider to restrict analysis to a certain word type and frequency range.")
      
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("stressPlot"),
      hr(),
      helpText("Based on the CELEX corpus for German. The pannels correspond to the syllable number of words. Stress position n indicates stress on the nth syllable.")
      
      
    )
    
  )
)

