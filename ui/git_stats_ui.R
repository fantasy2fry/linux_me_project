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
          "#### Introduction

In the realm of Git and GitHub, our trio, Norbert, Kuba, and Mateusz, have embarked on a journey to explore and understand the intricacies of version control. While our collective experience in this domain is still in its infancy, we present this report as a reflection on our individual Git endeavors.

#### Exploration Process

Despite lacking the extensive project portfolios of seasoned professionals, we have meticulously examined our local repositories. This introspective journey has led us to intriguing observations and valuable insights into the dynamics of our Git usage.

#### Key Findings

Through a detailed analysis of commit data and repository specifics, we've uncovered noteworthy patterns in our version control practices. Graphical representations, such as commit frequency charts and repository size trends, have provided a visual narrative of our evolving Git usage.

#### Lessons Learned

This exploration has not only deepened our understanding of version control but has also exposed areas for improvement. Each commit and repository has become a lesson, contributing to our growth as Git users.

#### Future Considerations

As we continue our Git exploration, we anticipate further refinement of our practices. Future considerations may involve exploring additional metrics, refining visualization techniques, and incorporating insights from the broader Git community.

#### Conclusion

In conclusion, this report serves as a snapshot of our current state in the Git landscape. It encapsulates our humble beginnings, discoveries made, and outlines a path for continuous improvement in our version control practices.

Feel free to join us in this reflective journey through the world of Git and version control!"
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