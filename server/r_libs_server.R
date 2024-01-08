# TODO strzalki
# TODO wybierac ile pierwszych najczesciej importowanych paczek
# ma sie wyswietlac

rLibsServer <- function(input, output, session) {
  
  # LOADING DATA AND HELPERS
  loadRLibsData <- function(name) {
    commonPath <- "data/r-libs/"
    df <- read.delim(paste(commonPath, name, "_r_libs.txt", sep = ""), 
                     sep = ",", row.names = NULL)
    cbind(person = rep(name, times = nrow(df)), df) %>% 
      select(!row.names)
  }
  kubaDF <- loadRLibsData("kuba")
  norbertDF <- loadRLibsData("norbert")
  df <- rbind(kubaDF, norbertDF)
  
  completeImportsDF <- df %>% 
    select(person, Package, Imports) %>% 
    mutate(Imports = str_replace_all(Imports, ",\n", ", ")) %>% 
    separate_longer_delim(Imports, delim = ", ") %>% 
    mutate(Imports = str_replace(Imports, "\\([^\\)]+\\)", "")) %>% 
    na.omit()

  # REACTIVES
  importsDF <- reactive({
    completeImportsDF %>% 
      filter(person == case_when(input$person == "Mateusz" ~ "mateusz",
                                 input$person == "Norbert" ~ "norbert",
                                 input$person == "Kuba" ~ "kuba")) %>% 
      select(!person)
  })
  
  # OUTPUTS
  output$importsNetwork <- renderSimpleNetwork({
    simpleNetwork(importsDF())
  })
  
}