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
shinyServer(function(input, output) {# partie Graph
    
    
output$mytable = DT::renderDataTable({
        df    
})   
    
    var <- reactive({
        switch(input$data1,
               "Pays" = df[(df$aggregate == FALSE), 'pays Name'],
               "Aggregat" = df[(df$aggregate == TRUE),'pays Name']
        )
    })
    
    var2 <- reactive({
        switch(input$data2,
               "Pays" = df[(df$aggregate == FALSE), 'pays Name'],
               "Aggregat" = df[(df$aggregate == TRUE),'pays Name']
        )
    })
    
    output$names <- renderUI({
        selectInput("Names","Selectionner le nom de la variable à afficher:", choices = var())
    })
    
    output$names2 <- renderUI({
        selectInput("Names2","Selectionner le nom de la seconde variable à afficher:", choices = var2())
    })
    
    # Plot des deux graphes
    output$plot <- renderPlot({
        # Si checkbox comparaison cochée on affiche deux graphes sur le plot
        if(input$compare == 1){
            plot(x = c('2017','2018','2019','2020','2021','2022'), y = valuesTable(),
                 ylim = c(-10,10),
                 xlab = "Year", ylab = "Values",
                 type = "b",
                 col = "green")
            legend("topright", inset=.05, title="Compare :",
                   c(input$Names,input$Names2), fill = c("green","blue"), horiz=FALSE)
            par(new=TRUE)
            plot(x = c('2017','2018','2019','2020','2021','2022'), y = valuesTable2(),
                 ylim = c(-10,10),
                 xlab = "Year", ylab = "Values",
                 type = "b",
                 col = "blue")
        } else{
            plot(x = c('2017','2018','2019','2020','2021','2022'), y = valuesTable(),
                 ylim = c(-10,10),
                 xlab = "Year", ylab = "Values",
                 type = "b",
                 col = "green")
        }
    })
    
    
    # On fait notre affichage dans un eventReactive bouton de sorte que l'affichage ne se crée qu'à la demande de l'utilisateur
    valuesTable <- eventReactive(input$action, {
        df[df['pays Name'] == c(input$Names), c('2017','2018','2019','2020','2021','2022')]
    })
    valuesTable2 <- eventReactive(input$action, {
        df[df['pays Name'] == c(input$Names2), c('2017','2018','2019','2020','2021','2022')]
    })})