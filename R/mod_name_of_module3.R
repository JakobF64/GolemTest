#' name_of_module3 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_name_of_module3_ui <- function(id){
  ns <- NS(id)
  tagList(
      
      sidebarLayout(
        sidebarPanel(
          
          titlePanel("Payment Over Time"),
          
          selectInput("Year", h3("Years"),
            choices = c('All', '2013', '2014', '2015',
                        '2016', '2017', '2018'))
        ),
        mainPanel(plotOutput("plot3", click = "plot_click"),
                  tableOutput("data"))
      )
    
  )
}
    
#' name_of_module3 Server Functions
#' @import shiny
#' @import ggplot2
#' @noRd 
mod_name_of_module3_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$plot3 <- renderPlot({
    
      #unnecessarily complicated way of categorizing time
      if(input$Year == 'All'){
        ggplot(pay3, aes(x=date, y=Payment)) + geom_point() + 
          xlab("Time") + scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
          theme(axis.title.x = element_text(size = 16),
                axis.text.x = element_text(size = 12),
                axis.title.y = element_text(size = 16),
                axis.text.y = element_text(size = 16))
      }
      else{
        
        tmpstart <- "-01-01"
        tmpend <- "-12-31"
        
        str1 <- paste(input$Year, tmpstart, sep="")
        str2 <- paste(input$Year, tmpend, sep="")
        
        row.storer = NULL
        
        for (i in 1:length(pay3$date)){
          if (pay3$date[i] > str1 && pay3$date[i] < str2){
            row.storer = c(row.storer, i)
          }
        }
        
        tmp <- pay3[row.storer,]
        
        ggplot(tmp, aes(x=date, y=Payment)) + geom_point() + 
          xlab(input$Year) + scale_x_date(date_labels = "%b", date_breaks = "1 month") +
          theme(axis.title.x = element_text(size = 16),
                axis.text.x = element_text(size = 16),
                axis.title.y = element_text(size = 16),
                axis.text.y = element_text(size = 16))
      }
      
    })
    
    output$data <- renderTable({
      
      nearPoints(pay3, input$plot_click, xvar = "date", yvar = "Payment")
      
    })
 
  })
}
    
## To be copied in the UI
# mod_name_of_module3_ui("name_of_module3_1")
    
## To be copied in the server
# mod_name_of_module3_server("name_of_module3_1")
