gitStatsUI <- function(id) {
  ns <- NS(id)
  
  fluidPage(
    fluidRow(
      column(width=8,box(
        title="Git Repositories on our Computers Information",
        width=NULL,
        status = "primary",
        plotOutput(ns("calendar_heatmap")) %>% withSpinner()
      ),
      box(
        title="Description",
        width=NULL,
        includeMarkdown(
          "BLA BLA BLA"
        )
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
                )),
             box(
               title="Git Repositories on our Computers Information",
               width=NULL,
               solidHeader = TRUE,
               status = "primary", 
               infoBoxOutput(ns("how_many_repos"), width = NULL) %>% withSpinner(),
               infoBoxOutput(ns("total_commits_person"), width = NULL) %>% withSpinner(),
               infoBoxOutput(ns("average_commits_per_repo_by_person"), width = NULL) %>% withSpinner(),
               infoBoxOutput(ns("average_total_commits_per_repo"), width = NULL) %>% withSpinner(),
               infoBoxOutput(ns("unique_contributors"), width = NULL) %>% withSpinner(),
               infoBoxOutput(ns("most_popular_day_for_commit"), width = NULL) %>% withSpinner()
             )
             )
      )
    
  )
  
}