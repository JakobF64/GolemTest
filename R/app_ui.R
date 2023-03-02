#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    #Navbar structure for UI
    navbarPage("Payment Stats",
      tabPanel("Money Overview", fluid = TRUE,
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
      ),
      
      tabPanel("Categorical Stuff", fluid = TRUE,
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
      ),
      
      tabPanel("Time Stuff", fluid = TRUE,
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
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "GolemTest"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
