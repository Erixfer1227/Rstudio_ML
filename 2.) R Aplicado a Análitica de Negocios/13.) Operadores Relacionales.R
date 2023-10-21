# Los operadores relacionales, o comparadores, son operadores que nos ayudan a ver 
# cómo un objeto R se relaciona con otro.

# El operador de igualdad ==
  
# Puede verificar si dos objetos son iguales (igualdad) usando un signo 
# de igual doble ==

# Por ejemplo, comparemos las variables lógicas
TRUE == TRUE
FALSE == TRUE

# Aparte de las variables lógicas, podemos comparar otros tipos de variables como
# números y caracteres

"hola" == "adios"
0 == 0
2 == 3
# también podemos comparar operaciones como
2 + 5 == 3 + 4
# R es sensitivo a mayúsculas
"Carlos" == "carlos"

######
# El operador de desigualdad !=

# Lo opuesto al operador de igualdad son los operadores de desigualdad, 
# escritos como un signo de exclamación seguido de un signo igual (!=).

# Por ejemplo, la expresión "hola" != "adiós" sería entendida por R como 
# "hola no es igual a adiós" lo cuál es verdadero (TRUE)
"hola" != "adiós"

#Otros ejemplos
TRUE != TRUE
FALSE != TRUE
1 != 0
3+2 != 2+3
# recordemos, R es sensitivo a mayúsculas

"Carlos" != "carlos"

####
# Los operadores > y <

# También hay casos en los que necesitamos algo más que operadores de igualdad y 
#desigualdad. Podemos usar el signo menor que < y mayor que > para esto.
# En el caso de valores numéricos, es bastante sencillo. 
# Por ejemplo, 3 es menor que 5, por lo que 3 <5 se evaluará como VERDADERO, 
# mientras que 3 mayor que 5 (3> 5) se evaluará como FALSO.

3 < 5
3 > 5

# Para los números, esto tiene sentido. Pero, ¿cómo funcionaría esto para cadenas 
# de caracteres y valores lógicos?   Para las cadenas de caracteres, R usa el 
# alfabeto para ordenarlas. Entonces, "hola" > "adiós" se evaluaría como VERDADERO 
# ya que "H" viene después de "G" en el alfabeto, y R lo considera mayor.

"hola" > "adiós"

# Para valores lógicos, VERDADERO corresponde a 1 y FALSO corresponde a 0. 
# Entonces, ¿TRUE es menor que FALSE? No, porque 1 no es menor que 0, 
# de ahí el resultado FALSO.

TRUE < FALSE

####
# Los operadores menor o igual que y mayor o igual que <= y> =
# También podemos verificar si un objeto R es mayor o igual (o menor o igual que) 
# otro objeto R. Para hacer esto, podemos usar el signo menor que, o el signo mayor que,
# junto con el signo igual.

# Entonces, 5 mayor o igual a 3 5> = 3, así como 3 mayor o igual que 3 3> = 3 
#se evaluarán como VERDADERO.

5 >= 3
5 >= 5
