# LIBRERIAS ####
library(psych)
library(caret)
library(partykit)
library(e1071)
library(ROCR)
library(rpart)
library(rpart.plot)
library(randomForest)
library(xgboost)

# IMPORTAR BASE DE DATOS ####
HR <- read.table("/Users/erickfernandochaconflores/Downloads/HR.csv", 
                        header=TRUE, sep=",", row.names="EmployeeID")
# 4410 obs.

# LIMPIANDO NA´s
# Borra toda la fila
sum(is.na(HR))
HR <- na.omit(HR)
# 4382 obs. (28 filas eliminadas)

# BALANCEANDO DATASET
set.seed(2020)
index_yes <- HR$Attrition == "1"
Default_yes <- HR[index_yes,] # 705 obs. 16% son Abandono, BD desbalaceada.
Default_no <- HR[!index_yes,] # 3677 obs. 84% son No Abandono.

# Para generar una muestra aleatoria de la clase mayoritaria "Default_no" 
# con un tamaño específico.
index <- sample(1:nrow(Default_no), size = nrow(Default_yes)*0.4298)
Default_no <- Default_no[index,]

HR <- rbind(Default_no, Default_yes)
HR <- HR[sample(1:nrow(HR)),]

# VARIABLES A FACTOR ####
str (HR)
HR$Attrition <- as.factor(HR$Attrition)
unique(HR$Attrition)
HR$BusinessTravel <- as.factor(HR$BusinessTravel)
unique(HR$BusinessTravel)
HR$Department <- as.factor(HR$Department)
unique(HR$Department)
HR$Education <- as.factor(HR$Education)
unique(HR$Education)
HR$EducationField <- as.factor(HR$EducationField)
unique(HR$EducationField)
HR$Gender <- as.factor(HR$Gender)
unique(HR$Gender)
HR$JobLevel <- as.factor(HR$JobLevel)
unique(HR$JobLevel)
HR$JobRole <- as.factor(HR$JobRole)
unique(HR$JobRole)
HR$MaritalStatus <- as.factor(HR$MaritalStatus)
unique(HR$MaritalStatus)
HR$StockOptionLevel <- as.factor(HR$StockOptionLevel)
unique(HR$StockOptionLevel)

# ELMINAR COLMUNAS ####
HR <- subset(HR, select = -c(Over18, EmployeeCount))

# PREPRACIÓN DE DATOS ####
set.seed(2020) 

particion <- createDataPartition(y = HR$Attrition, 
                                 p = 0.8, list = FALSE)

training <- HR[ particion,] 
testing <- HR [ -particion,]


# CREANDO ARBOL ####
arbol.ctree = ctree(training$Attrition ~.,data=training)

# GRÁFICANDO ARBOL ####
plot(arbol.ctree, gp = gpar(fontsize = 7))

# PREDECIR USANDO EL ARBOL ####
# Estimar la probabilidad de Abandono en la base testing
probabilidades.ctree <- predict(arbol.ctree,newdata=testing,type="prob") 
head(probabilidades.ctree)

# Con base a las probabilidades de abandono, establecer la clasificacion
# para eso, se necesita la tasa de corte. Generalmente, esta tasa se calcula
# con base a los costos. Como no se tienen, se estima la probabilidad promedio 
# de abandono
mean(as.integer(HR$Attrition))

# La probabilidad promedio de abandono es de 0.699405, se utilizará como 
# tasa de corte

# Crear un vector de 201 datos, el tamaño de la base testing
clasificacion.ctree <- rep("1",201)

# Y ahora asignar cero a aquellos registros con una probabilidad de abandono
# menor a 0.160885
clasificacion.ctree[probabilidades.ctree[,2]<0.699405]= "0"	

# Ahora convertir a factor, ya que la funcion que se utilizará para
# crear la Matriz de Confusion requiere que los datos sean factores con el
# mismo numero de niveles, en este caso son dos nivels 0 y 1
clasificacion.ctree <- as.factor(clasificacion.ctree)

# Imprimir la matriz de Confusion de la clasificacion
# para ello se utilizará la funcion confusionMatrix del paquete e1071
# Cuando hay una gran disparidad entre las clases objetivo, los modelos de 
# aprendizaje automático pueden tener dificultades para aprender patrones y 
# hacer predicciones precisas para las clases minoritarias
# es probable que el modelo tenga un sesgo hacia las clases dominantes. 
confusionMatrix(clasificacion.ctree,testing$Attrition, positive = "1") 

# CURVA ROC ####
# Calcular errores
prediccion.ctree.ROC <- prediction(probabilidades.ctree[,2], testing$Attrition)
ROC.ctree <- performance(prediccion.ctree.ROC,"tpr","fpr") 
# Graficar la curva ROC
plot(ROC.ctree)

# AUC (Area Under the Curve)
AUC.temporal <- performance(prediccion.ctree.ROC,"auc") 
# Extraigamos y convirtamos a variable numerica los valores para calcular AUC
AUC.ctree <- as.numeric(AUC.temporal@y.values) 
AUC.ctree 
# Para valores mayores 90% - excelente, 
# Entre 80-90% muy buenos
# Entre 70-80% - buenos, 
# Entre 60-70% mas o menos
# Menos de 60% - no es de mucho valor

# Definamos la complejidad del arbol
rpart.cp = rpart.control(cp = 0.0005)
# Creamos el arbol con rpart
arbol.rpart<-rpart(Attrition ~.,data=training,	method="class", 
                   control=rpart.cp) 
rpart.plot(arbol.rpart)

