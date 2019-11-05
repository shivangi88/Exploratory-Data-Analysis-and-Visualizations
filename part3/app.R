
# Name: SHIvANGI TRIPATHI
# Team Member: PRATIK SANGHVI

#setwd = "C:/UB_Spring_Semester/Data_Intensive_Computing/Lab_1/part3/"

install.packages("shiny")

library(shiny)

ui <- fluidPage(
  titlePanel(h1("LAB1: DATA COLLECTION AND EXPLORATORY DATA ANALYSIS:",
                align="center")),
  sidebarLayout
  (
#    position= "right",
    sidebarPanel
    (
      radioButtons(inputId = "button", 
               label = "Please select visualization you wish to see:", 
               choices = c("CDC Map","Twitter Map","CDC vs Twitter Map","None"), 
               selected = "None"),
      conditionalPanel(condition = "input.button == 'CDC vs Twitter Map'",
                       wellPanel(position="bottom",       
                                 selectInput(
                                   inputId = "button1",
                                   label = "Choose a keyword:",
                                   choices = c("All","Fever","Flu",
                                               "Influenza","None"),
                                   selected = "None")
                                 )
                       )
        
      ),
    mainPanel(position = "top",
#      h2("Main Panel"),
      conditionalPanel(condition = "input.button == 'CDC Map'",
        wellPanel(
        img(src = "CDC_chart_1.jpeg", height=650, width=800),
        img(src = "CDC_chart_2.jpeg", height=650, width=800),
        img(src = "CDC_chart_3.jpeg", height=650, width=800),
        img(src = "CDC_chart_5_heatmap.jpeg", height=800, width=800),
        img(src = "CDC_chart_5a_2018.jpeg", height=650, width=800),
        img(src = "CDC_chart_5b_2018.jpeg", height=650, width=800),
        img(src = "CDC_chart_6_NY.jpeg", height=650, width=800)
        )
      ), 
      conditionalPanel(condition = "input.button == 'Twitter Map'",
        wellPanel(
          img(src = "Twitter_All_Chart.jpeg", height=600, width=850),
          img(src = "Twitter_Flu_Chart.jpeg", height=600, width=850),
          img(src = "Twitter_Fever_Chart.jpeg", height=600, width=850),
          img(src = "Twitter_Influenza_Chart.jpeg", height=600, width=850)      
        )  
      ),      
      conditionalPanel(
        condition =  "input.button1 == 'All'",
        wellPanel(
        h2("CDC vs Twitter Map"),
        p("The following charts are shown side-by-side to compare 
          heat map for tweets and cdc. However, the date ranges for both the maps
            are different."),
        img(src = "Twitter_All_Chart.jpeg", height=380, width=440),
        img(src = "CDC_chart_5_heatmap.jpeg", height=380, width=400)
        )
      ),
      conditionalPanel(
        condition =  "input.button1 == 'Fever'",
        wellPanel(        
        img(src = "Twitter_Fever_Chart.jpeg", height=400, width=440),
        img(src = "CDC_chart_5_heatmap.jpeg", height=400, width=410)        
        )),
      conditionalPanel(
        condition =  "input.button1 == 'Flu'",
        wellPanel(        
        img(src = "Twitter_Flu_Chart.jpeg", height=400, width=440),
        img(src = "CDC_chart_5_heatmap.jpeg", height=400, width=410)        
        )),
      conditionalPanel(
        condition =  "input.button1 == 'Influenza'",
        wellPanel(        
        img(src = "Twitter_Influenza_Chart.jpeg", height=400, width=440),
        img(src = "CDC_chart_5_heatmap.jpeg", height=400, width=410)        
        ))
      )
    )
)
    
  
server <- function(input, output) 
  {
  
}
  
shinyApp(ui= ui , server = server)  











