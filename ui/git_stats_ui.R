gitStatsUI <- function(id) {
  ns <- NS(id)
  
  fluidPage(
    fluidRow(
      column(width=4,box(
        title="Git Repositories on our Computers Information",
        width=NULL,
        solidHeader = TRUE,
        status = "primary", 
        h2("Hello Git Stats"),
        plotlyOutput(ns("heatmap"))
      )
      ),
      column(width = 4,
             box(
               title="Git Repositories on our Computers Information",
               width=NULL,
               solidHeader = TRUE,
               status = "primary", 
               
               
             )
      ),
      column(width = 4,
             box(
               title="Input",
               width=NULL,
               solidHeader = TRUE,
               status = "warning", 
               
               
             )
      )
    
  )
  )
}