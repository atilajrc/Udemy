#!/bin/bash

#####################
## Data: 20-08-2020
## Nome: busca_site_titulos.sh
## Autor: fatchadeus
#####################

# -------------------
# 1- Variáveis
# -------------------

ARQUIVO_DE_TITULOS="titulos.txt"
VERD="\033[32;1m"
VERM="\033[31;1m"
FILE="/usr/bin/lynx"

# -------------------
# 2- Testes
# -------------------

clear

## informa sobre a verificação
	echo -e "\e[1;32mO lynx está instalado?\e[0m"
	sleep 3
	
## validando se a ferramenta necessária está instalada

clear

if test -f "$FILE"; then
	echo "O lynx está instalado. Continue."
else 
	echo "O lynx não está instalado. Instalando o lynx antes de continuar."
	sudo apt update
	sudo apt install lynx
	sudo apt update
	echo "Lynx instalado"
	sleep 3
fi

# -------------------
# 3- em uma linha:
# -------------------

# clear; FILE="/usr/bin/lynx"; if test -f "$FILE"; then echo "O lynx está instalado. Continue."; else echo "O lynx não está instalado. Instalando o lynx antes de continuar." && sudo apt update && sudo apt install lynx && echo "Lynx instalado." && sleep 3; fi

# -------------------
# 4- Execução
# -------------------

	touch titulos.txt
	
	echo -e "\e[1;32mBuscando títulos no site ...\e[0m"
	sleep 3

	firejail --noprofile lynx -source https://umsite.com/ | grep blurb | sed 's/<div.*line">//;s/<\/span.*//' > titulos.txt

while read -r titulo_lxer
do
    echo -e "${VERM}Titulo: ${VERD}$titulo_lxer"  
done < "$ARQUIVO_DE_TITULOS"

rm -f titulos.txt


## fim do script
