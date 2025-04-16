#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(dplyr)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  
  conteo_dia_porc_matrixAA = reactive({
    temp = conteo_dia_porc_matrix[which(conteo_dia_porc_matrix$fecha == input$fecha),]
    temp$fecha = NULL
    temp
  })
  
  conteo_dia_matrixAA = reactive({
    temp = conteo_dia_matrix[which(conteo_dia_matrix$fecha == input$fecha),]
    temp$fecha = NULL
    temp$ID = NULL
    temp$Estacion = NULL
    temp$Tipo = NULL
    temp$Red = NULL
    temp$Propietario = NULL
    temp
  })
  
  conteo_ests_varAA = reactive({
    temp = conteo_ests_var[which(conteo_ests_var$fecha == input$fecha),]
    temp$fecha = NULL
    temp
  })
  
  
  output$text = renderText({
    temp = conteo_ests_dia[which(conteo_ests_dia$fecha == input$fecha),]
    temp$fecha = NULL
    paste(temp$conteo," estaciones consultadas el ",input$fecha)
  })
  

  conteo_mes_porc_matrixAA = reactive({
    temp = conteo_mes_porc_matrix[which(conteo_mes_porc_matrix$anio == input$anio & 
                                          conteo_mes_porc_matrix$mes == input$mes),]
    temp$anio = NULL
    temp$mes = NULL
    temp
  })
  
  conteo_mes_cant_matrixAA = reactive({
    temp = conteo_mes_cant_matrix[which(conteo_mes_cant_matrix$anio == input$anio & 
                                          conteo_mes_cant_matrix$mes == input$mes),]
    temp$anio = NULL
    temp$mes = NULL
    temp
  })
  
  
  conteo_mes_matrixAA = reactive({
    temp = conteo_mes_matrix[which(conteo_mes_matrix$anio == input$anio & 
                                      conteo_mes_matrix$mes == input$mes),]
    temp$anio = NULL
    temp$mes = NULL
    temp
  })
  

  output$conteo_dia_porc_matrix = renderDataTable({
    datatable(conteo_dia_porc_matrixAA(),options = list(scrollX = T,pageLength = 5),rownames = F) %>% 
      formatStyle(c("Bate","DirV","Hume","Nive","Prec","Pres","RadS","Temp","VelV"),
                  backgroundColor = styleInterval(c(0,10,20,30,40,50,60,70,80,90,100,10000),
                                                  c("rgb(136,6,9)",
                                                    "rgb(201,9,14)",
                                                    "rgb(248,111,108)",
                                                    "rgb(249,127,111)",
                                                    "rgb(251,166,118)",
                                                    "rgb(253,258,43)",
                                                    "rgb(254,227,130)",
                                                    "rgb(217,224,129)",
                                                    "rgb(164,208,126)",
                                                    "rgb(125,197,124)",
                                                    "rgb(100,190,123)",
                                                    "rgb(51,63,79)",
                                                    "rgb(51,63,79)")
                                                  )
                  )
  })
  
  output$conteo_dia_matrix = renderDataTable({
    datatable(conteo_dia_matrixAA(),options = list(scrollX = T,pageLength = 5),rownames = F)
  })
  
  output$conteo_mes_matrix = renderDataTable({
    datatable(conteo_mes_matrixAA(),options = list(scrollX = T,pageLength = 5),rownames = F)
  })

  output$conteo_mes_porc_matrix = renderDataTable({
    datatable(conteo_mes_porc_matrixAA(),options = list(scrollX = T,pageLength = 5),rownames = F) %>% 
      formatStyle(c("Bate","DirV","Hume","Nive","Prec","Pres","RadS","Temp","VelV"),
                  backgroundColor = styleInterval(c(0,10,20,30,40,50,60,70,80,90,100,10000),
                                                  c("rgb(136,6,9)",
                                                    "rgb(201,9,14)",
                                                    "rgb(248,111,108)",
                                                    "rgb(249,127,111)",
                                                    "rgb(251,166,118)",
                                                    "rgb(253,258,43)",
                                                    "rgb(254,227,130)",
                                                    "rgb(217,224,129)",
                                                    "rgb(164,208,126)",
                                                    "rgb(125,197,124)",
                                                    "rgb(100,190,123)",
                                                    "rgb(51,63,79)",
                                                    "rgb(51,63,79)")
                  )
      )
  })
  
  output$conteo_mes_cant_matrix = renderDataTable({
    datatable(conteo_mes_cant_matrixAA(),options = list(scrollX = T,pageLength = 5),rownames = F)
  })
  
  output$conteo_ests_var = renderDataTable({
    datatable(conteo_ests_varAA(),options = list(scrollX = T,pageLength = 10),rownames = F,filter = "none")
  })
}
