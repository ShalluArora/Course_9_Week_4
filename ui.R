library(shiny)

shinyUI(fluidPage(
  titlePanel("Effective ness of Insect Spray"),
  
  sidebarLayout(
    sidebarPanel(
        selectInput("plottype", "1. Plot type", choices = c("Scatterplot", "Boxplot")),
        sliderInput("obs", "2. Select Number of Observations", min=6, max=72, value=30)
    ),
    mainPanel(
        tabsetPanel(type = "tabs",
        tabPanel("Plot", br(), plotOutput("p") ),
        tabPanel("Documentation", br(), verbatimTextOutput("documentation")),
        tabPanel("Summary", verbatimTextOutput("summary"))
    ))
  )
      
))