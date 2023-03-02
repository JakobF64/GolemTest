#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import ggplot2
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  
  mod_name_of_module1_server("name_of_module1_1")
  
  mod_name_of_module2_server("name_of_module2_1")
  
  mod_name_of_module3_server("name_of_module3_1")
}
