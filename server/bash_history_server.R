# Gdzies to umieszcze tak, zeby bylo sensownie, nie powinno byc globalne
# lines <- str_squish(readLines("data/bash-history/mateusz_bash_history.txt"))
# maxFields <- max(sapply(lines, function(x) length(str_split_1(x, pattern = " "))))
# df <- str_split_fixed(lines, pattern = " ", n = maxFields)
# df <- as.data.frame(df[,-1])
# head(df)

bashHistoryServer <- function(input, output, session) {
  output$helloWorld <- renderText({
    "Hello World!!"
  })
}