#' name_of_module1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @import shiny
mod_name_of_module1_ui <- function(id){
  ns <- NS(id)
  tagList(
      
      sidebarLayout(
        sidebarPanel(
          
          titlePanel("Desired Graph Characteristics"),
      
          sliderInput("bins",
                      "Number of bins:",
                      min = 1,
                      max = 100,
                      value = 30
          ),
          selectInput("Type", h3("Transformation"),
                      choices = c('Payment', 'Log')
          )
        ),
        mainPanel(plotOutput("plot1"))
      )
  )
}
    
#' name_of_module1 Server Functions
#' @import shiny
#' @import ggplot2
#' @noRd 
mod_name_of_module1_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$plot1 <- renderPlot({
    
      ggplot(pay2, aes_string(input$Type)) + 
        geom_histogram(fill = "blue", bins = input$bins + 1) +
        theme(axis.title.x = element_text(size = 16),
              axis.text.x = element_text(size = 14),
              axis.title.y = element_text(size = 16))
      
    }, height = 600)
 
  })
}
    
## To be copied in the UI
# mod_name_of_module1_ui("name_of_module1_1")
    
## To be copied in the server
# mod_name_of_module1_server("name_of_module1_1")
