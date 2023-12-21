bashHistoryUI <- function(id) {
  ns <- NS(id)
  
   fluidPage(
     fluidRow(
      column(12,
        h2("Hello Bash"),
        p("Tu bedzie jakis fancy opis"),
        textOutput(ns("helloWorld")),
        # To tak testowo
      )
    ),
    
    fluidRow(
      column(4,
             selectInput(ns("person"), 
                         label = "Choose person",
                         choices = c("Mateusz", "Kuba", "Norbert(MacOs)", "Norbert(Linux)"))),
      column(4,
             numericInput(ns("hottestCommands"),
                          label = "Select number of most used commands",
                          min = 3,
                          max = 12,
                          value = 6,
                          step = 1))),
    fluidRow(
      column(8,
             plotOutput(ns("commandsUsage"))),
      column(4,
            div(
              h3("Sudo Fraction:"),
              htmlOutput(ns("sudoFraction")),
              style = "border: 1px solid #ddd; padding: 10px; border-radius: 5px; background-color: #f5f5f5;"
            )
      ))
   )
}