# Ahora creemos un arbol con menor complejidad
rpart.cp2 = rpart.control(cp = 0.01)
arbol.rpart2<-rpart(Attrition~.,data=training,	method="class", 
                    control=rpart.cp2) 
rpart.plot(arbol.rpart2) 

# Primero, imprimamos los datos de esta relaci?n
printcp(arbol.rpart) 

plotcp(arbol.rpart)
# Como escogemos cp: elegimos el ?ltimo que no cause una ca?da substancial 
# del error

# Ahora podemos el arbol
arbol.podado <-prune(arbol.rpart, cp=0.0144033) 
rpart.plot(arbol.podado)

probabilidades.rpart<-predict(arbol.podado,newdata=testing,type="prob")

clasificacion.rpart<-rep("1",201) 

clasificacion.rpart[probabilidades.rpart[,2]<0.699405]="0"		
# Finalmente, lo convertimos en factor para poder elaborar la matriz
# de confusion
clasificacion.rpart<- as.factor(clasificacion.rpart)
# Ahora elaboramos nuestra matriz de confusion
confusionMatrix(clasificacion.rpart,testing$Attrition, positive = "1") 

#### Primero calculemos los errores para poder graficar la curva ROC
prediccion.rpart.ROC	<-	prediction(probabilidades.rpart[,2], 
                                   testing$Attrition) 
# Y ahora si estimemos los valores de la curva ROC
rpart.ROC <- performance(prediccion.rpart.ROC,"tpr","fpr") 
# Y grafiquemos
plot(rpart.ROC)

# Ahora comparemosla con la curva ROC que hicimos con ctree
plot(ROC.ctree, add=TRUE, col="blue") 
legend("right", legend=c("RPART", "CTREE"), col=c("black", "blue"), lty=1:2, 
       cex=0.8)

#### Ahora estimemos el area bajo la curva
# Creemos AUC temporal
AUC.temporal.rpart <- performance(prediccion.rpart.ROC,"auc") # Create AUC data 
# Extraigamos el valor
rpart.AUC <- as.numeric(AUC.temporal.rpart@y.values) 
rpart.AUC
# De un modelo mas o menos a un modelo bueno

# Para valores mayores 90% - excelente, 
# Entre 80-90% muy buenos
# Entre 70-80% - buenos, 
# Entre 60-70% mas o menos
# Menos de 60% - no es de mucho valor

# RANDOM FOREST ####
modelo.bosque <- randomForest(Attrition~ ., data=training,
                              importance=TRUE,proximity=TRUE,
                              cutoff  =  c(0.5,  0.5),type="classification")

print(modelo.bosque) 
plot(modelo.bosque) 
# Podemos observar como luego de 100 arboles, el error del modelo tiede a
# un error de aproximadamente 0.02, Esto implica que por mas arboles que usemos
# en el bosque ya no vamos a disminuir el error
importance(modelo.bosque) 
# Podemos observar la importancia que tiene cada una de las variables en el
# modelo, medio tanto por la exactitud como por la impureza asociada a ellas
# Ahora grafiquemosla
varImpPlot(modelo.bosque)

probabilidades.bosque<-predict(modelo.bosque,newdata=testing,type="prob")


clasificacion.bosque<-rep("1",201) 
clasificacion.bosque[probabilidades.bosque[,2]<0.699405]="0"	
clasificacion.bosque = as.factor(clasificacion.bosque)

# Ahora creemos la matriz de confusion
confusionMatrix(clasificacion.bosque,testing$Attrition,positive	= "1") 

prediccion.bosque.ROC	<-	prediction(probabilidades.bosque[,2], 
                                    testing$Attrition) 

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
# De un modelo mas o menos a un modelo bueno y luego a un modelo excelente

# Para valores mayores 90% - excelente, 
# Entre 80-90% muy buenos
# Entre 70-80% - buenos, 
# Entre 60-70% mas o menos
# Menos de 60% - no es de mucho valor

# XGBoost ####
training.x <-model.matrix(Attrition~ ., data = training) 
testing.x <-model.matrix(Attrition~ ., data = testing)

modelo.XGboost<-xgboost(data = data.matrix(training.x[,-1]),
                        label= as.numeric(as.character(training$Attrition)),
                        eta = 0.1,
                        max_depth = 20, nround=50,
                        objective = "binary:logistic")


# Prediccion de la clasificacion
prediccion.XGboost<-predict(modelo.XGboost,newdata=testing.x[,-1], 
                            type="response")  
# Matriz de Confusion
confusionMatrix(as.factor(ifelse(prediccion.XGboost>0.699405,1,0)),
                testing$Attrition, positive = "1") 

# Iniciemos calculando los errores
XGboost.errores	<-	prediction(prediccion.XGboost, testing$Attrition) 
# Ahora creamos la curva ROC con base a los errores
ROC.XGboost <- performance(XGboost.errores,"tpr", "fpr")
# Finalmente, graficamos la curva ROC
plot(ROC.XGboost) 

# Ahora comparemosla con la curva ROC que hicimos con Random Forests
plot(ROC.bosque, add=TRUE, col="blue")
plot(ROC.ctree, add=TRUE, col="red")
legend("right", legend=c("XGboost", "RandomForest", "ctree"), 
       col=c("black", "blue", "red"), lty=1:2, cex=0.8)

#### AUC
AUC.XGboost.temporal <- performance(XGboost.errores,"auc") 
# Extraemos AUC
AUC.XGboost <- as.numeric(AUC.XGboost.temporal@y.values)
AUC.XGboost
AUC.bosque
AUC.ctree







