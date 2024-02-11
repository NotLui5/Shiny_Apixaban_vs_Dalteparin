library(shiny)
library(tidyverse)
library(DT)


#shinyServer(function(input, output) {
function(input, output, session) {
  x1 <- reactive(rnorm(input$n1, input$mean1, input$sd1))
  x2 <- reactive(rnorm(input$n2, input$mean2))
  
  
  output$hist <- renderPlot({
    freqpoly(x1(), x2(), binwidth = input$binwidth, xlim = input$range)
  }, res = 96)
  
  output$ttest <- renderText({
    t_test(x1(), x2())
  })
}
#  datos <- read.xlsx("Extraccion de datos texto completo_updated.xlsx", sheet = 2)
#  output$RawData <- DT::renderDataTable(
#    DT::datatable({
#      datos
#   }))
#})
