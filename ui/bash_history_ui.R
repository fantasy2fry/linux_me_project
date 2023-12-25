bashHistoryUI <- function(id) {
  ns <- NS(id)
  
   fluidPage(
     
     fluidRow(
      box(
        title = "Bash History",
        status = "primary",
        solidHeader = TRUE,
        "Tu bedzie jakis fancy opis"
      ),
      
      box(
        title = "Inputs",
        status = "warning",
        solidHeader = TRUE,
        selectInput(ns("person"), 
                   label = "Choose person",
                   choices = c("Mateusz", "Kuba", "Norbert(MacOs)", "Norbert(Linux)")),
        sliderInput(ns("hottestCommands"),
                    label = "Select number of most used commands",
                    min = 1,
                    max = 24,
                    value = 12,
                    step = 1)
       )
    ),
    
    fluidRow(
      
      tabBox(
        title = "Commands Usage", 
        tabPanel("Plot", plotlyOutput(ns("commandsUsagePlot"))),
        tabPanel("Table", DTOutput(ns("commandsUsageTable")))
      )
      
      # box(title = "Commands Usage Fraction",
      #     status = "primary",
      #     solidHeader = TRUE,
      #     ),
      # box()
    ),
    fluidRow(
      infoBoxOutput(ns("sudoFraction")),
      infoBoxOutput(ns("totalCommands")),
      infoBoxOutput(ns("uniqueCommands"))
    )
   )
}
