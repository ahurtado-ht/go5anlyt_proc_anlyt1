#if(!require("XLConnect")) {
#  install.packages("XLConnect")
#}

if(!require("openxlsx")) {
  install.packages("openxlsx")
}

#options(java.parameters = "-Xmx2g")
#library(XLConnect)

library("openxlsx")


#setwd("C:/.apps/p.empresa_ownk/0003_Fcen_PropuestaDwProspectos/02_construccion/01_exploratory_r")
load_data <- function() {
  # read the dataset
  xl_dir <- "C:/.apps/p.empresa_ownk/0003_Fcen_PropuestaDwProspectos/01_resources/CD/DISCO COMPLETO Agosto 2014"
  xl_filename <- paste0(xl_dir,"/", "02_Base_y_Ranking_Vendedores_Pais_08-14.xlsx")
  xl_file <- file.path(xl_filename)
  xl_sheet <- "B.Proyectos"
  
  #require(XLConnect)
  #wb = loadWorkbook(xl_filename)
  #df = readWorksheet(wb, sheet = "Sheet1", header = TRUE)
  #df = readWorksheetFromFile(xl_file, sheet = "Sheet1", header = TRUE)
  
  require(openxlsx)
  df <- read.xlsx(xl_filename, sheet = xl_sheet, startRow = 1, colNames = TRUE) 
  
  # datos categoria
  
  
  # tipo de vivienda, agrupar categorias en vis/novis/vipa
  df[,'Tipo.de.Vivienda.(.Vis.o.No.Vis.)'] <- toupper(df[,'Tipo.de.Vivienda.(.Vis.o.No.Vis.)'])  
  df[,'Ciudad'] <- toupper(df[,'Ciudad'])
  
  #categorizar
  col_factor_names <- c('Ciudad','Proyecto','Estrato','Financiera','Tipo.de.Vivienda.(.Vis.o.No.Vis.)')
  df[,col_factor_names] <- lapply(df[,col_factor_names], factor)
  
  #df$Ciudad <- as.factor(df$Ciudad)
  df$Proyecto <- as.factor(df$Proyecto)
  df$Estrato <- as.factor(df$Estrato)
  
  #
  summary(df)
  
}