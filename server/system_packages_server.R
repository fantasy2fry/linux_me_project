options(scipen = 999)
systemPackagesServer <- function(input, output, session) {
  init <- function(){
    lines <- c(paste("Mateusz", str_squish(readLines("data/system-packages/mateusz_system_packages.txt"))),
               paste("NorbertMacos", str_squish(readLines("data/system-packages/norbert_system_packages_macos.txt"))),
               paste("NorbertLinux", str_squish(readLines("data/system-packages/norbert_system_packages.txt"))))
    # trzeba dodac pana kube jeszcze
    lines = as.data.frame(str_split_fixed(lines, " ", n=2))
    colnames(lines) <- c("user", "packages")
    df = lines %>% 
      mutate(packages = str_extract(packages, '^[^\\/\t ]+')) %>% 
      mutate(user=as.factor(user))
    df
  }
  
  df <- init()
  
  update_df <- reactive(
    
    df %>%
      filter(user == case_when(input$kogo_komendy == "norlinux" ~ "NorbertLinux",
                                 input$kogo_komendy == "normacos" ~ "NorbertMacos",
                                 input$kogo_komendy == "mat" ~ "Mateusz"))
  )
  
  plot_first_update_df <- reactive(
    update_df() %>% 
      group_by(user) %>%
      summarize(count = n()) 
  )
  
  output$test=renderText({
    paste(input$kogo_komendy)
  })
  
  output$plot1=renderPlotly({
    p=ggplot(plot_first_update_df(), aes(x=user, y=count))+
      geom_bar(stat = "identity", fill = "skyblue")+
      geom_text(aes(label=count), vjust=-0.3, size=3)+
      theme_minimal()+
      scale_y_log10()
      #geom_text(aes(label=packages))
      
    #p
    ggplotly(p)
  })
}