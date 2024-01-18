
pythonLibsServer <- function(input, output, session){
  
  processData = function(lines, person){
    # each line change to 2 columns(lib, ver), "==" is seprator
    df = strsplit(lines, "==")
    #convert to data.frame
    df = data.frame(do.call(rbind, df), stringsAsFactors = FALSE)
    colnames(df) = c("lib", "ver")
    df$person = person
    return(df)
  }
  
  init = function(){
    do.call(rbind,list(
      processData(readLines("data/python-libs/mateusz_python_libs.txt"), "Mateusz"),
      processData(readLines("data/python-libs/kuba_python_libs.txt"), "Kuba"),
      processData(readLines("data/python-libs/norbert_python_libs.txt"), "Norbert")
    ))
  }
  df=init()
  
  first_letters_df = reactive({
    df %>% 
      mutate(packages=str_sub(lib,1,input$prefixy_python)) %>% 
      group_by(person, packages) %>%
      summarize(count = n()) %>% #sortowanie po count
      arrange(desc(count)) %>% 
      filter(person==input$person_python) %>% arrange(desc(count)) %>% head(input$ile_python)}
  )
  
  df_how_many_packages=reactive({
    df %>%
      group_by(person) %>%
      summarise(number_of_packages=n())
  })
  
  output$plot_how_many_packages=renderPlotly({
    p=ggplot(df_how_many_packages(), aes(x=person, y=number_of_packages)) +
      geom_bar(stat="identity", fill="#3c8dbc") + 
      labs(x="Person", y="Number of packages")+
      theme_minimal()
    p=ggplotly(p) 
      
      p%>% 
      config(displayModeBar = FALSE)
      
  })
  output$plot22=renderPlotly({
    p=ggplot(first_letters_df(), aes(x=packages, y=count))+
      geom_bar(stat = "identity", fill = "#00a65a")+
      theme_minimal()+labs(x="Python Package Prefix", y="Number of packages")
    #p
    ggplotly(p) %>% 
      config(displayModeBar = FALSE)
    
  })
  
}