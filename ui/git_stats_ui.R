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
               title="Input",
               width=NULL,
               solidHeader = TRUE,
               status = "warning", 
               selectInput(
                 ns("person_w"), 
                 label = "Choose person",
                 choices = c("Mateusz" = "vecel", "Kuba"="kuba-kapron", "Norbert"="Norbert Frydrysiak")
               )
               
             )
      ),
      column(width = 4,
             box(
               title="Git Repositories on our Computers Information",
               width=NULL,
               solidHeader = TRUE,
               status = "primary", 
               infoBoxOutput(ns("how_many_repos"), width = NULL) %>% withSpinner(),
               infoBoxOutput(ns("total_commits_person"), width = NULL) %>% withSpinner(),
               infoBoxOutput(ns("average_commits_per_repo"), width = NULL) %>% withSpinner()
             )
             )
      )
    
  )
  
}