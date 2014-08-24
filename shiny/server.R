library(shiny)

shinyServer(function(input, output) {  
  output$plot <- renderPlot({
    
    data <- dbGetQuery(dbCon, paste("select time, sender, message from log where type = 'message' and room = 'codingteam@conference.jabber.ru' and time like '", input$date, "%'", sep=""))
    data["fnicks"] <- as.factor(data$sender)
    
    top10 <- tail(sort(table(data$fnicks)), 10)
    names(top10) <- lapply(names(top10), FUN = function(s) if (nchar(s) < 10) s else paste(substr(s,1,7), "..", sep=""))
    
    barplot(top10, main=paste("TOP 10 flooders:", input$date), ylab="Number of messages")
  })
})