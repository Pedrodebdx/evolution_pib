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
                          selectInput(inputId = "data1", label = "Selectionner Pays ou Aggregat", choices = c("Pays", "Aggregat")),
                          uiOutput("names"),
                          checkboxInput(inputId = "compare", label = "Ajouter variable ?", value = 0),
                          
                          conditionalPanel(
                            condition = "input.compare == 1",
                            selectInput(inputId = "data2", label = "Selectionner Pays ou Aggregat", choices = c("Pays", "Aggregat")),
                            uiOutput("names2")
                          ),
                          actionButton("action", label = "Action")
                          
                        ),
                        mainPanel(
                          plotOutput("plot")
                        )
                      )
             ),
             tabPanel("Dataset",
                      titlePanel("Dataset"),
                      
                      #Sidebar
                      sidebarLayout(
                        
                        
                        sidebarPanel(
                          
                          
                          
                          
                          
                          h2("Prévision d'évolution du PIB"),
                          DT::dataTableOutput("mytable")),
                        mainPanel(
                          
                        )
                      )
             ),
             tabPanel("Résumé",
                      titlePanel("Résumé"),
                      
                      #Sidebar
                      sidebarLayout(
                        sidebarPanel(
                          uiOutput("all_names")
                        ),
                        mainPanel(
                          textOutput("resume")
                        )
                      )
             )
             
  )
  
))