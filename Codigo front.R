#Free Text
ui <- fluidPage(
  textInput("name", "What's your name?"),
  passwordInput("password", "What's your password?"),
  textAreaInput("story", "Tell me about yourself", rows = 3)
)

# When you have short space
textInput("name", label = NULL, placeholder = "Your name")

#Input Numerical 
ui <- fluidPage(
  numericInput("num", "Number one", value = 0, min = 0, max = 100),
  sliderInput("num2", "Number two", value = 50, min = 0, max = 100),
  sliderInput("rng", "Range", value = c(10, 20), min = 0, max = 100)
)


#Dates
ui <- fluidPage(
  dateInput("dob", "When were you born?"),
  dateRangeInput("holiday", "When do you want to go on vacation next?")
)

# Dates in slide
sliderInput("sld", label = "When should we deliver", value = as.Date(1, origin = "2022-09-16"), 
            min = as.Date(0, origin = "2022-09-16"),
            max = as.Date(7, origin = "2022-09-16"),
            timeFormat = "%F")

#Limited options
animals <- c("dog", "cat", "mouse", "bird", "other", "I hate animals")

ui <- fluidPage(
  selectInput("state", "What's your favourite state?", state.name),
  radioButtons("animal", "What's your favourite animal?", animals)
)

## Select multiple options in large variables
ui <- fluidPage(
  selectInput(
    "state", "What's your favourite state?", state.name,
    multiple = TRUE
  )
)

## Select multiple options in short variables
ui <- fluidPage(
  checkboxGroupInput("animal", "What animals do you like?", animals)
)

## Question like yes or no
ui <- fluidPage(
  checkboxInput("cleanup", "Clean up?", value = TRUE),
  checkboxInput("shutdown", "Shutdown?")
)

# Upload a file 
ui <- fluidPage(
  fileInput("upload", NULL)
)

# Button action
ui <- fluidPage(
  actionButton("click", "Click me!"),
  actionButton("drink", "Drink me!", icon = icon("cocktail"))
)
#> This Font Awesome icon ('cocktail') does not exist:
#> * if providing a custom `html_dependency` these `name` checks can 
#>   be deactivated with `verify_fa = FALSE`

###Size buttons
ui <- fluidPage(
  fluidRow(
    actionButton("click", "Click me!", class = "btn-danger"),
    actionButton("drink", "Drink me!", class = "btn-lg btn-success")
  ),
  fluidRow(
    actionButton("eat", "Eat me!", class = "btn-block")
  )
)