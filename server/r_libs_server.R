rLibsServer <- function(input, output, session) {
  
  loadData <- function(file) {
    read.delim(file, sep = ",")
  }
  commonPath <- "data/r-libs/"
  
  kuba_df <- loadData(paste(commonPath, "kuba_r_libs.txt", sep = ""))
  
}