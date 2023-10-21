## Importando datos en R

# Para archivos csv, separados por Coma
# La primera fila contiene los nombres de las variables
# asignar la variable id al nombre
# notar  / en lugar de \ que viene por defecto en windows

eduviajes <- read.table("eduviajes.csv", header=TRUE,
                       sep=";", row.names="ID")

# Al revisar los datos, podemos observar que algunas variables 
# fueron clasificadas como numericas, cuando deberian ser factores, esto debido
# a que como veremos mas adelante, debemos rellenar algunos datos faltantes y esta
# manipulacion dependera del tipo de dato de la variable por lo que requerimos 
# convertir a factor algunas de las variables que contienen numero y sobre todo aquellas
# que son binarias
# de dato.
# Debemos corregir esto

eduviajes$GradoMinimo <- as.factor(eduviajes$GradoMinimo)
eduviajes$GradoMaximo <- as.factor(eduviajes$GradoMaximo)
eduviajes$Estado <- as.factor(eduviajes$Estado)
eduviajes$NoAnual <- as.factor(eduviajes$NoAnual)
eduviajes$Dias <- as.factor(eduviajes$Dias)
eduviajes$Transporte <- as.factor(eduviajes$Transporte)
eduviajes$TipoPago <- as.factor(eduviajes$TipoPago)
eduviajes$LineaPobreza <- as.factor(eduviajes$LineaPobreza)
eduviajes$Region <- as.factor(eduviajes$Region)
eduviajes$SegmentoCRM <- as.factor(eduviajes$SegmentoCRM)
eduviajes$TipoEscuela <- as.factor(eduviajes$TipoEscuela)
eduviajes$ReunionPadres <- as.factor(eduviajes$ReunionPadres)
eduviajes$MenorGradoEscuela <- as.factor(eduviajes$MenorGradoEscuela)
eduviajes$MayorGrado.Escuela <- as.factor(eduviajes$MayorGrado.Escuela)
eduviajes$NivelIngresos <- as.factor(eduviajes$NivelIngresos)
eduviajes$TipoPrograma <- as.factor(eduviajes$TipoPrograma)
eduviajes$NuevoExistente <- as.factor(eduviajes$NuevoExistente)
eduviajes$TipoGradoMinimo<- as.factor(eduviajes$TipoGradoMinimo)
eduviajes$TipoGradoMaximo <- as.factor(eduviajes$TipoGradoMaximo)
eduviajes$MesPartida <- as.factor(eduviajes$MesPartida)
eduviajes$CodigoAgregacionPrograma <- as.factor(eduviajes$CodigoAgregacionPrograma)
eduviajes$Tamano <- as.factor(eduviajes$Tamano)
eduviajes$Reuniones <- as.factor(eduviajes$Reuniones)
eduviajes$MismoGrado <- as.factor(eduviajes$MismoGrado)
eduviajes$CodigoPrograma <- as.factor(eduviajes$CodigoPrograma)
eduviajes$Retenidos2020 <- as.factor(eduviajes$Retenidos2020)   

# Como podemos observar en la tabla, hay mucho valores faltantes y antes de elaborar
# nuestro arbol de clasificacion, tenemos que lidiar con ellos

# Algunos valores faltantes ya están marcados como "NA" pero
# otros simplemente no tienen ningún valor. Vamos a crear una función que rellene
# los valores faltantes y preserve los NA ya existentes. Llamaremos a nuestra función
# ArreglarNAs


