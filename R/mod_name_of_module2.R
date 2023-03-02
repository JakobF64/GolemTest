#' name_of_module2 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @import shiny
mod_name_of_module2_ui <- function(id){
  ns <- NS(id)
  tagList(
      
      sidebarLayout(
        sidebarPanel(
          
          titlePanel("Varible Histograms"),
          
          selectInput("yaxis", h3("Y Axis"),
                      choices = c('Primary_Type',
                                  'Payment_Form',
                                  'Third_Party_Payment', 
                                  'Number_of_Payments')
          )
        ),
        mainPanel(plotOutput("plot2"))
      )
    
  )
}
    
#' name_of_module2 Server Functions
#' @import shiny
#' @import ggplot2
#' @noRd 
mod_name_of_module2_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$plot2 <- renderPlot({
    
      ggplot(pay2, aes_string(input$yaxis, 'Payment')) + 
        geom_point(fill = "blue") +
        theme(axis.title.x = element_text(size = 16),
              axis.text.x = element_text(angle = 30, vjust = 0, hjust = .1, size = 16),
              axis.title.y = element_text(size = 16),
              axis.text.y = element_text(size = 16))
      
    }, height = 600)
 
  })
}
    
## To be copied in the UI
# mod_name_of_module2_ui("name_of_module2_1")
    
## To be copied in the server
# mod_name_of_module2_server("name_of_module2_1")
