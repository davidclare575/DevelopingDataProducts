library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Contract Vs. Facility Ambulance Determination"),
  
  sidebarPanel(
    numericInput("miles", "Number of Miles:",
                 20)),
    selectInput("pension", "Receives Pension", choices = c("Yes", "No")),
    selectInput("contract", "Contract Type", choices = c("None", "Schedule B", "Schedule A", "Preferred")),
    selectInput("oxegyn", "Oxegyn Required", choices = c("Yes", "No"),
    submitButton('Submit')),
  
  mainPanel(
    h3("You should go with:")
    verbatimTextOutput("decision"),
    h4("It should cost this many dollars:")
    verbatimTextOutput("cost")
  )
))
