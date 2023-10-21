##
# En estadística, las medidas de dispersión (también llamadas variabilidad, 
# dispersión o propagación) es el grado en que una distribución se estira o 
# exprime.??? Ejemplos comunes de medidas de dispersión estadística son la varianza, 
# la desviación estándar y el coeficiente de variabilidad.

####
# En teoría de probabilidad, la varianza o variancia (que suele representarse 
# como sigma^2 de una variable aleatoria es una medida de dispersión definida 
# como la esperanza del cuadrado de la desviación de dicha variable respecto a 
# su media. Su unidad de medida corresponde al cuadrado de la unidad de medida
# de la variable: por ejemplo, si la variable mide una distancia en metros, la 
# varianza se expresa en metros al cuadrado. La varianza tiene como valor 
# mínimo 0. 

# Aprendamos a calcular la varianza en R
# Creemos un vector
x = c(1,10,23,45,67,89,45,6,7,3,4,6,25)
var(x)



#######
# En estadística, la desviación típica (también conocida como desviación estándar 
# y representada de manera abreviada por la letra griega minúscula sigma ?? o 
# la letra latina s, así como por las siglas SD (de standard deviation, en 
# algunos textos traducidos del inglés)) es una medida que se utiliza para 
# cuantificar la variación o la dispersión de un conjunto de datos numéricos.1???

# Una desviación estándar baja indica que la mayor parte de los datos de 
# una muestra tienden a estar agrupados cerca de su media (también denominada 
# el valor esperado), mientras que una desviación estándar alta indica que 
# os datos se extienden sobre un rango de valores más amplio.

x
sd(x)
sqrt(var(x))

####
# En estadística, cuando se desea hacer referencia a la relación entre el 
# tamaño de la media y la variabilidad de la variable, se utiliza el 
# coeficiente de variación (suele representarse por las siglas "C.V.").

# Su fórmula expresa la desviación estándar como porcentaje de la media 
# aritmética, mostrando una interpretación relativa del grado de variabilidad, 
# independiente de la escala de la variable, a diferencia de la desviación 
# típica o estándar. Por otro lado presenta problemas ya que a diferencia 
# de la desviación típica este coeficiente es fuertemente sensible ante 
# cambios de origen en la variable. Por ello es importante que todos los 
# valores sean positivos y su media dé, por tanto, un valor positivo. 
# A mayor valor del coeficiente de variación mayor heterogeneidad de los 
# valores de la variable; y a menor C.V., mayor homogeneidad en los valores 
# de la variable. Por ejemplo, si el C.V es menor o igual al 80%, significa 
# que la media aritmética es representativa del conjunto de datos, por ende 
# el conjunto de datos es "Homogéneo". Por el contrario, si el C.V supera 
# al 80%, el promedio no será representativo del conjunto de datos (por lo 
# que resultará "Heterogéneo"). 

install.packages("FinCal")
library(FinCAl)
coefficient.variation(sd=sd(x), avg = mean(x))

# Los resultados muestran que la variable x presenta una dispersión del #
# 110% según el valor obtenido en el coeficiente de variación.Al superar
# el 80%, podemos concluir que el promedio no es represntativo del conjunto
# de datos.
