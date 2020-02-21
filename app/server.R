#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    
    
    
    # Partie résumé
    
    output$city_choice <- renderUI({
        
        if(input$choice == 1){
            selectInput("Selectionner:", 
                        "Select country",
                        choices = df[(df$aggregate == FALSE),'pays Name']
            )} else {
                
                selectInput("Selectionner:", 
                            "Select country",
                            choices = df[(df$aggregate == TRUE),'pays Name']
                )
            }
        
        
    })
    
    
})