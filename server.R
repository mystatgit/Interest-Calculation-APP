library(shiny)


shinyServer(function(input, output) {
  

  output$sitable<-renderPrint({
    si<- (input$principal *input$roi*input$years)/100
    amount=input$principal+si
    data.frame(Principal = input$principal,
               ROI=input$roi,
               years=input$years,
               SI=si,
               repayable = amount
              )
    
  })
  
  output$citable<-renderPrint({
    compterm<-as.numeric(input$compoundterm)
    amount<- input$principal *((1+(input$roi/(compterm * 100))) ^(compterm*input$years))
   ci=amount-input$principal
    data.frame(Principal = input$principal,
               ROI=input$roi,
               years=input$years,
               CI=ci,
               repayable = amount)
    
  })

})



