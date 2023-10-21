########
### La toma de decisiones es una parte importante de la programación.
### Esto se puede lograr en la programación de R usando la instrucción condicional 
### if ... else.

## La sintaxis de la declaración if: 

if (expresion_a_evaluar) {
  declaracion
}

# Si la expresión a evaluar es TRUE, la declaración se ejecuta. 
# Pero si es FALSO, no pasa nada.

# Aquí, expresión_a_evaluar puede ser un vector logico o numerico, 
# pero solo se tiene en cuenta el primer elemento.

# En el caso del vector numerico, cero se toma como FALSO, el resto como
# VERDADERO.

# Veamos un ejemplo

x <- 5
if(x > 0){
  print("Es positivo")
}

x <- 0
if(x > 0){
  print("Es positivo")
}

######
# Declaracion if... else

# Sintaxis de la declaracion

if (expresion_a_evaluar) {
  declaracion1
} else {
  declaracion2
}

# La parte else es opcional y solo se eval?a si test_expression es FALSE.

# Es importante tener en cuenta que else debe estar en la misma l?nea que 
# las llaves de cierre de la instruccion if. Veamos un ejemplo

x <- -1
if(x < 0){
  print("Numero negativo")
} else {
  print("Numero no negativo")
}

###
### Declaracion en escalera: if... else... if

# La sentencia if. else ladder (if. else. if) le permite ejecutar un bloque 
# de codigo entre mas de 2 alternativas

# La sintaxis de la declaracion if ... else es:

if ( expresion_a_evaluar_1) {
  declaracion_1
} else if ( expresion_a_evaluar_2) {
  declaracion_2
} else if ( expresion_a_evaluar_3) {
  declaracion_3
} else {
  declaracion_4
}

# Ejemplo

x <- 0
if (x < 0) {
  print("Negativo")
} else if (x > 0) {
  print("Positivo")
} else {
  print("Cero")
}
