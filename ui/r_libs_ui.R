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
        )
      ),
      column(
        width = 8,
        box(
          title = "Packages' imports network",
          width = NULL,
          status = "primary",
          solidHeader = TRUE,
          simpleNetworkOutput(ns("importsNetwork")) %>% withSpinner()
        )
      )
    )
  )
}