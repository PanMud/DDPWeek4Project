#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


library(shiny) 
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Body Mass Index (BMI) Calculator"),
    
    sidebarPanel(
      sliderInput(
        inputId = "height",
        label = strong("Your height in cm:"),
        min = 20,
        max = 300,
        value = 185
      ), #User height input slider
      sliderInput(
        inputId = "weight",
        label = strong("Your weight in kg:"),
        min = 20,
        max = 140,
        value = 74
      ), #User mass input slider
      
      #numericInput('weight', 'Insert your weight in kilograms', 70) ,
      #numericInput('height', 'Insert your height in metres', 1.70, min = 0.2, max = 3, step = 0.01),
      submitButton('Submit')
    ), 
    mainPanel(
      p('The Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women.'),
      p('Regarding the BMI measure, the World Health Organization (WHO) proposes the following classification:'),
      tags$div(
        tags$ul(
          tags$li('BMI <18.5       : Underweight'),
          tags$li('BMI [18.5-24.9] : Normal weight'),
          tags$li('BMI [25-29.9]   : Overweight'),
          tags$li('BMI >=30        : Obesity')
        )
      ),
      h4('Your BMI is:'),
      verbatimTextOutput("estimation"),
      p('It means that you are:'),strong(verbatimTextOutput("diagnostic"))
    )
  )   
)
