###
# Operadores Lógicos
# Los operadores lógicos se utilizan para realizar operaciones booleanas
# Entre los operadores lógicos tenemos
# ! NOT
# & AND lógico elemento por elemento
# && AND lógico para el primer elemento del objeto (vector, matriz, etc.)
# | OR lógico elemento por elemento
# || OR lógico para el primer elemento del objeto

# Los Operadores & y | realizan una operación de elemento por elemento produciendo un 
# resultado que tenga la longitud del operando más largo.

# Pero && y || evaluan solo el primer elemento de los operandos que da como resultado 
# un vector lógico de longitud única.

# El cero se considera FALSO y los números distintos de cero se toman como 
# VERDADERO. Veamos un ejemplo

# Iniciemos creando dos vectores

x = c(TRUE, TRUE, FALSE, 0, 1, 5)
y = c(FALSE, TRUE, FALSE, 0, 0, 3)

!x
x&y
x&&y
x|y
x||y