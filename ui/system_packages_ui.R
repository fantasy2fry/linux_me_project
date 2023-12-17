systemPackagesUI <- function(id) {
  ns <- NS(id)
  
  fluidPage(
    fluidRow(
      column(12,
             h2("Hello Bash"),
             p("Tu bedzie jakis fancy opis"),
             textOutput(ns("helloWorld")),
            
      )
    ),
    
    fluidRow(
      column(4,
              checkboxGroupInput("kogo_komendy", 
                                 "Wybierz z które pakiety analizować:",
                                 c("Norbert - Linux" = "norlinux",
                                   "Norbert - MacOS" = "normacos",
                                   "Mateusz" = "mat",
                                   "Kuba"= "kuba"))
      )
  )
  )
}