ArreglarNAs<-function(data_frame){ 
  arreglo_enteros<-0 
  arreglo_factores<-"NA_ARREGLADO" 
  arreglo_caracteres<-"NA_ARREGLADO"
  arreglo_fechas<-as.Date("1900-01-01")
  
  
  
  # Realice un bucle en las columnas del data frame y de acuerdo al tipo de datos
  # aplique el arreglo determinado y cree una columna sustituta
  
  for (i in 1 : ncol(data_frame)){
    if (class(data_frame[,i]) %in% c("numeric","integer")) { 
      if (any(is.na(data_frame[,i]))){
      data_frame[,paste0(colnames(data_frame)[i],"_indicadorNA")]<- as.factor(ifelse(is.na(data_frame[,i]),"1","0"))
      data_frame[is.na(data_frame[,i]),i]<-arreglo_enteros
    }
    } else
      if (class(data_frame[,i]) %in% c("factor")) { 
        if (any(is.na(data_frame[,i]))){
        data_frame[,i]<-as.character(data_frame[,i]) 
        data_frame[,paste0(colnames(data_frame)[i],"_indicadorNA")]<-as.factor(ifelse(is.na(data_frame[,i]),"1","0")) 
        data_frame[is.na(data_frame[,i]),i]<-arreglo_factores
          data_frame[,i]<-as.factor(data_frame[,i])
          
      }
      } else {
        if (class(data_frame[,i]) %in% c("character")) { 
          if (any(is.na(data_frame[,i]))){
          data_frame[,paste0(colnames(data_frame)[i],"_indicadorNA")]<- as.factor(ifelse(is.na(data_frame[,i]),"1","0"))
          data_frame[is.na(data_frame[,i]),i]<-arreglo_caracteres
        }
        } else {
          if (class(data_frame[,i]) %in% c("Date")) {
            if (any(is.na(data_frame[,i]))){ 
              data_frame[,paste0(colnames(data_frame)[i],"_indicadorNA")]<-as.factor(ifelse(is.na(data_frame[,i]),"1","0")) 
              data_frame[is.na(data_frame[,i]),i]<-arreglo_fechas
            }
          }
        }
      }
  }
  return(data_frame)
}

eduviajesNA <-ArreglarNAs(eduviajes)

# Ahora crearemos otra función para combinar categorías con poca cantidad de registros
# en la categoría "otros" 
# Esta función tendrá dos argumentos: el nombre del dataframe y el número de registros
# para incluirse en "otros." 

combinarcategorias<-function(data_frame,conteominimo){ 
  for (i in 1 : ncol(data_frame)){
  a<-data_frame[,i]
  replace <- names(which(table(a) < conteominimo))
  levels(a)[levels(a)	%in%	replace]	<- paste("Otros",colnames(data_frame)[i],sep=".")
  
  
  
  data_frame[,i]<-a } 
  return(data_frame) 
  }

combinarcategorias(eduviajesNA, 10)

##### Parte 3
# Primero, instalemos el paquete caret y pongamoslo en la librería
# install.packages("caret")
library(caret)

# Luego establezacamos una semilla de generación de números aleatorios para que el 
# el corte se realice siempre en el mismo punto, yo escogeré 2020, podría ser 
# cualquier número pero escoja siempre el mismo para tener resultados consistentes

set.seed(2020) 
# Ahora partimos la data en dos con la función CreateDataPartition. Yo voy a utilizar
# el 80% de los datos para entrenar a mi modelo y el 20% para hacer testing.
# La base está compuesta por 2389 observaciones, estimo el 80% de esto y es 1911.

Particion <- createDataPartition(y = eduviajesNA$Retenidos2020, 
                               p = 0.8, list = FALSE)
training <- eduviajesNA[ Particion,] 
testing <- eduviajesNA[ -Particion,]

## Sesion 12
# Bienvenidos a esta sesion donde vamos a aprender a elaborar bosques
# aleatorios de clasificacion. Hasta el momento, habiamos elaborado arboles
# de clasificacion utilizando ctree y rpart. Los arboles son modelos 
# sencillos de elaborar y faciles de interpretar, pero tienen una limitante
# tienen poca exactitud. Los bosques por el contrario se apalancan en el
# poder computacional y utilizan una tecnica denominada "bootstraping" en
# la que toman conjuntos aleatorios de la base y crean arboles con 
# subconjuntos aleatorios de las variables. Por lo tanto, la clasificacion
# no la define la probabilidad asignada por un arbol individual sino la 
# votacion de los arboles aleatorios que forman el bosque. 
#install.packages("randomForest")
library(randomForest)

# Antes de elaborar el modelo quiero explicar dos de los parametros que
# utilizara

# El primer parametero es "importance" es una medida de cuánto la eliminación 
# de una variable disminuye la precisión y viceversa: cuánto aumenta la 
# precisión al incluir una variable.

