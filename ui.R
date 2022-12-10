library(shiny)
library(shinydashboard)
 
 shinyUI(
   dashboardPage( 
   dashboardHeader(title = "DashBoard Header", dropdownMenuOutput("msgOutPut"),
                  # dropdownMenu(type ="message",
                  # messageItem(from = "Finance update", message="We are working on it"),
                  # messageItem(from = "Sales update", message="Sales increased 25 % in the last 24 hrs", 
                  #             icon = icon("bar-chart"), time = "8:00"),
                  # messageItem(from = "Sales update", message="Sales agreement", icon = icon("handshake-o"))
                  # 
                  # )
                  dropdownMenu(type = "notifications",
                               notificationItem(
                                  text = "New tabs added to the dashboard sidebar",
                                  icon = icon("dashboard"),
                                  status = "success"
                               ),
                               notificationItem(
                                  text = "Server running at 97% of capacity",
                                  icon = icon("warning"),
                                  status = "warning"
                               )
                               ),
                  
                  dropdownMenu(type = "tasks",
                               taskItem(
                               value = 75,
                               color = "aqua", "Accounting course"
                               ),
                               
                               taskItem(
                                  value = 90,
                                  color = "green", "Sales course" 
                               ),
                               taskItem(
                                  value = 40,
                                  color = "red", "RH management" 
                               )
                               
                               
                               )
                  
                  
                  ),
   
   
   dashboardSidebar(
     
      sidebarMenu(
      sidebarSearchForm("principalSearchBox","buttonSearch", "Search"),
      menuItem("Dashboards", tabName = "dashboard", icon = icon("dashboard")),
         menuSubItem("Finance Dashboard", tabName = "finance"),
         menuSubItem("Sales Dashboard", tabName = "sales"),
         
      menuItem("Detailed Analysis", badgeLabel = "New", badgeColor = "green"),
      menuItem("Raw Data")
     
      
   )),
   dashboardBody(
      tabItems(
         tabItem(tabName = "dashboard",
            fluidRow(
               infoBox("Sales",1000,icon = icon("thumbs-up")),
               infoBox("ROI %", paste('85%'),icon = icon("money")),
               infoBoxOutput("VentasAprobadas")
            ),
            
            fluidRow(
               valueBox(85*100000,"Presupuesto", icon = icon("money")),
               valueBoxOutput("requirement")
            ),
            
            fluidRow(
               tabBox(
               tabPanel(title = "Histograma de fidelidad",status = "primary",solidHeader = T, background = "aqua", 
                   plotOutput("histogram")),
               tabPanel(title ="Controls for Dashboard", status = "warning", solidHeader = T,
                   "Utiliza este control para controlar la grafica",
                   sliderInput("bins","Number of Breaks",1,100,50),
                   textInput("textInput", "Search Opportunities", value = "What do you need?"))
               )
          )),
            
          tabItem(tabName = "finance",
                  h1("Finance Dashboard")
          ),
          tabItem(tabName = "sales",
                  h1("Sales Dashboard")
          )
          
      )
     
      )
   )
)

driver <-(driverClass = "oracle.jdbc.OracleDriver",
          "c:/drivers/oracle/ojdbc7.jar") 
 
