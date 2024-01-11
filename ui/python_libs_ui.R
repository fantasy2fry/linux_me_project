pythonLibsUI <- function(id) {
  ns <- NS(id)
  fluidPage(
    column(4,
           box(
             title = "Python libraries",
             status = "primary",
             solidHeader = TRUE,
             width = NULL,
             includeMarkdown("BLA BLA BAL")
           )
           ),
    column(4,
           box(
             title="Input",
             status="warning",
             solidHeader = TRUE,
             width = NULL,
             selectInput(ns("person_python"), 
                         "Select the person for the python packages to analyze:",
                         c("Norbert",
                           "Mateusz",
                           "Kuba"),
                         selected = "Norbert"),
             numericInput(ns("ile_python"), "How many common prefixes of packages to show:",  min = 3,
                          max = 12,
                          value = 6,
                          step = 1),
             numericInput(ns("prefixy_python"), "The length of the prefix:",  min = 1,
                          max = 10,
                          value = 3,
                          step = 1)
           ),
           box(
             title = "Python packages prefixes plot",
             status = "success",
             solidHeader = TRUE,
             width = NULL,
             plotlyOutput(ns("plot22"))
           )),
    column(4,
           box(
             title = "How many python packages do we have installed?",
             status = "primary",
             solidHeader = TRUE,
             width = NULL,
             plotlyOutput(ns("plot_how_many_packages"))
           )
           ))
  
}