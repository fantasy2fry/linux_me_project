
bashHistoryUI <- function(id) {
  ns <- NS(id)
  
   page <- fluidPage(
    h2("Hello Bash"),
    textOutput(ns("helloWorld"))
  )
}
