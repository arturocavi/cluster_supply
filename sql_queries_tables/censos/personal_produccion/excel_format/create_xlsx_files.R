##Librerias 
library(openxlsx)
library(readr)

#solo se cambia el directorio
#Se debe poner la ruta del directorio solo hasta la carpeta que tengan todas las carpetas de clusters dentro

directorio <- "C:/Users/arturo.carrillo/Documents/Varios/Personal/Projects/GitHub/cluster_supply/sql_queries_tables"
setwd(directorio)


#Industria Automotriz -----
A_C1_PERS <- read_csv(paste0(directorio,"/Automotriz/Personal ocupado/auto_pers_tabl_cla1.csv"), locale = locale(encoding = "ISO-8859-1"))
A_C2_PERS <- read_csv(paste0(directorio,"/Automotriz/Personal ocupado/auto_pers_tabl_cla2.csv"), locale = locale(encoding = "ISO-8859-1"))
A_C3_PERS <- read_csv(paste0(directorio,"/Automotriz/Personal ocupado/auto_pers_tabl_cla3.csv"), locale = locale(encoding = "ISO-8859-1"))
A_C4_PERS <- read_csv(paste0(directorio,"/Automotriz/Personal ocupado/auto_pers_tabl_cla4.csv"), locale = locale(encoding = "ISO-8859-1"))
A_C5_PERS <- read_csv(paste0(directorio,"/Automotriz/Personal ocupado/auto_pers_tabl_cla5.csv"), locale = locale(encoding = "ISO-8859-1"))

A_C1_PROD <- read_csv(paste0(directorio,"/Automotriz/Producción bruta/auto_prod_tabl_cla1.csv"), locale = locale(encoding = "ISO-8859-1"))
A_C2_PROD <- read_csv(paste0(directorio,"/Automotriz/Producción bruta/auto_prod_tabl_cla2.csv"), locale = locale(encoding = "ISO-8859-1"))
A_C3_PROD <- read_csv(paste0(directorio,"/Automotriz/Producción bruta/auto_prod_tabl_cla3.csv"), locale = locale(encoding = "ISO-8859-1"))
A_C4_PROD <- read_csv(paste0(directorio,"/Automotriz/Producción bruta/auto_prod_tabl_cla4.csv"), locale = locale(encoding = "ISO-8859-1"))
A_C5_PROD <- read_csv(paste0(directorio,"/Automotriz/Producción bruta/auto_prod_tabl_cla5.csv"), locale = locale(encoding = "ISO-8859-1"))

#Creación excel 
wb_A=createWorkbook("IIEG Tablas")
addWorksheet(wb_A, "C1 PERS")
writeData(wb_A, sheet=1, A_C1_PERS, startCol=1, startRow=1)

addWorksheet(wb_A, "C2 PERS")
writeData(wb_A, sheet=2, A_C2_PERS, startCol=1, startRow=1)

addWorksheet(wb_A, "C3 PERS")
writeData(wb_A, sheet=3, A_C3_PERS, startCol=1, startRow=1)

addWorksheet(wb_A, "C4 PERS")
writeData(wb_A, sheet=4, A_C4_PERS, startCol=1, startRow=1)

addWorksheet(wb_A, "C5 PERS")
writeData(wb_A, sheet=5, A_C5_PERS, startCol=1, startRow=1)

addWorksheet(wb_A, "C1 PROD")
writeData(wb_A, sheet=6, A_C1_PROD, startCol=1, startRow=1)

addWorksheet(wb_A, "C2 PROD")
writeData(wb_A, sheet=7, A_C2_PROD, startCol=1, startRow=1)

addWorksheet(wb_A, "C3 PROD")
writeData(wb_A, sheet=8, A_C3_PROD, startCol=1, startRow=1)

addWorksheet(wb_A, "C4 PROD")
writeData(wb_A, sheet=9, A_C4_PROD, startCol=1, startRow=1)

addWorksheet(wb_A, "C5 PROD")
writeData(wb_A, sheet=10, A_C5_PROD, startCol=1, startRow=1)

