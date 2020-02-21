#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    navbarPage("Projet 6",
               # Onglet 1 : Le graph interactif
               tabPanel("Graph interactif",
                        titlePanel("Graphique"),
                        
                        #Sidebar
                        sidebarLayout(
                            sidebarPanel(
                                
                            ),
                            mainPanel(
                                
                            )
                        )
               ),
               tabPanel("Dataset",
                        titlePanel("Dataset"),
                        
                        #Sidebar
                        sidebarLayout(
                            sidebarPanel(
                                
                            ),
                            mainPanel(
                                
                            )
                        )
               ),
               tabPanel("Résumé",
                        titlePanel("Résumé"),
                        
                        #Sidebar
                        sidebarLayout(
                            sidebarPanel(
                                radioButtons("choice", label = h3("Choisir:"),
                                             choices = list("Pays" = 1, "Aggregat" = 2), 
                                             selected = 1),
                                uiOutput("city_choice")
                            ),
                            mainPanel(
                                
                            )
                        )
               )
               
    )
    
))