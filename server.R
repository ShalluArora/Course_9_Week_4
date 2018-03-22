library(shiny)
library(ggplot2)

shinyServer(function(input, output){
  
  InsectSprays_Obs <- reactive({
    count<-input$obs
    InsectSprays[1:count,]
  })
  
  
  output$p <- renderPlot({
    if (input$plottype == "Boxplot") {
      ggplot(InsectSprays_Obs(), aes(spray, count)) + geom_boxplot(aes(colour = spray))
    } else {
      ggplot(InsectSprays_Obs(), aes(spray, count)) + geom_point(aes(colour = spray) )
           }
  })
  
  output$documentation <-renderText({ 
    paste(
"This data set counts the number of insects in agricultural experimental units treated with different insecticides. This is a data frame with 72 observations on 2 variables.
          [,1]	count	numeric	Insect count
          [,2]	spray	factor	The type of spray
The source of this data set is library(datasets) in R. 
This shiny application provides the option to choose between Boxplot and Scatter Plot with a slider input for the no of observations to be used from the data set to display the chosen graph")
  })
  
  output$summary <- renderPrint({summary(InsectSprays)})
})

