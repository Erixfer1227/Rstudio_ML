## Importando datos en R

# Para archivos csv, separados por Coma
# La primera fila contiene los nombres de las variables
# asignar la variable id al nombre
# notar  / en lugar de \ que viene por defecto en windows

misdatos <- read.table("/Users/Carlos Martinez/Documents/ventasporpais.csv", header=TRUE,
                     sep=";", row.names="ID")


