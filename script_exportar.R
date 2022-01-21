library(MLDataR)

tir <- MLDataR::thyroid_disease

#Cogemos un data set, le damos un nombre y lo guardamos:
write.csv(tir, file = "dataset_tiroides.csv")
