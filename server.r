
library(dplyr)
library(ggplot2)
library(rCharts)
library(plyr)

database <- read.delim("database.txt")
database$stressPosition<-as.factor(database$stressPosition)
levels(database$wordType)<-c("Adjective","Noun","Verb")

df<-split(database,database$wordType)
df$All<-database

function(input, output) {

  # Fill in the spot we created for a plot
  output$stressPlot <- renderPlot({
    ggplot(df[[input$wordType]][df[[input$wordType]][["frequency"]]>=input$range[1]&df[[input$wordType]][["frequency"]]<=input$range[2],], 
           aes(stressPosition)) + geom_bar(aes(fill=syllableNumber))+facet_wrap(~ syllableNumber)+
      xlab("Stress position")+ylab("Count")+theme(legend.position="none")
    
    # Render a barplot

  })
}
