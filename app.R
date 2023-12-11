library(shiny)
library(shinydashboard)

source("ui/bash_history_ui.R")
source("ui/system_packages_ui.R")
source("ui/git_stats_ui.R")

source("server/bash_history_server.R")
source("server/system_packages_server.R")
source("server/git_stats_server.R")

ui <- dashboardPage(
  dashboardHeader(title = "Linux ME Project"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Bash History", tabName = "bashHistory"),
      menuItem("System Packages", tabName = "systemPackages"),
      menuItem("Git Statistics", tabName = "gitStats")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "bashHistory", bashHistoryUI("bashHistory")),
      tabItem(tabName = "systemPackages", systemPackagesUI("systemPackages")),
      tabItem(tabName = "gitStats", gitStatsUI("gitStats"))
    )
  )
)

server <- function(input, output, session) {
  callModule(bashHistoryServer, "bashHistory")
  callModule(systemPackagesServer, "systemPackages")
  callModule(gitStatsServer, "gitStats")
}

shinyApp(ui, server)
