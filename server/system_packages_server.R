systemPackagesServer <- function(input, output, session) {
  init <- function(){
    lines <- c(paste("Mateusz", str_squish(readLines("data/system-packages/mateusz_system_packages.txt"))),
               paste("NorbertMacos", str_squish(readLines("data/bash-history/norbert_macos.txt"))),
               paste("NorbertLinux", str_squish(readLines("data/bash-history/kuba_bash_history.txt"))))
  }
  
}