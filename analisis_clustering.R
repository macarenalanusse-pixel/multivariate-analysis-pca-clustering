# Segunda Parte del Proyecto Multivariado
library(cluster) #Para poder realizar cluster jerarquico
library(ggplot2)
library(factoextra) #Tiene muchos recursos, aqui lo usamos para graficos de distancias y de siluetas 
library(tidyverse) #Dentro de el esta ggplot con el que realizamos graficos descriptivos
library(ggdendro) #Permite generar dendogramas con la misma logica que tidyverse
library(NbClust) #Libreria para identificar la cantidad de clusters optimo
library(GGally) #Para utilizar la funcion ggpairs del final. muy completa

#LEE DATOS
install.packages("readxl")
library("readxl")

#Exportamos datos
openxlsx::write.xlsx(datos2, file = "C:/Users/Macarena/Documents/FACULTAD/2021/Análisis Multivariado/Trabajo 1/datos2_4julio.xlsx")
                     
#Cargamos base de datos con las componentes 
base_comp <- read_excel("~/FACULTAD/2021/Análisis Multivariado/Trabajo 1/TRABAJO 2/base_comp.xlsx")
base_comp <- as.data.frame(base_comp)
nombres <- row.names(Data_22)
rownames(base_comp) <- nombres
View(base_comp)


#Cargamos los datos con las variables arregladas 
datos2 <- datos2%>%
        rename(Poblacion = ...19)
names(datos2)
view(datos2)
datos_O <- datos2 #guardamos en este dataframe auxiliar el dataframe completo

datos2 <- datos_O
datos2 <- datos2[,-17] #quitamos la variable población 
datos2 <- datos2[-14,] #quitamos Haití

class(datos2)
base_comp_st<-scale(base_comp, center =TRUE , scale=TRUE)
distancias <- get_dist(base_comp_st, method = "euclidean")

####ESTA PARTE NO VA PORQUE NO HAY NA####

#> datos2[33 , 14]
#[1] NA
#> datos2[33 , 14] <- 9.309
#> datos2[33 , 14]
#[1] 9.309
#> datos2[33 , 16]
#[1] NA
#> datos2[33 , 16] <- 31.85
#> datos2[33 , 16]
#[1] 31.85
#> datos2[46 , 16] 
#[1] 4.3
#> datos2[45, 16] 
#[1] NA
#> datos2[45, 16] <- 31.85

cor(base_comp_st)
head(base_comp_st)

fviz_dist(distancias, lab_size = 8) #Grafico de distancias

# CLuster jerarquico cualquiera de las 2 funciones hace lo mismo
CJ_ward <- agnes(distancias ,  method = "ward")
CJ_mascerc <- agnes(distancias, method = "single") #vecino más cercano
CJ_maslejos <- agnes(distancias, method = "complete") #vecino más lejano

#Dendograma
plot(CJ_ward) 
fviz_dend(CJ_ward,cex=0.8) #Utilizando la libreria factoextra

plot(CJ_mascerc) 
fviz_dend(CJ_mascerc,cex=0.8) #Utilizando la libreria factoextra

plot(CJ_maslejos) 
fviz_dend(CJ_maslejos,cex=0.8) #Utilizando la libreria factoextra

#Comparamos con los de indicadores
source('indicadores.R')            
IND<-indicadores(CJ_ward$merge , base_comp_st,10 )
# 2 y 5 grupos

source('indicadores.R')            
IND<-indicadores(CJ_mascerc$merge , base_comp_st,10 )


#Comparamos con los de indicadores con VECINO+LEJANO
source('indicadores.R')            
IND<-indicadores(CJ_maslejos$merge, base_comp_st,10 )
#4 y 6 grupos por F y t 

#Ward

pseudot2 <- NbClust(base_comp_st , distance = "euclidean" , method = "ward.D" , index = "pseudot2")
pseudot2$All.index

pseudoF <- NbClust(base_comp_st , distance = "euclidean" , method = "ward.D" , index = "ch")
pseudoF$All.index

sil<- NbClust(base_comp_st, distance = "euclidean" , method = "ward.D" , index = "silhouette")
sil$All.index

#Graficos de silueta WARD
silueta2_ward<-silhouette(cutree(CJ_ward , 2) , distancias)
silueta5_ward<-silhouette(cutree(CJ_ward , 5) , distancias)


fviz_silhouette(silueta2_ward)
fviz_silhouette(silueta5_ward) #Queda Haití en un clúster





#Graficos silueta Vecino más lejano
silueta4_maslejos<-silhouette(cutree(CJ_maslejos , 4) , distancias)
silueta6_maslejos<-silhouette(cutree(CJ_maslejos , 6) , distancias)

fviz_silhouette(silueta4_maslejos)
fviz_silhouette(silueta6_maslejos)

#Descripcion de los grupos con ggplot



fviz_dend(CJ_ward,cex=0.6, k=2) #Utilizando la libreria factoextra
fviz_dend(CJ_ward,cex=1, k=5)

base_comp$grupo<-cutree(CJ_ward , 2)
base_comp$grupo<-as.factor(base_comp$grupo)

openxlsx::write.xlsx(base_comp, file = "C:/Users/Macarena/Documents/FACULTAD/2021/Análisis Multivariado/Trabajo 1/base_compgrupos.xlsx", rowNames = TRUE)

#base_comp$grupo<-cutree(CJ_ward , 4)
#base_comp$grupo<-as.factor(base_comp$grupo)

#Gráficos de cajas

#Grafico completo con ggpairs
graf_pairs <- ggpairs(base_comp, mapping = ggplot2::aes(color = grupo, alpha = 0.5), 
        diag = list(continuous = wrap("densityDiag")), 
        lower=list(continuous = wrap("points", alpha=0.9)))

grupo2 <- ggpairs(datos2, c(6, 7, 8, 9, 17), mapping = ggplot2::aes(color = grupo, alpha = 0.5), 
                  diag = list(continuous = wrap("densityDiag")), 
                  lower=list(continuous = wrap("points", alpha=0.9)))

grupo3 <- ggpairs(datos2, c(14, 15, 16, 12, 13, 17), mapping = ggplot2::aes(color = grupo, alpha = 0.5), 
                  diag = list(continuous = wrap("densityDiag")), 
                  lower=list(continuous = wrap("points", alpha=0.9)))

#regiones y grupos
table(datos[,1],datos$grupo)
table(datos$grupo)
