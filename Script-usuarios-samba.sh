#!/bin/bash

#Este script añadirá 5 usuarios a una unidad organizativa de Active Directory para un servidor Samba. 

#Primero se definen los usuarios que serán añadidos a la unidad organizativa

USUARIO1="Juan"
CORREO1="juan@example.com"
USUARIO2="Pedro"
CORREO2="pedro@example.com"
USUARIO3="Ana"
CORREO3="ana@example.com"
USUARIO4="Miguel"
CORREO4="miguel@example.com"
USUARIO5="Sara"
CORREO5="sara@example.com"

#Ahora se crea la unidad organizativa para los usuarios

sudo samba-tool ou create OU=USERS

#Ahora se añaden los usuarios a la unidad organizativa

sudo samba-tool user add "$USUARIO1" --mail-address="$CORREO1" --ou="OU=USERS"
sudo samba-tool user add "$USUARIO2" --mail-address="$CORREO2" --ou="OU=USERS"
sudo samba-tool user add "$USUARIO3" --mail-address="$CORREO3" --ou="OU=USERS"
sudo samba-tool user add "$USUARIO4" --mail-address="$CORREO4" --ou="OU=USERS"
sudo samba-tool user add "$USUARIO5" --mail-address="$CORREO5" --ou="OU=USERS"

#Ahora se imprime el mensaje de confirmación

echo "Los usuarios $USUARIO1, $USUARIO2, $USUARIO3, $USUARIO4 y $USUARIO5 han sido añadidos correctamente a la unidad organizativa OU=USERS"