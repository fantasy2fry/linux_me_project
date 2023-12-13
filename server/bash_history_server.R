
lines <- str_squish(readLines("data/bash-history/mateusz_bash_history.txt"))
maxFields <- max(sapply(lines, function(x) length(str_split_1(x, pattern = " "))))
df <- str_split_fixed(lines, pattern = " ", n = maxFields)
df <- as.data.frame(df[,-1])
head(df)
colnames(df) <- c("command", paste("arg", 1:(ncol(df)-1), sep = ""))

# TODO: zrobic jedna ramke z danymi dla wszystkich, w kolumnie 1 bedzie id osoby czy cos

bashHistoryServer <- function(input, output, session) {
  output$helloWorld <- renderText({
    "Hello World!!"
  })
  
  output$sudoFraction <- renderText({
    paste(round(mean(df$command == "sudo") * 100, digits = 2), "%")
  })
  
  output$commandsUsage <- renderPlot({
    df %>% 
      group_by(command) %>% 
      summarize(count = n()) %>% 
      top_n(n = 10) %>% 
      ggplot(aes(x = reorder(command, -count), y = count)) +
        geom_bar(stat = "identity") +
        theme_minimal()
  })
}