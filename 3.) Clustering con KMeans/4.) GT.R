# CARGAR LIBRERIAS ####
library(tidyverse)
library(cluster)
library(factoextra)
library(NbClust)
library(tidyr)
library(psych)

# 2009 ####
# IMPORTAR DATASET ####
df2 <- read.table("/Users/erickfernandochaconflores/Downloads/GTP2.csv",
                  header=TRUE, sep=",", row.names="Departamento")

# DESCRIBRIR DATASET ####
str (df2) 
describe(df2)

# NORMALIZAR VARIABLES ####
df2 <- scale(df2) # "Scale" función para normalizar
head(df2)

# ESTIMAR EL NÚMERO DE CLUSTERS ####
# Elbow, silhouette o gap_stat  method
fviz_nbclust(df2, kmeans, method = "wss") # Hay que encontar la rodilla
fviz_nbclust(df2, kmeans, method = "silhouette") # Sugiere el número de clusters
fviz_nbclust(df2, kmeans, method = "gap_stat") # Sugiere el número de clusters


# CALCULAR LOS CLUSTER SUGERIDOS POR LOS MÉTODOS ####
# Son dos los clusters sugeridos
k3_2009 <- kmeans(df2, centers = 3, nstart = 25)
k3_2009 # me dice en que cluster ha quedado cada uno de los estados

# PLOTEANDO CLUSTERS ####
# Generar el gráfico utilizando la función fviz_cluster
plot <- fviz_cluster(k3_2009, data = df2, ellipse.type = "euclid", repel = TRUE,
                     star.plot = TRUE)

# Agregar un título al gráfico
plot <- plot + labs(title = "Análisis de Clusters GT 2009: Tasa de Homicidios vs. Tasa de Robo y Hurto por cada 100,000 habitantes",
                    subtitle = "By Ing. Erick Chacón, MAIT | MAF Candidate",
                    caption = "Fuente: INE. (2020). Hechos Delictivos. Recuperado de: https://www.ine.gob.gt/estadisticas/bases-de-datos/hechos-delictivos/")

# Cambiar la fuente del título
plot <- plot + theme(plot.title = element_text(family = "Times New Roman",
                                               size = 14, face = "bold"))

# Mostrar el gráfico
print(plot)


# 2020
# IMPORTAR DATASET ####
df <- read.table("/Users/erickfernandochaconflores/Downloads/GTP.csv", 
                 header=TRUE, sep=",", row.names="Departamento")

# DESCRIBRIR DATASET ####
str (df) 
describe(df)

# NORMALIZAR VARIABLES ####
df <- scale(df) # "Scale" función para normalizar
head(df)

# ESTIMAR EL NÚMERO DE CLUSTERS ####
# Elbow, silhouette o gap_stat  method
fviz_nbclust(df, kmeans, method = "wss") # Hay que encontar la rodilla
fviz_nbclust(df, kmeans, method = "silhouette") # Sugiere el número de clusters
fviz_nbclust(df, kmeans, method = "gap_stat") # Sugiere el número de clusters


# CALCULAR LOS CLUSTER SUGERIDOS POR LOS MÉTODOS ####
# Son dos los clusters sugeridos
k3_2020 <- kmeans(df, centers = 3, nstart = 25)
k3_2020 # me dice en que cluster ha quedado cada uno de los estados

# PLOTEANDO CLUSTERS ####
# Generar el gráfico utilizando la función fviz_cluster
plot1 <- fviz_cluster(k3_2020, data = df, ellipse.type = "euclid", repel = TRUE,
                     star.plot = TRUE)

# Agregar un título al gráfico
plot1 <- plot1 + labs(title = "Análisis de Clusters GT 2020: Tasa de Homicidios vs. Tasa de Robo y Hurto por cada 100,000 habitantes",
                    subtitle = "By Ing. Erick Chacón, MAIT | MAF Candidate",
                    caption = "Fuente: INE. (2020). Hechos Delictivos. Recuperado de: https://www.ine.gob.gt/estadisticas/bases-de-datos/hechos-delictivos/")

# Cambiar la fuente del título
plot1 <- plot1 + theme(plot.title = element_text(family = "Times New Roman",
                                               size = 14, face = "bold"))

# Mostrar el gráfico
print(plot1)


