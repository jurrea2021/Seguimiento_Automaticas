#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram


dashboardPage(
  dashboardHeader(title = "Automaticas",disable = F),
  dashboardSidebar(
    
    dateInput(inputId = "fecha",
              label = "FECHA",
              language = "es",
              value = as.character(Sys.Date() - 1),
              min = "2024-01-01",
              max = as.character(Sys.Date() - 1)
              ),
    
    selectInput(inputId = "anio",
                label = "ANIO",
                choices = c("2024" = "2024",
                            "2025" = "2025")
                ),
    selectInput(inputId = "mes",
                label = "MES",
                choices = c("enero" = "enero",
                            "febrero" = "febrero",
                            "marzo" = "marzo",
                            "abril" = "abril",
                            "mayo" = "mayo",
                            "junio" = "junio",
                            "julio" = "julio",
                            "agosto" = "agosto",
                            "septiembre" = "septiembre",
                            "octubre" = "octubre",
                            "noviembre" = "noviembre",
                            "diciembre" = "diciembre")
                )
  ),
  dashboardBody(
    fluidRow(
      box(title = "Analisis diario",
          status = "primary",
          tabsetPanel(
            tabPanel(strong("Porcentaje Diario"),
                     div(dataTableOutput("conteo_dia_porc_matrix"),style = "font-size:80%")
            ),
            tabPanel(strong("Cantidad Diaria"),
                     div(dataTableOutput("conteo_dia_matrix"),style = "font-size:80%")
            )
          ),
          width = 6,collapsible = TRUE
      ),
      
      box(background = "orange",width = 2,
          textOutput("text")
      ),
      box(title = "Conteo diario de estaciones por variable",
        div(dataTableOutput("conteo_ests_var"),style = "font-size:70%"),
        width = 4,collapsible = TRUE
      )
    ),
    
    fluidRow(
      box(title = "Analisis mensual",
          status = "primary",
          tabsetPanel(
            tabPanel(strong("Porcentaje Mensual"),
                     div(dataTableOutput("conteo_mes_porc_matrix"),style = "font-size:80%")
            ),
            tabPanel(strong("Cantidad Mensual"),
                     div(dataTableOutput("conteo_mes_matrix"),style = "font-size:80%")
            )
          ),
          width = 6,collapsible = TRUE
          ),
      box(title = "Conteo de dias con datos en el mes por variable",
        div(dataTableOutput("conteo_mes_cant_matrix"),style = "font-size:80%"),
        width = 6,collapsible = TRUE
      )
    )
  )
)