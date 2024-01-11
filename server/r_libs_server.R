# TODO strzalki

rLibsServer <- function(input, output, session) {
  
  # LOADING DATA AND HELPERS
  loadRLibsData <- function(person) {
    commonPath <- "data/r-libs/"
    df <- read.delim(paste(commonPath, person, "_r_libs.txt", sep = ""), 
                     sep = ",", row.names = NULL)
    cbind(person = rep(person, times = nrow(df)), df) %>% 
      select(!row.names)
  }
  kubaDF <- loadRLibsData("kuba")
  mateuszDF <- loadRLibsData("mateusz")
  norbertDF <- loadRLibsData("norbert")
  df <- rbind(kubaDF, mateuszDF, norbertDF)
  
  completeImportsDF <- df %>% 
    select(person, Package, Imports) %>% 
    mutate(Imports = str_replace_all(Imports, ",\n", ", ")) %>% 
    separate_longer_delim(Imports, delim = ", ") %>% 
    mutate(Imports = str_replace(Imports, "\\([^\\)]+\\)", "")) %>% 
    na.omit()

  # REACTIVES
  importsDF <- reactive({
    df <- completeImportsDF %>% 
      filter(person == case_when(input$person == "Mateusz" ~ "mateusz",
                                 input$person == "Norbert" ~ "norbert",
                                 input$person == "Kuba" ~ "kuba")) %>% 
      select(!person)
    
    importFrequency <- df %>% 
      select(Imports) %>% 
      group_by(Imports) %>%
      summarise(n = n()) %>% 
      slice_max(n, n = input$mostFrequentlyImported) %>% 
      pull(Imports)
    
    df %>% filter(Imports %in% importFrequency)
  })
  
  # OUTPUTS
  output$importsNetwork <- renderSimpleNetwork({
    simpleNetwork(importsDF())
  })
  
}