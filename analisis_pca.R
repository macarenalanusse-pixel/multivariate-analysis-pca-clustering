library(Rcmdr)
library(FactoMineR)
library(RcmdrPlugin.FactoMineR)
library(Factoshiny)
library(readxl)
#AL abrir Rcommander hay que ir a la opción "conjunto de datos activo" y aparece el data set.
#Cargar a Rcommander datos activos DataOPS

#Busco correlaciones entre variables
#cor.matrix <- cor(DataOPS[,c("Alcohol.en.adultos","Bajo.peso","Coeficiente.de.Gini",
+                                 "Crecimiento.anual.PBI","Defunciones","Edad","Esperanza.Vida.hombre",
+                                 "Esperanza.vida.Mujer","Gasto.PublicoSalud","Medicos","Mortalidad.infantil",
+                                 "Mortalidad.neonatal","Nacimientos","Pobl..Urbana","Pobl.mas.65",
+                                 "Pobl.menor15","Tabaco.adolescentes","Tabaco.adultos",
+                                 "Tasa.anual.crec..Pobl","Tasa.fecund..Adolesc.",
+                                 "Tasa.global.de.fecundidad")], use="complete")
cor.matrix.frame <- data.frame(cor.matrix)
#busco cor mayores a 0.75
#importo datos de la matriz de correlaciones 
write.table(cor.matrix.frame, file="cormatrix.csv", sep = ";")

Data_2 <- data.frame(Data_2)

Data_2$Defunciones. <- 1000000*Data_2$Defunciones./data$Pobl

Data_2$Nacimientos. <- 1000000*Data_2$Nacimientos./data$Pobl
