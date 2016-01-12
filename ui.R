library(shiny)
shinyUI(  fluidPage(
    headerPanel("Map Your US State Data"),
    fluidRow(
      column(2,
        selectInput("var",
                    label="Choose an option",
                    choices=c("Total population (06.2015)",
                              "House seat number",
                              "Use my own data"),
                    selected = "Total Population"),
        radioButtons("colors",label="Choose your color group",
                           choices=list("Yellow to Red"="YlOrRd","Yellow to Green"="YlGn","Blues"="Blues"),
                     selected="YlOrRd"),
        actionButton("reset_input","Reset Inputs")),
      column(10,
        plotOutput(outputId="map",width="auto",height="500px")
      ),
      column(12,
             uiOutput('resetable_input')))
))   
