gitStatsUI <- function(id) {
  ns <- NS(id)
  
  fluidPage(
    fluidRow(
      column(width=8,box(
        title="Git Repositories on our Computers Information",
        width=NULL,
        solidHeader = TRUE,
        status = "primary",
        plotOutput(ns("calendar_heatmap")) %>% withSpinner()
      ),
       box(
        title="Most used words in commits",
        width=NULL,
        solidHeader = TRUE,
        status="success",
        sliderInput(
          ns("number_of_most_used_words"),
          label = "Select number of most used words in commits",
          min = 3,
          max = 18,
          value = 6,
          step = 1),
        plotlyOutput(ns("message_lollipop")) %>% withSpinner()
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
               #infoBoxOutput(ns("average_commits_per_repo_by_person"), width = NULL) %>% withSpinner(),
               infoBoxOutput(ns("average_total_commits_per_repo"), width = NULL) %>% withSpinner(),
               infoBoxOutput(ns("unique_contributors"), width = NULL) %>% withSpinner(),
               infoBoxOutput(ns("most_popular_day_for_commit"), width = NULL) %>% withSpinner(),
               infoBoxOutput(ns("most_popular_contrybutor"), width = NULL) %>% withSpinner(),
               infoBoxOutput(ns("average_number_of_words_per_commit"), width = NULL) %>% withSpinner(),
             ),
             box(
               title="Description",
               width=NULL,
               includeMarkdown(
                 "#### Introduction"
               )
             )
             )
      )
    
  )
  
}