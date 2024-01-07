# TODO reaktywnosc
# TODO strzalki
# TODO wybierac kogo paczki oraz ile pierwszych najczesciej importowanych paczek
# ma sie wyswietlac

rLibsServer <- function(input, output, session) {
  
  # LOADING DATA AND HELPERS
  loadData <- function(file) {
    read.delim(file, sep = ",")
  }
  commonPath <- "data/r-libs/"
  kuba_df <- loadData(paste(commonPath, "kuba_r_libs.txt", sep = ""))
  df <- rbind(kuba_df)
  
  importsDF <- df %>% 
    select(Package, Imports) %>% 
    mutate(Imports = str_replace_all(Imports, ",\n", ", ")) %>% 
    separate_longer_delim(Imports, delim = ", ") %>% 
    mutate(Imports = str_replace(Imports, "\\([^\\)]+\\)", "")) %>% 
    na.omit()

  # REACTIVES
  
  # OUTPUTS
  output$importsNetwork <- renderSimpleNetwork({
    simpleNetwork(importsDF)
  })
  
}