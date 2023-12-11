bashHistoryServer <- function(input, output, session) {
  output$helloWorld <- renderText({
    "Hello World!!"
  })
}