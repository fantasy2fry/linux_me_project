# mogę analizować najczęstrze słowo pojawiące się w commitach
# mogę liczyć ilość repozytoriów u danej osoby
# mogę liczyć ilość commitów u danej osoby
# mogę liczyć ilość commitów w danym repozytorium (średnio)
# a tak to kalendarz plot i ilość commitów w danym dniu
# podobno jest jakaś tabelka z dniami tygodnia od daty (może analizować dni tygodnia i ilosc commitow)
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
      processData(readLines("data/git-stats/mateusz_git_stats.txt"), "Mateusz"),
      processData(readLines("data/git-stats/kuba_git_stats.txt"), "Kuba"),
      processData(readLines("data/git-stats/norbert_git_stats.txt"), "Norbert"),
    ))
  }
  
  df <- init()
  
  output$heatmap <- renderPlotly({
    
    dfhm <- df %>% 
      filter(author == "vecel") %>% 
      mutate(date = as.Date(date)) %>% 
      group_by(date) %>% 
      summarise(count = n())
    
    hm <- data.frame(
      date = seq(as.Date("2023-01-01"), as.Date("2023-12-31"), by = "day")
    ) %>% 
      left_join(dfhm, by = "date") %>% 
      mutate(count = if_else(is.na(count), 0, count))
      
    
    heatmaply(matrix(hm$count, nrow = 7),
              show_dendrogram = c(FALSE, FALSE))
  })
  
}