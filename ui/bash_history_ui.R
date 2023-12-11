bashHistoryUI <- function(id) {
  ns <- NS(id)
  
   page <- fluidPage(
    h2("Hello Bash"),
    textOutput(ns("helloWorld")),
    # To tak testowo
    selectInput("file", 
                label = "Choose person",
                choices = c("Mateusz", "Kuba", "Norbert (Linux)", "Norbert (MacOS)"))
  )
}
