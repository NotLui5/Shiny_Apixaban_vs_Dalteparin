library(glue)
library(shiny)

sales <- readr::read_csv("sales_data_sample.csv")
sales <- sales[c(
  "TERRITORY", "ORDERDATE", "ORDERNUMBER", "PRODUCTCODE",
  "QUANTITYORDERED", "PRICEEACH"
)]
sales

unique(sales$TERRITORY)

ui <- fluidPage(
  selectInput("territory", "territory", choices = unique(sales$TERRITORY)),
  tableOutput("selected")
)

server <- function(input, output, session) {
  selected <- reactive({
    if (input$territory == "NA") {
      subset(sales, is.na(TERRITORY))
    } else {
      subset(sales, TERRITORY == input$territory)
    }
  })
  output$selected <- renderTable(head(selected(), 10))
}

sales[sales$TERRITORY == "EMEA", ]

head(sales$TERRITORY == "EMEA", 25)

subset(sales, TERRITORY == "EMEA")

subset(sales, TERRITORY == NA)
subset(sales, is.na(sales$TERRITORY)) #right

head(sales$TERRITORY == NA, 25)

subset(sales, TERRITORY %in% NA)

shinyApp(ui = ui, server = server)

#server <- function(input, output, session) {
 # selected <- reactive({
  #  browser()
   # subset(sales, TERRITORY %in% input$territory)
  #})
  #output$selected <- renderTable(head(selected(), 10))
#}

