library(MLDataR)

tir <- MLDataR::thyroid_disease

#Cogemos un data set, le damos un nombre y lo guardamos:
write.csv(tir, file = "dataset_tiroides.csv")

#Al final de cada trabajo, escribir este comando.
#Nos da toda la información de la sesión: los packages, etc.
sessionInfo()

#Para ORDENAR todos los grupos según la edad de los pacientes
head(tir)
sort(tir$patient_age)
tir2 <- tir[order(tir$patient_age),]

#Para QUITAR TODOS LOS MISSING VALUES (NA) de un data set.
#De esta forma, quita a todos los pacientes que tengan un NA en algún valor;
#es una manera rápida pero perdemos muchos pacientes.
tir_completo <- tir[complete.cases(tir),]

#AGRUPAR POR GRUPOS Y HACER UN CÁLCULO ESTADÍSTICO.
#Por ejemplo, queremos saber la media de la edad de los pacientes que tienen tiroides y los que no.
aggregate(tir_completo$patient_age,
          list(tir_completo$ThryroidClass),
          mean)
#En esta función debemos añadir el argumento list(), que sirve para convertir un vector en una lista.
#Este list se pone con el parámetro con el que vamos a crear los grupos.

#Además, dentro del list podemos meter más de una clase por la que queramos separar.
aggregate(tir_completo$patient_age,
          list(tir_completo$ThryroidClass, tir_completo$patient_gender),
          mean)
#En el EXAMEN pregunta cómo poder agrupar por varios objetos; para ello debemos usar este método.

#Para cambiar el nombre de las columnas que se generan en el comando anterior (y que no sean genéricos):
edad_tyr <- aggregate(tir_completo$patient_age,
                      list(tir_completo$ThryroidClass),
                      mean)
names(edad_tyr) <- c("Tiroides", "Media")
#Igual pero incluyendo el género también:
edad_gen_tyr <- aggregate(tir_completo$patient_age,
          list(tir_completo$ThryroidClass, tir_completo$patient_gender),
          mean)
names(edad_gen_tyr) <- c("Tiroides", "Género", "Media")
