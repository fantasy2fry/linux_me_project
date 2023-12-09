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
      menuItem("bashHistory", tabName = "Bash History"),
      menuItem("systemPackages", tabName = "System Packages"),
      menuItem("gitStats", tabName = "Git Statistics")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "bashHistory", bashHistoryUI()),
      tabItem(tabName = "systemPackages", systemPackagesUI()),
      tabItem(tabName = "gitStats", gitStatsUI())
    )
  )
)

server <- function(input, output, session) {
  callModule(bashHistoryServer, "bashHistory")
  callModule(systemPackagesServer, "systemPackages")
  callModule(gitStatsServer, "gitStats")
}

shinyApp(ui, server)
