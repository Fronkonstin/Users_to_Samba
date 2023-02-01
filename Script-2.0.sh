#!/bin/bash

#Comprobamos si el usuario existe
for i in $(cat usuarios.txt);
do
	user=$(echo $i | cut -d":" -f1)
	echo "Comprobando si el usuario $user existe..."
	if id $user &>/dev/null;
	then
		echo "Ya existe el usuario $user"
	else
		echo "No existe $user, creamos el usuario..."
		smbpasswd -a $user
		#Creamos el usuario
		echo "Creando el usuario $user..."
		useradd -d /users/$user -g users $user
		echo "Usuario $user creado con exito."
	fi
	#Añadimos los usuarios a la unidad organizativa
	echo "Añadiendo el usuario $user a la unidad organizativa..."
	if net ads join -U Administrator;
	then
		echo "Usuario $user añadido con exito a la unidad organizativa."
	else
		echo "Se ha producido un error al añadir el usuario $user a la unidad organizativa. Registramos el error..."
		echo "Error al añadir el usuario $user a la unidad organizativa" >> log_errores.txt
	fi
done