setwd(paste0(directorio,"/Automotriz"))

nombre_wb_A="Automotriz.xlsx"
saveWorkbook(wb_A, nombre_wb_A, overwrite = TRUE)

#Industria Electrónica -----

setwd(directorio)

E_C1_PERS <- read_csv(paste0(directorio,"/Electrónica/Personal ocupado/elec_pers_tabl_cla1.csv"), locale = locale(encoding = "ISO-8859-1"))
E_C2_PERS <- read_csv(paste0(directorio,"/Electrónica/Personal ocupado/elec_pers_tabl_cla2.csv"), locale = locale(encoding = "ISO-8859-1"))
E_C3_PERS <- read_csv(paste0(directorio,"/Electrónica/Personal ocupado/elec_pers_tabl_cla3.csv"), locale = locale(encoding = "ISO-8859-1"))

E_C1_PROD <- read_csv(paste0(directorio,"/Electrónica/Producción bruta/elec_prod_tabl_cla1.csv"), locale = locale(encoding = "ISO-8859-1"))
E_C2_PROD <- read_csv(paste0(directorio,"/Electrónica/Producción bruta/elec_prod_tabl_cla2.csv"), locale = locale(encoding = "ISO-8859-1"))
E_C3_PROD <- read_csv(paste0(directorio,"/Electrónica/Producción bruta/elec_prod_tabl_cla3.csv"), locale = locale(encoding = "ISO-8859-1"))

#Creación excel 
rm(wb_E)
wb_E=createWorkbook("IIEG Tablas")
addWorksheet(wb_E, "C1 PERS")
writeData(wb_E, sheet=1, E_C1_PERS, startCol=1, startRow=1)

addWorksheet(wb_E, "C2 PERS")
writeData(wb_E, sheet=2, E_C2_PERS, startCol=1, startRow=1)

addWorksheet(wb_E, "C3 PERS")
writeData(wb_E, sheet=3, E_C3_PERS, startCol=1, startRow=1)

addWorksheet(wb_E, "C1 PROD")
writeData(wb_E, sheet=4, E_C1_PROD, startCol=1, startRow=1)

addWorksheet(wb_E, "C2 PROD")
writeData(wb_E, sheet=5, E_C2_PROD, startCol=1, startRow=1)

addWorksheet(wb_E, "C3 PROD")
writeData(wb_E, sheet=6, E_C3_PROD, startCol=1, startRow=1)

setwd(paste0(directorio,"/Electrónica"))

nombre_wb_E="Electrónica.xlsx"
saveWorkbook(wb_E, nombre_wb_E, overwrite = TRUE)


#Industria Fundición ------

setwd(directorio)

F_C1_PERS <- read_csv(paste0(directorio,"/Fundición/Personal ocupado/fund_pers_tabl_cla1.csv"), locale = locale(encoding = "ISO-8859-1"))
F_C2_PERS <- read_csv(paste0(directorio,"/Fundición/Personal ocupado/fund_pers_tabl_cla2.csv"), locale = locale(encoding = "ISO-8859-1"))

F_C1_PROD <- read_csv(paste0(directorio,"/Fundición/Producción bruta/fund_prod_tabl_cla1.csv"), locale = locale(encoding = "ISO-8859-1"))
F_C2_PROD <- read_csv(paste0(directorio,"/Fundición/Producción bruta/fund_prod_tabl_cla2.csv"), locale = locale(encoding = "ISO-8859-1"))

#Creación excel 
rm(wb_E)
wb_F=createWorkbook("IIEG Tablas")
addWorksheet(wb_F, "C1 PERS")
writeData(wb_F, sheet=1, F_C1_PERS, startCol=1, startRow=1)

addWorksheet(wb_F, "C2 PERS")
writeData(wb_F, sheet=2, F_C2_PERS, startCol=1, startRow=1)

addWorksheet(wb_F, "C1 PROD")
writeData(wb_F, sheet=3, F_C1_PROD, startCol=1, startRow=1)

