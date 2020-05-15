library(shiny)
library(dplyr)

# Read in data set and do process data in order to get into right format
data(EuStockMarkets)
EuStockMarkets2 <- diff(EuStockMarkets)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$indexPlot <- renderPlot({

        # Subset data based on user inputs
        if (input$type == 'level') {
            EuStockMarkets3 <- EuStockMarkets
        }
        else if (input$type == 'diff') {
            EuStockMarkets3 <- EuStockMarkets2
        }
        if (input$index == 'DAX') {
            EuStockMarkets3 <- EuStockMarkets3[,1]
        } 
        else if (input$index == 'SMI') {
            EuStockMarkets3 <- EuStockMarkets3[,2]
        } 
        else if (input$index == 'CAC') {
            EuStockMarkets3 <- EuStockMarkets3[,3]
        } 
        else if (input$index == 'FTSE') {
            EuStockMarkets3 <- EuStockMarkets3[,4]
        } 

        # draw the graph
        if (input$type == 'level') {
            plot(EuStockMarkets3, main='Plot of Stock Index Level', xlab='Date', ylab='Value')
        }
        else {
            plot(EuStockMarkets3, main=paste('Plot of Daily Differences', xlab='Date', ylab='Value'))
        }
    })

})
