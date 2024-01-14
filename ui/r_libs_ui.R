rLibsUI <- function(id) {
  ns <- NS(id)
  
  fluidPage(
    fluidRow(
      column(
        width = 4,
        box(
          title = "R packages",
          width = NULL,
          status = "primary",
          solidHeader = TRUE,
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        ),
        box(
          title = "Inputs",
          width = NULL,
          status = "warning",
          solidHeader = TRUE,
          selectInput(
            ns("person"), 
            label = "Choose person",
            choices = c("Mateusz", "Kuba", "Norbert")
          ),
          sliderInput(
            ns("mostFrequentlyImported"),
            label = "Select number of most frequently imported packages",
            min = 1,
            max = 12,
            value = 6,
            step = 1
          )
        )
      ),
      column(
        width = 8,
        fluidRow(
          infoBoxOutput(ns("rVersion"), width = 4) %>% withSpinner(),
          infoBoxOutput(ns("allPackages"), width = 4) %>% withSpinner(),
          infoBoxOutput(ns("basePackages"), width = 4) %>% withSpinner(),
        ),
        fluidRow(
          box(
            title = "Import frequency histogram",
            width = NULL,
            status = "primary",
            solidHeader = TRUE,
            plotlyOutput(ns("importsHistogram")) %>% withSpinner()
          )
        )
      )
    ),
    fluidRow(
      box(
        title = "Graph of imports",
        width = NULL,
        status = "primary",
        solidHeader = TRUE,
        simpleNetworkOutput(ns("importsNetwork")) %>% withSpinner()
      )
    )
  )
}