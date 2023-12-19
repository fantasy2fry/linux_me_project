
bashHistoryServer <- function(input, output, session) {
  
  # INITIALIZATION
  init <- function() {
    lines <- c(paste("Mateusz", str_squish(readLines("data/bash-history/mateusz_bash_history.txt"))),
               paste("NorbertMacos", str_squish(readLines("data/bash-history/norbert_macos.txt"))),
               paste("Kuba", str_squish(readLines("data/bash-history/kuba_bash_history.txt"))))
    lines_norbert_linux= c(paste("NorbertLinux", str_squish(readLines("data/bash-history/norbert_linux.txt"))))
    maxFields_norbert_linux <- max(sapply(lines_norbert_linux, function(x) length(str_split_1(x, pattern = " "))))
    df_norbert_linux <- str_split_fixed(lines_norbert_linux, pattern = " ", n = maxFields_norbert_linux)
    df_norbert_linux <- as.data.frame(df_norbert_linux[,c(-2,-3)])
    maxFields <- max(sapply(lines, function(x) length(str_split_1(x, pattern = " "))))
    df <- str_split_fixed(lines, pattern = " ", n = maxFields)
    df <- as.data.frame(df[,-2])
    df = plyr::rbind.fill(df, df_norbert_linux) #plyr install
    colnames(df) <- c("person", "command", paste("arg", 1:(ncol(df)-2), sep = ""))
    df
  }
  df <- init()
  
  personDf <- reactive(
    df %>%
      filter(person == case_when(input$person == "Mateusz" ~ "Mateusz",
                                 input$person == "Norbert" ~ "NorbertMacos",
                                 input$person == "Kuba" ~ "Kuba"))
  )
  
  personCommandsUsage <- reactive(
    personDf() %>% 
      group_by(command) %>%
      summarize(count = n()) %>% 
      mutate(command = fct_reorder(command, count)) %>% 
      slice_max(order_by = count, n = input$hottestCommands, with_ties = FALSE)
  )
  
  sudoFraction <- reactive(
    round(mean(personDf()$command == "sudo") * 100, digits = 2)
  )
  
  output$helloWorld <- renderText({
    "Hello World!!"
  })
  
  output$sudoFraction <- renderText({
    paste(sudoFraction(), "%")
  })
  
  output$commandsUsage <- renderPlot({
      ggplot(personCommandsUsage(), aes(x = command, y = count)) +
        geom_segment(aes(x = command, xend = command, y = 0, yend = count), color = "orange") +
        geom_point(color = "orange", size = 4) +
        labs(
          title = "Usage of commands",
          x = element_blank(),
          y = "Number of uses"
        ) +
        theme_minimal() +
        coord_flip() +
        theme(
          panel.grid.major.y = element_blank(),
          panel.border = element_blank(),
          axis.ticks.y = element_blank()
        )
  })
}