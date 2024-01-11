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
      processData(readLines("data/git-stats/norbert_git_stats.txt"), "Norbert")
    ))
  }
  
  df <- init()
  
  personDf <- reactive({
    df %>%
      filter(person == case_when(input$person_w == "vecel" ~ "Mateusz",
                                 input$person_w == "Norbert Frydrysiak" ~ "Norbert",
                                 input$person_w == "kuba-kapron" ~ "Kuba"))
  })
  personDf_only_his_commits = reactive({
    if(input$person_w == "vecel"){
      personDf() %>%filter(author =="vecel" | author =="Mateusz Karandys")
    } else if(input$person_w == "Norbert Frydrysiak"){
      personDf() %>%
        filter(author == "Norbert Frydrysiak" | author=="fantasy2fry")
    } else if(input$person_w == "kuba-kapron"){
      personDf() %>% 
        filter(author == "kuba-kapron")
    }
    
  })
  
  #converting date to date format
  personDf_with_date = reactive({
    personDf_only_his_commits() %>%
      mutate(date = as.Date(date)) %>% 
      mutate(day = weekdays(date))
  })
  personDf_with_date_groupped=reactive({
    personDf_with_date() %>%
      group_by(date) %>%
      summarise(count = n())
  })
  
  output$how_many_repos=renderInfoBox({
    infoBox("Total Repositories", 
            paste0(n_distinct(personDf()$repo)))
  })
  output$total_commits_person=renderInfoBox({
    infoBox("Total Commits By Person", 
            paste0(nrow(personDf_only_his_commits())))
  })
  output$average_commits_per_repo_by_person=renderInfoBox({
    infoBox("Average Commits By Person Per Repo", 
            paste0(round(nrow(personDf_only_his_commits())/n_distinct(personDf()$repo),2)))
  })
  
  output$unique_contributors=renderInfoBox({
    infoBox("Unique Contributors", 
            paste0(n_distinct(personDf()$author)))
  })
  
  output$average_total_commits_per_repo=renderInfoBox({
    infoBox("Average Commits Per Repo", 
            paste0(round(x=nrow(personDf())/n_distinct(personDf()$repo),digits=2)))
  })
  output$most_popular_day_for_commit=renderInfoBox({
    infoBox("Most Popular Day For Commit", 
            paste0(personDf_with_date() %>% 
                     group_by(day) %>% 
                     summarise(count = n()) %>% 
                     arrange(desc(count)) %>% 
                     slice(1) %>% 
                     pull(day)))
  })
  
  output$calendar_heatmap=renderPlot({
    pdff=personDf_with_date_groupped()
    calendarHeat(pdff$date, pdff$count, varname = "Commits")
    
  })
  
  
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