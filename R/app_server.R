#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import ggplot2
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  
  output$plot1 <- renderPlot({
    
    ggplot(pay2, aes_string(input$Type)) + 
      geom_histogram(fill = "blue", bins = input$bins + 1) +
      theme(axis.title.x = element_text(size = 16),
            axis.text.x = element_text(size = 14),
            axis.title.y = element_text(size = 16))
    
  }, height = 600)
  
  output$plot2 <- renderPlot({
    
    ggplot(pay2, aes_string(input$yaxis, 'Payment')) + 
      geom_point(fill = "blue") +
      theme(axis.title.x = element_text(size = 16),
            axis.text.x = element_text(angle = 30, vjust = 0, hjust = .1, size = 16),
            axis.title.y = element_text(size = 16),
            axis.text.y = element_text(size = 16))
    
  }, height = 600)
  
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
}
