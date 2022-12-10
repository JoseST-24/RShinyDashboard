library(shiny)
library(shinydashboard)

shinyServer(function(input,output){
  output$histogram <-renderPlot({
    hist(faithful$eruptions, breaks = input$bins)
  })
  
  output$msgOutPut <- renderMenu({
    myMessages <- apply(read.csv("messages.csv"),1,function(row){
      
      messageItem(from = row[["from"]], message = row[["message"]])
      }
      )
    dropdownMenu(type= "messages", .list = myMessages)
  })
  
  
  output$VentasAprobadas <- renderInfoBox({
    infoBox("Ventas aprobadas","10,000",icon = icon("bar-chart-o"))
  })
  
  output$requirement <- renderValueBox({
    valueBox(12*50,"Requerimientos pendientes", icon = icon("file"), color = "yellow")
    
  })
  
  
})
