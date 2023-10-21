datos.mayorista <- read.table("/Users/erickchacon/Library/CloudStorage/GoogleDrive-a01451824@tec.mx/Mi unidad/Trabajo/Especialización en R para Data Science/Análisis de Clusters con K Means/mayorista.csv", header=TRUE,
                               sep=";", row.names="ID")

#View(datos.mayorista)


## Ahora normalizemos la data
datos.norm = scale(datos.mayorista)

# Ahora visualizemos la matriz de distancia
install.packages("factoextra")
install.packages("ggplot2")
library(factoextra)
matriz.distancia = get_dist(datos.norm, method = "euclidian")
fviz_dist(matriz.distancia, gradient= list(low="white", high="black"))


# Estimar el numero de clusters
fviz_nbclust(datos.norm, kmeans, method = "wss")
fviz_nbclust(datos.norm, kmeans, method = "silhouette")
fviz_nbclust(datos.norm, kmeans, method = "gap_stat")
# Las estad?sticas de brechas (gap statistic) miden qu? tan diferente puede 
# ser el total dentro de la variaci?n intragrupo entre los datos 
# observados y los datos de referencia con una distribuci?n
# uniforme aleatoria. Una estad?stica de gran brecha significa 
# que la estructura de agrupamiento est? muy lejos de la 
# distribuci?n uniforme aleatoria de puntos.

#install.packages("NbClust")
#library(NbClust)
# numero.clusters = NbClust(datos.norm, distance = "euclidean", min.nc=2, 
#                     max.nc=8, method="kmeans", index = "alllong")




# Sesi?n 2: Estimemos los clusters
dos.clusters = kmeans(datos.norm, centers = 2, nstart = 100)
dos.clusters
cuatro.clusters = kmeans(datos.norm, centers = 4, nstart = 100)
cuatro.clusters


# Grafiquemos
# fviz_cluster(cuatro.clusters, data= datos.norm)
# Ahora, estimemos las medias de los clusters usando las variables
# originales con "the pipe" del paquete dplyr

#install.packages("dplyr")
library(dplyr)

medias.atributos = datos.mayorista %>%
  mutate(Cluster = cuatro.clusters$cluster) %>%
  group_by(Cluster) %>%
  summarise_all("mean")

# Sesi?n 3: Visualizemos las medias de los atributos de los clusters

# Para poder graficar los atributos de los clusters
# voy a convertir la base datos.norm en un formato de
# tres columnas utilizando la funcion gather del paquete tidyr
# install.packages("tidyr")
library(tidyr)
datos.norm = as.data.frame(datos.norm)
datos.norm$Cluster = as.factor(cuatro.clusters$cluster)
tres.columnas = gather(datos.norm, Atributo, Valor, 
                        frescos:delicatessen, factor_key = TRUE)

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


        
        
         
       