addWorksheet(wb_F, "C2 PROD")
writeData(wb_F, sheet=4, F_C2_PROD, startCol=1, startRow=1)

setwd(paste0(directorio,"/Fundición"))

nombre_wb_F="Fundición.xlsx"
saveWorkbook(wb_F, nombre_wb_F, overwrite = TRUE)


#Industria Tooling -----
setwd(directorio)

T_C1_PERS <- read_csv(paste0(directorio,"/Tooling/Personal ocupado/tool_pers_tabl_cla1.csv"), locale = locale(encoding = "ISO-8859-1"))
T_C2_PERS <- read_csv(paste0(directorio,"/Tooling/Personal ocupado/tool_pers_tabl_cla2.csv"), locale = locale(encoding = "ISO-8859-1"))
T_C3_PERS <- read_csv(paste0(directorio,"/Tooling/Personal ocupado/tool_pers_tabl_cla3.csv"), locale = locale(encoding = "ISO-8859-1"))
T_C4_PERS <- read_csv(paste0(directorio,"/Tooling/Personal ocupado/tool_pers_tabl_cla4.csv"), locale = locale(encoding = "ISO-8859-1"))
T_C5_PERS <- read_csv(paste0(directorio,"/Tooling/Personal ocupado/tool_pers_tabl_cla5.csv"), locale = locale(encoding = "ISO-8859-1"))

T_C1_PROD <- read_csv(paste0(directorio,"/Tooling/Producción bruta/tool_prod_tabl_cla1.csv"), locale = locale(encoding = "ISO-8859-1"))
T_C2_PROD <- read_csv(paste0(directorio,"/Tooling/Producción bruta/tool_prod_tabl_cla2.csv"), locale = locale(encoding = "ISO-8859-1"))
T_C3_PROD <- read_csv(paste0(directorio,"/Tooling/Producción bruta/tool_prod_tabl_cla3.csv"), locale = locale(encoding = "ISO-8859-1"))
T_C4_PROD <- read_csv(paste0(directorio,"/Tooling/Producción bruta/tool_prod_tabl_cla4.csv"), locale = locale(encoding = "ISO-8859-1"))
T_C5_PROD <- read_csv(paste0(directorio,"/Tooling/Producción bruta/tool_prod_tabl_cla5.csv"), locale = locale(encoding = "ISO-8859-1"))

#Creación excel 
wb_T=createWorkbook("IIEG Tablas")
addWorksheet(wb_T, "C1 PERS")
writeData(wb_T, sheet=1, T_C1_PERS, startCol=1, startRow=1)

addWorksheet(wb_T, "C2 PERS")
writeData(wb_T, sheet=2, T_C2_PERS, startCol=1, startRow=1)

addWorksheet(wb_T, "C3 PERS")
writeData(wb_T, sheet=3, T_C3_PERS, startCol=1, startRow=1)

addWorksheet(wb_T, "C4 PERS")
writeData(wb_T, sheet=4, T_C4_PERS, startCol=1, startRow=1)

addWorksheet(wb_T, "C5 PERS")
writeData(wb_T, sheet=5, T_C5_PERS, startCol=1, startRow=1)

addWorksheet(wb_T, "C1 PROD")
writeData(wb_T, sheet=6, T_C1_PROD, startCol=1, startRow=1)

addWorksheet(wb_T, "C2 PROD")
writeData(wb_T, sheet=7, T_C2_PROD, startCol=1, startRow=1)

addWorksheet(wb_T, "C3 PROD")
writeData(wb_T, sheet=8, T_C3_PROD, startCol=1, startRow=1)

addWorksheet(wb_T, "C4 PROD")
writeData(wb_T, sheet=9, T_C4_PROD, startCol=1, startRow=1)

addWorksheet(wb_T, "C5 PROD")
writeData(wb_T, sheet=10, T_C5_PROD, startCol=1, startRow=1)

setwd(paste0(directorio,"/Tooling"))

nombre_wb_T="Tooling.xlsx"
saveWorkbook(wb_T, nombre_wb_T, overwrite = TRUE)
