
library(shiny)
library(tidyverse)
library(DT)
library(ggplot2)
#inputFile(read.xlsx("Extraccion de datos texto completo_updated.xlsx", sheet = 2))

#shinyUI(fluidPage(
  #  tabsetPanel(tabPanel("All Data", 
  #                       titlePanel("In patients wirth venous thromboembolism associated with 
#                        cancer, is apixaban more effectiv than dalteparin as a 
#                        treatment for reducing bleeding?"),
#                       fluidRow(column(DT::dataTableOutput("RawData"),
#                                       width = 12))
#  ),  
#  tabPanel("tab 2", "contents"), 
#  tabPanel("tab 3", "contents"))

freqpoly <- function(x1, x2, binwidth = 0.1, xlim = c(-3,3)) {
  df <- data.frame(
    x = c(x1, x2),
    g = c(rep("x1", length(x1)), rep("x2", length(x2)))
  )
  
  ggplot(df, aes(x, colour = g)) + 
    geom_freqpoly(binwidth = binwidth, size = 1) +
    coord_cartesian(xlim = xlim)
}

t_test <- function(x1, x2) {
  test <- t.test(x1, x2)
  
  # use sprintf() to format t.test() results compactly
  sprintf(
    "p value: %0.3f\n[%0.2f, %0.2f]",
    test$p.value, test$conf.int[1], test$conf.int[2]
  )
}

x1 <- rnorm(100, mean = 0, sd = 0.5)
x2 <- rnorm(200, mean = 0.15, sd = 0.9)

freqpoly(x1, x2)
cat(t_test(x1,x2))

shinyUI(fluidPage(
  fluidRow(
    column(4,
           "Distribution 1", 
           numericInput("n1", label = "n", value = 1000, min = 1),
           numericInput("mean1", label = "µ", value = 0, step = 0.1),
           numericInput("sd1", label = "σ", value = 0.5, min = 0.1, step = 0.1)
    ),
    column(4, 
           "Distribution 2",
           numericInput("n2", label = "n", value = 1000, min = 1),
           numericInput("mean2", label = "µ", value = 0, step = 0.1),
           numericInput("sd2", label = "σ", value = 0.5, min = 0.1, step = 0.1)
    ),
    column(4,
           "Frequency polygon",
           numericInput("binwidth", label = "Bin width", value = 0.1, step = 0.1),
           sliderInput("range", label = "range", value = c(-3, 3), min = -5, max = 5)
    )
  ),
  fluidRow(
    column(9, plotOutput("hist")),
    column(3, verbatimTextOutput("ttest"))
  )
))