# El 2do parametro "proximity" mide la "cercanía" entre pares de casos.
# Las proximidades se calculan para cada par de puntos de muestra. 
# Si dos casos ocupan el mismo nodo terminal a través de un árbol, 
# su proximidad aumenta en uno. Luego de correr el modelo contodos los árboles, 
# las proximidades se normalizan dividiendolas por el número de árboles. 
# Las proximidades se utilizan para reemplazar datos faltantes, localizar valores 
# atípicos y y determinar puntos de baja dimensión de los datos.

modelo.bosque <- randomForest(Retenidos2020~ . -Estado, data=training,
                             importance=TRUE,proximity=TRUE,
                             cutoff  =  c(0.5,  0.5),type="classification")



# Por defecto se establece el punto de corte en 0.5, es decir se necesita que la 
# mitad de los arboles voten que si se retiene para el proximo año para que el grupo
# se asigne como 1. Este numero lo pueden ir cambiando hasta minimizar el error de la
# Matriz de Confusion o maximizar una funcion de utilidad

# Al correr el modelo nos da error, porque la variable EStado tine 54 niveles, lo cual
# es demasiado. Ya tenemos una variable que agrega Regiones, entonces yo simplemente
# la voy a remover del modelo. Si ud considera que esta variable es importante que 
# podria hacer para no removerla del modelo: podría crear una variable que tomara 
# en cuenta aquellos estados con mas ventas, digamos los primero 10 o quince 
# y luego agregar a todos los demas estados en otros


print(modelo.bosque) 
plot(modelo.bosque) 
# Podemos observar como luego de 75-80 arboles, el error del modelo tiede a
# un error de aproximadamente 2.75. ESto implica que por mas arboles que usemos
# en el bosque ya no vamos a disminuir el error
importance(modelo.bosque) 
# Podemos observar la importancia que tiene cada una de las variables en el
# modelo, medio tanto por la exactitud como por la impureza asociada a ellas
# Ahora grafiquemosla
varImpPlot(modelo.bosque)

#### Eduviajes 13
# En esta sesion aprenderemos a predecir las probabilidades y clasificar los datos en nuestra base
# testing utilizando Random Forest

# Primero encontremos las probabilidades de retencion en nuestra base testing utilizando el modelo de 
# bosque aleatorio que hicimos en la sesion anterior
probabilidades.bosque<-predict(modelo.bosque,newdata=testing,type="prob")

# Abramos la variable que acabamos de crear y podemos observar una matriz de dos columnas
# en la que la clase 0 es la prediccion de la probabilidad de no retencion, es decir de que el
# grupo no tome un programa el proximo año, y 1 es la probabilidad de retencion.

# Ahora hagamos la clasificacion con base a las probabilidades, y establezcamos el punto de corte en
# 0.5 para ser consistente con el punto de corte que utilizamos en la votacion
# Recordemos que esta probabilidad viene de una votación, imaginemonos a los 
# arboles del bosque votando... el 0.5 significa que la mitad de los arboles
# piensa que el grupo regresara el proximo año 

# Primero creemos un vector de unos al que luego asignaremos los ceros
clasificacion.bosque<-rep("1",477) 
clasificacion.bosque[probabilidades.bosque[,2]<0.5]="0"	
clasificacion.bosque = as.factor(clasificacion.bosque)

# Ahora creemos la matriz de confusion
confusionMatrix(clasificacion.bosque,testing$Retenidos2020,positive	= "1") 

# Notemos que la precision del modelo es significativamente mayor a la que
# obtuvimos con el arbol, que era de 0.6352

### Eduviajes 14
# En esta sesion elaboraremos la Curva ROC de la prediccion que hicimos con el bosque
# aleatorio

#### ROC Curve
# Primero calculemos los errores de la prediccion
prediccion.bosque.ROC	<-	prediction(probabilidades.bosque[,2], testing$Retenidos2020) 

# Ahora creamos la curva
ROC.bosque <- performance(prediccion.bosque.ROC,"tpr","fpr")
# Graficar curva ROC
plot(ROC.bosque) 

