library(shiny)
#Documentation:
#This is a simple dashboard that calculates simple/compound interest
#Enter Principal (numeric Input), rate of interest(numeric input) and number of years(numeric input)
#If you need compound interest to be calculated, check the check box(Interest compounded?)- the default is False- which returns the simple interest
#once you select compound interest you need to enter whether it is compounded annually/half-yearly/quarterly- the default is annual

shinyUI(fluidPage(
    # Application title
  titlePanel("Simple Interest/Compound Interest"),
  

  sidebarLayout(
    sidebarPanel(
     numericInput("principal","Principal in Rs.",1500),
     numericInput("roi","Rate of interest (percentage)",4.3),
    
      sliderInput("years",
                  "Number of Years:",
                  min = 1,
                  max = 20,
                  value = 6),
     
     checkboxInput("iscompInt","Interest Compounded?",FALSE),
     helpText("Note:If checked , Compound Interest; else simple interest"),
     conditionalPanel(
       condition = "input.iscompInt== 1",
   
    selectInput("compoundterm", "number of times the interest is compounded per year  ",
                c("Annually" = 1,
                  "Half-yearly" = 2,
                  "Quartely" = 4  ) )
     )
    
    ),
  
    mainPanel(
      conditionalPanel(condition = "input.iscompInt== 0",
      verbatimTextOutput("sitable")
      ),
      conditionalPanel(condition = "input.iscompInt== 1",
      verbatimTextOutput("citable")
      )
    )
  )
))