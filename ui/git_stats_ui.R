gitStatsUI <- function(id) {
  ns <- NS(id)
  
  fluidPage(
    h2("Hello Git Stats"),
    plotlyOutput(ns("heatmap"))
  )
}