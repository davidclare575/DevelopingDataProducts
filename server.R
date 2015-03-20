
#this function calculates the cost of the facility
facilitycost <- function (miles, pension, contract, oxegyn) {
  if (pension == "Yes") penv <- 1
  if (pension == "No") penv <- 0
  if (contract == "None") conv <- 6
  if (contract == "Schedule B") conv <- 5.2
  if (contract == "Schedule A") conv <- 4.8
  if (contract == "Preferred") conv <- 4
  if (oxegyn == "Yes") oxv <- 1
  if (oxegyn == "No") oxv <- 0
  faccost <- ((miles * 5) + (oxv * 20) + 100)
  return faccost
}

#this function calculates the cost of the contractor
contractorcost <- function (miles, pension, contract, oxegyn) {
  if (pension == "Yes") penv <- 1
  if (pension == "No") penv <- 0
  if (contract == "None") conv <- 6
  if (contract == "Schedule B") conv <- 5.2
  if (contract == "Schedule A") conv <- 4.8
  if (contract == "Preferred") conv <- 4
  if (oxegyn == "Yes") oxv <- 1
  if (oxegyn == "No") oxv <- 0
  concost <- ((miles * conv) + (oxv * 4 * conv) - (penv * 100) + (conv * 15))
  return concost
}

#this function calls both cost functions and compares them for decision
decisionmaker <- function () {
  faccostd <- facilitycost(miles, pension, contract, oxegyn)
  concostd <- contractorcost(miles, pension, contract, oxegyn)
  if (faccostd <= concostd) decision <- "Facility Ambulance"
  if (concostd < faccostd) decision <- "Contractor Ambulance"
  return decision
}

#this function uses decision to then pick which function to call to report cost
costgiver <- function() {
  decision <- decisionmaker()
}
if (decision == "Facility Ambulance") cost <- faccost(miles, pension, contract, oxegyn)
if (decision == "Contractor Ambulance") cost <- concost(miles, pension, contract, oxegyn)
return cost
}

shinyServer(
  function(input, output) {
    output$decision <- renderPrint({decisionmaker(input$miles, input$pension, input$contract, input$oxegyn)})
    output$cost <- renderPrint({costgiver(input$miles, input$pension, input$contract, input$oxegyn)})
  })

