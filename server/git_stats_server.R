gitStatsServer <- function(input, output, session) {
  
  processData <- function(lines, person) {
    idx <- grep("^Repository", lines)
    df_list <- list()
    for (x in 2:length(idx)) {
      df_list[[x - 1]] <- processRepo(lines, idx[x - 1], idx[x], person)
    }
    do.call(rbind, df_list)
  }
  processRepo <- function(lines, start, end, person) {
    repo <- tail(str_split_1(lines[start], pattern = "/"), n = 2)[1]
    df <- str_split_fixed(lines[(start+1):(end-2)], pattern = ", ", n = 4)
    df <- as.data.frame(df)
    colnames(df) <-  c("hash", "author", "date", "message")
    mutate(df, person = person, repo = repo, .before = 1)
  }
  
  init <- function() {
    do.call(rbind, list(
      processData(readLines("data/git-stats/mateusz_git_stats.txt"), "Mateusz")
      # processData(readLines("data/git-stats/kuba_git_stats.txt"), "Kuba"),
      # processData(readLines("data/git-stats/norbert_git_stats.txt"), "Norbert"),
    ))
  }
  
  df <- init()
  # df <- processData(readLines("data/git-stats/mateusz_git_stats.txt"), "Mateusz")
  # print(df)
  
}