# Ahora estimemos el area bajo la curva
# Estimemos el area bajo la curva en una variable temporal
AUC.temporal <- performance(prediccion.bosque.ROC,"auc") 
# Ahora extraigamos el area bajo la curva
AUC.bosque <- as.numeric(AUC.temporal@y.values) 
AUC.bosque

# Para comparar el AUC que obtuvimos con ctree fue de 0.82385

### Sesion 15 XGBoost

 #XGBoost se utiliza normalmente para entrenar árboles de decisión 
# potenciados por gradiente y otros modelos impulsados por gradiente.
# Dichos arboles usan el mismo modelo inferencial que los bosques aleatorios 
# pero su algoritmo de entrenamiento es diferente. 
# Se puede usar XGBoost para entrenar un bosque aleatorio 
# independiente o usar un bosque aleatorio como modelo base 
# para aumentar el gradiente.

# Al igual que los bosques aleatorios, los bosques potenciados por
# gradiente son un conjunto de árboles de decisión. 
# Las dos principales diferencias son:
  
# 1. Cómo se construyen los árboles: los bosques aleatorios construyen
# cada árbol de forma independiente, mientras que el aumento de 
# gradiente construye un árbol a la vez. Este modelo aditivo 
# (conjunto) funciona de manera progresiva por etapas, presentando 
# un arbol aprendiz débil para mejorar las deficiencias de los 
# otros arboles aprendices 
# débiles existentes.
# 2. Combinacion de resultados: los bosques aleatorios combinan 
# los resultados al final del proceso (ya sea promediando o por
# votacion) mientras que el aumento de gradiente combina los 
# resultados a lo largo del camino.

# install.packages("xgboost")
library(xgboost)

training.x <-model.matrix(Retenidos2020~ ., data = training) 
testing.x <-model.matrix(Retenidos2020~ ., data = testing)

modelo.XGboost<-xgboost(data = data.matrix(training.x[,-1]),
                       label= as.numeric(as.character(training$Retenidos2020)),
                       eta = 0.1,
                       max_depth = 20, nround=50,
                       objective = "binary:logistic")

# eta: (rango 0-1Reducción del tamaño del paso utilizada en la actualización 
# para evitar el sobreajuste. Después de cada paso de impulso, 
# podemos obtener directamente los pesos de las nuevas funciones, 
# y eta reduce los pesos de las funciones para que el proceso de 
# potenciamiento de gradiente sea más conservador.
# max depth: la profundidad maxima del arbol
# nrounds: el numero de veces que se repite el proceso de
# validación cruzada, y cada una de las n veces submuestras se 
# utiliza exactamente una vez como datos de validación.

# Prediccion de la clasificacion
prediccion.XGboost<-predict(modelo.XGboost,newdata=testing.x[,-1], type="response")  
# Matriz de Confusion
confusionMatrix(as.factor(ifelse(prediccion.XGboost>0.607,1,0)),testing$Retenidos2020, positive = "1") 


# accuracy de ctree es 0.6352


## Eduviajes 16

# Bienvenidos a esta sesion donde elaboraremos la curva ROC para nuestro modelo de bosque
# potenciado por gradiente, a la cual superpondremos la curva del modelo de random forest
# para compararla

# Iniciemos calculando los errores
XGboost.errores	<-	prediction(prediccion.XGboost, testing$Retenidos2020) 
# Ahora creamos la curva ROC con base a los errores
ROC.XGboost <- performance(XGboost.errores,"tpr", "fpr")
# Finalmente, graficamos la curva ROC
plot(ROC.XGboost) 

# Ahora comparemosla con la curva ROC que hicimos con Random Forests
plot(ROC.bosque, add=TRUE, col="blue")
plot(ROC.ctree, add=TRUE, col="red")
legend("right", legend=c("XGboost", "RandomForest", "ctree"), col=c("black", "blue", "red"), lty=1:2, cex=0.8)

#### AUC
AUC.XGboost.temporal <- performance(XGboost.errores,"auc") 
# Extraemos AUC
AUC.XGboost <- as.numeric(AUC.XGboost.temporal@y.values)
AUC.XGboost
AUC.bosque
AUC.ctree


