

ruta = "data/"

load(paste0(ruta,"conteo_dia_matrix.RData"))
load(paste0(ruta,"conteo_dia_porc_matrix.RData"))
load(paste0(ruta,"conteo_ests_dia.RData"))
load(paste0(ruta,"conteo_ests_var.RData"))
load(paste0(ruta,"conteo_mes_cant_matrix.RData"))
load(paste0(ruta,"conteo_mes_matrix.RData"))
load(paste0(ruta,"conteo_mes_porc_matrix.RData"))



conteo_dia_porc_matrix$fecha = as.character(conteo_dia_porc_matrix$fecha)
conteo_dia_matrix$fecha = as.character(conteo_dia_matrix$fecha)
conteo_ests_dia$fecha = as.character(conteo_ests_dia$fecha)
conteo_ests_var$fecha = as.character(conteo_ests_var$fecha)
conteo_mes_matrix$anio = as.character(conteo_mes_matrix$anio)
conteo_mes_porc_matrix$anio = as.character(conteo_mes_porc_matrix$anio)
conteo_mes_cant_matrix$anio = as.character(conteo_mes_cant_matrix$anio)