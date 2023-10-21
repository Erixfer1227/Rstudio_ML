# Evaluación de la precisión del modelo

# la calidad general del modelo se puede evaluar examinando el R cuadrado 
# (R2)

# R-cuadrado:
  
# En la regresión lineal múltiple, el R2 representa el coeficiente de 
# correlación entre los valores observados de la variable de resultado (ye)
# y los valores ajustados (es decir, predichos) de ye. 
# Por esta razón, el valor de R siempre será positivo y variará de cero a uno.

# R2 representa la proporción de varianza, en la variable de resultado ye, 
# que puede predecirse conociendo el valor de las variables x. 
# Un valor de R2 cercano a 1 indica que el modelo explica una gran parte de 
#la varianza en la variable de resultado.

#Un problema con el R2 es que siempre aumentará cuando se agreguen más 
#variables al modelo, incluso si esas variables solo están débilmente 
#asociadas con la respuesta (James et al. 2014). Una solución es ajustar 
#el R2 teniendo en cuenta el número de variables predictoras.

#El ajuste en el valor "Cuadrado R ajustado" en el resultado de resumen 
#es una corrección para el número de x variables incluidas en el modelo de 
#predicción.

#Para ilustrar el uso del R cuadrado ajustado, seguiremos utilizando la 
#el conjunto de datos marketing de la base datarium

#Volvamos a poner en nuestra librería a datarium y carguemos la base marketing
library(datarium)
data("marketing", package = "datarium")
str(marketing)

#En la sesion anterior, corrimos un modelo con tres variables independientes
#que era la inversión en publicidad en youtube, facebook y periódico 
#que explicaban las ventas de un negocio, corramos este modelo

modelo <- lm(sales ~ youtube + facebook + newspaper, data = marketing)
summary(modelo)

#como podemos observar, el modelo tiene un R2 ajustado de 0.8956, lo cuál es
#bastante alto, sin embargo la variable periódico no es significativa.
#Probemos elaborando un nuevo modelo que excluya dicha variable

modelo1 <- lm(sales ~ youtube + facebook, data = marketing)
summary(modelo1)

#En este nuevo modelo, obtuvimos un r2 ajustado de 0.8962 lo cual es un poco
#mayor a 0.8956 del modelo anterior, por lo que podríamos afirmar que este 
#segundo modelo con sólo dos variables independientes, tiene un mayor poder
#explicativo que el primero. En este modelo, ambas variables son estadísticamente
#significativas y tenemos un R2 bastante alto. Sólo por curiosidad, elaboremos
#modelos con regresión lineal simple para cada una de las dos variables youtube
#y facebook

modelo2 <- lm(sales ~ youtube, data = marketing)
summary(modelo2)

#En este tercer modelo, con sólo youtube como variable independiente obtuvimos
#un R2 ajustado de 0.6099, lo cuál es menor al modelo de dos variables. 
#Ahora los invito a elaborar por su cuenta la regresión simple con facebook
#como variable independiente. Desde ya les aviso que obtendrán un R2 ajustado
#de 0.3287 incluso menor que el de la regresión de youtube.

#Que podríamos concluir de este ejercicio: Que para la información disponible,
#el mejor modelo para predecir las ventas es el modelo de dos variables 
#independientes: facebook y youtube, ya que es el que tiene un mayor R2 ajustado.

#Una pregunta válida es: deberíamos incluir una variable que no es
#estadísticamente significativa en un modelo. La respuesta, como todo en la vida
#es depende. Si ud. está probando hipótesis dentro de una investigación científica
#con el fin de generar una publicación, entonces su objetivo es crear el modelo
#más parsimonioso posible, es decir, el modelo más sencillo posible...
#en ese caso, debería desechar las variables no estadísticamente significativas.
# Pero si su finalidad es crear un modelo predictivo, entonces su objetivo es
# obtener el mayor R2 ajustado, y en esos casos, es posible que una variable no
# estadísticamente significativa podría por su interacción con otras variables,
# aumentar el R2 ajustado. En dicha salvedad, debería incluirla.

# con esto finalizamos la sesión. Muchas gracias!



