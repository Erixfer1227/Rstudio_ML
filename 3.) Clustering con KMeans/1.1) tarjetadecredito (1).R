## Cambia la dirección por el directorio que hayas asignado en tu equipo
setwd("~/Kmeans/Tarjeta de Credito")

datos.tc<- read.table("tarjetacredito.csv", header=TRUE,
                               sep=";", row.names="ID")

#View(datos.tc)


## Ahora normalizemos la data
datos.norm = scale(datos.tc)

# Por la cantidad de observaciones, es muy dificil visualizarla
# Se genera una matriz de distancia de 40MM de elementos
#install.packages("factoextra")
#install.packages("ggplot2")
#library(factoextra)
#matriz.distancia = get_dist(datos.norm, method = "euclidian")
#fviz_dist(matriz.distancia, gradient= list(low="white", high="black"))


# Estimar el numero de clusters
fviz_nbclust(datos.norm, kmeans, method = "wss")
fviz_nbclust(datos.norm, kmeans, method = "silhouette")
fviz_nbclust(datos.norm, kmeans, method = "gap_stat")
# Las estadísticas de brechas (gap statistic) miden qué tan diferente puede 
# ser el total dentro de la variación intragrupo entre los datos 
# observados y los datos de referencia con una distribución
# uniforme aleatoria. Una estadística de gran brecha significa 
# que la estructura de agrupamiento está muy lejos de la 
# distribución uniforme aleatoria de puntos.

#install.packages("NbClust")
#library(NbClust)
#numero.clusters = NbClust(datos.norm, distance = "euclidean", min.nc=2, 
#                         max.nc=9, method="kmeans", index = "alllong")




# Estimemos los clusters
siete.clusters = kmeans(datos.norm, centers = 7, nstart = 100)

# Grafiquemos

fviz_cluster(siete.clusters, data= datos.norm)





# Ahora, estimemos las medias de los clusters usando las variables
# originales con "the pipe" del paquete dplyr

#install.packages("dplyr")
library(dplyr)

medias.atributos = datos.tc %>%
  mutate(Cluster = siete.clusters$cluster) %>%
  group_by(Cluster) %>%
  summarise_all("mean")

# Visualizemos las medias de los atributos de los clusters

# Para poder graficar los atributos de los clusters
# voy a convertir la base datos.norm en un formato de
# tres columnas utilizando la funcion gather del paquete tidyr
# install.packages("tidyr")
library(tidyr)
datos.norm = as.data.frame(datos.norm)
datos.norm$Cluster = as.factor(siete.clusters$cluster)
tres.columnas = gather(datos.norm, Atributo, Valor, 
                        balance:tenencia, factor_key = TRUE)

# Ahora si puedo graficar los atributos de los clusters utilizando
# la funcion ggplot2 del paquete ggplot2

# install.packages("ggplot2")
library(ggplot2)
ggplot(tres.columnas, aes(as.factor(x=Atributo),
                           y= Valor,
                           group = Cluster, colour= Cluster))+
        stat_summary(fun = mean, geom = "pointrange", size =1)+
         stat_summary(geom = "line")+
  theme(axis.text.x=element_text(angle = -90, hjust = 0))
       
         
        
        
         
       



