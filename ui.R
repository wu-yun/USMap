library(shiny)
shinyUI(  fluidPage(
    headerPanel("Map Your US State Data"),
    sidebarLayout(
      column(4,
        selectInput("var",
                    label="Choose an option (demo or customize)",
                    choices=c("Total population (06.2015)",
                              "House seat number",
                              "Use my own data"),
                    selected = "Total Population"),
        radioButtons("colors",label="Choose your color group",
                           choices=list("Yellow to Red"="YlOrRd","Yellow to Green"="YlGn","Blues"="Blues"),
                     selected="YlOrRd"),
        actionButton("reset_input","Reset Inputs"),
        uiOutput('resetable_input')),
      column(8,
        plotOutput(outputId="map",width="auto",height="800px")
      )
)))   
