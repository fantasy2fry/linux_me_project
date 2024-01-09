systemPackagesUI <- function(id) {
  ns <- NS(id)
  
  fluidPage(
    fluidRow(
      column(12,
             box(
               title = "System Packages",
               status = "primary",
               solidHeader = TRUE,
               collapsible = TRUE,
               h2("Hello Bash"),
               p("Tu bedzie jakis fancy opis"),
               textOutput(ns("helloWorld")),
             )
             
            
      )
    ),
    
    
      column(12,
             box(
               title = "Input",width = NULL,
               status = "warning",
               solidHeader = TRUE,
              checkboxGroupInput(ns("kogo_komendy"), 
                                 "Wybierz z które pakiety analizować:",
                                 c("Norbert - Linux" = "norlinux",
                                   "Norbert - MacOS" = "normacos",
                                   "Mateusz" = "mat",
                                   "Kuba"= "kuba"),
                                 selected = "norlinux")
      ), 
  
    
    fluidRow(
      column(12,
             plotlyOutput(ns("plot1"))
      )
    ),
  fluidRow(
    column(4,
           selectInput(ns("player"), 
                       "Wybierz pakiet:",
                       c("Norbert - Linux" = "norlinux",
                         "Norbert - MacOS" = "normacos",
                         "Mateusz" = "mat",
                         "Kuba"= "kuba"),
                       selected = "norlinux")
    ), column(4, numericInput(ns("ile"), "Ile pakietów:",  min = 3,
                              max = 12,
                              value = 6,
                              step = 1)
    ),
    column(4, numericInput(ns("prefixy"), "Jak długie prefixy:",  min = 1,
                                     max = 10,
                                     value = 3,
                                     step = 1))
  ),
  fluidRow(
    column(12,
           plotlyOutput(ns("plot2"))
    )
  )
  )
  )
  
}
