options(shiny.autoreload = TRUE)
shiny::runApp()

# Para ver el origen del problema = traceback()

library(glue)
name <- "Hadley"
message(glue("Hello {name}"))
