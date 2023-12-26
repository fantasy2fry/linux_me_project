# TODO wstawic sensowny opis zamiast lorem ipsum

bashHistoryUI <- function(id) {
  ns <- NS(id)
  
   fluidPage(
     fluidRow(
       column(
         width = 4,
         box(
           title = "Bash History",
           width = NULL,
           status = "primary",
           solidHeader = TRUE,
           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
         ),
         infoBoxOutput(ns("totalCommands"), width = NULL) %>% withSpinner(),
         infoBoxOutput(ns("uniqueCommands"), width = NULL) %>% withSpinner(),
         infoBoxOutput(ns("sudoFraction"), width = NULL) %>% withSpinner()
      ),
      column(
        width = 4,
        box(
          title = "Inputs",
          width = NULL,
          status = "warning",
          solidHeader = TRUE,
          selectInput(
            ns("person"), 
            label = "Choose person",
            choices = c("Mateusz", "Kuba", "Norbert(MacOs)", "Norbert(Linux)")),
          sliderInput(
            ns("hottestCommands"),
            label = "Select number of most used commands",
            min = 1,
            max = 12,
            value = 6,
            step = 1)
        ),
        tabBox(
          title = "Commands Usage", 
          width = NULL,
          tabPanel("Plot", plotlyOutput(ns("commandsUsagePlot")) %>% withSpinner()),
          tabPanel("Table", DTOutput(ns("commandsUsageTable")) %>% withSpinner())
        )
      ),
      column(
        width = 4,
        box(
          title = "Most Used Sequences",
          width = NULL,
          status = "primary",
          solidHeader = TRUE,
          DTOutput(ns("commandsSequence")) %>% withSpinner()
        ),
        box(
          title = "Description",
          width = NULL,
          includeMarkdown(
          "While working with the terminal, the user often performs certain sequences of operations, such as `git add`, `git commit`, `git push`. The table above presents a compilation of the most frequently used sequences for a given number of consecutive commands (2-6). During the analysis, consecutive invocations of the same command were counted as one. This means that the consecutive usage of `cd cd cd` is treated simply as single `cd`."
          )
        )
      )
    )
   )
}
