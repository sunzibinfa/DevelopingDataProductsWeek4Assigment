library(shiny)

# Define UI for application that draws a line chart
shinyUI(fluidPage(

    # Application title
    titlePanel("Graphs of Major European Stock Indices: 1991-1998"),
    helpText("This Shiny App uses the EuStockMarkets data set from R to plot major European stock indices from 1991 to 1998. User is 
                 to provide two inputs. The first is to choose which stock index to display.  The second is to choose what type of graph
                 to output. Users can either graph the daily closing values or the daily difference when compared to the previous day."),
    # Sidebar with a radio button to select index and type of graph
    sidebarLayout(
                radioButtons("index", "INDEX:",
                     c("ALL" = "ALL",
                       "DAX" = "DAX",
                       "SMI" = "SMI",
                       "CAC" = "CAC",
                       "FTSE" = "FTSE")),
        radioButtons("type", "TYPE OF GRAPH:",
                    c("LEVEL" = "level",
                      "DAILY DIFFERENCES" = "diff"))
    ),
        # Show a plot of the Chosen Stock Index
        mainPanel(
            plotOutput("indexPlot")
        )
))
