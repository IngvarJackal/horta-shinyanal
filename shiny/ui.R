library(shiny)

shinyUI(fluidPage(
  titlePanel("Top 10 flooders"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("date", "Date:", choices=as.character(seq(Sys.Date(), length=30, by="-1 day")))
      ),
  
    mainPanel(
      plotOutput("plot")
    )
  )
))