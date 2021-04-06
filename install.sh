#!/bin/bash

#IPADDRESS() {
#	ADDIP="ip a add $1 dev $2 brd +"
#	echo `$ADDIP`
#}


INSTALLSQLSERVER() {
	INSTALLGNUPG2="sudo apt install gnupg2"
	INSTALLWGET="sudo apt install wget"
	INSTALLCURL="sudo apt install curl"
	KEYGPL="wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -"
	REPO="sudo add-apt-repository '$(wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list)'"
	UPDATEANDUPGRADE="sudo apt update; sudo ap upgrade -y"
	INSTALLMSSQLSERVER="sudo apt install -y mssql-server"
	CONF="sudo /opt/mssql/bin/mssql-conf setup"
	STATUS="sudo systemctl status mssql-server.service"
	P="curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -"
	S="curl https://packages.microsoft.com/config/ubuntu/19.10/prod.list > /etc/apt/sources.list.d/mssql-release.list"
	T="sudo apt update; sudo apt update -y"
	F="sudo ACCEPT_EULA=Y apt install mssql-tools unixodbc-dev"
	echo $INSTALLGNUPG2
	echo $INSTALLWGET
	echo $INSTALLCURL
	echo $KEYGPL
	echo $REPO
	echo $UPDATEANDUPGRADE
	echo $INSTALLMSSQLSERVER
	echo $CONF
	echo $STATUS
	echo $P
	echo $S
	echo $T
	echo $F
	echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
	echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
	echo 'source ~/.bashrc'
}

INSTALLORACLE() {
	echo "hola"		
}

#IPADDRESS="ip a add '$1' "

saludar() {
	hola="Hola $1, como estas"
	echo $hola
}


InstalarSqlServer() {
	python3 -c "

import os

class InstalarSqlServer:
	def __init__(self,file = 'sqlserver.txt'):
		self.file = file

	def install(self):
		file = open(self.file,'r')
		data = file.read()

		for i in data.split(';'):
			os.system(i)

installer = InstalarSqlServer()
installer.install()

	"
}


#echo " _____   ____  _____    ______    _________        _         _____           _        ______       ___     _______    "
#echo "|_   _| |_   \|_   _| .' ____ \  |  _   _  |      / \       |_   _|         / \      |_   _ ` .  .'   `.  |_   __ \   "
#echo "  | |     |   \ | |   | (___ \_| |_/ | | \_|     / _ \        | |          / _ \       | | `. \ /  .-.  \   | |__) |  " 
#echo "  | |     | |\ \| |    _.____`.      | |        / ___ \       | |   _     / ___ \      | |  | | | |   | |   |  __ /   " 
#echo " _| |_   _| |_\   |_  | \____) |    _| |_     _/ /   \ \_    _| |__/ |  _/ /   \ \_   _| |_.' / \  `-'  /  _| |  \ \_ " 
#echo "|_____| |_____|\____|  \______.'   |_____|   |____| |____|  |________| |____| |____| |______.'   `.___.'  |____| |___|" 


#echo "I)iiii N)n   nn  S)ssss  T)tttttt   A)aa   L)         A)aa   D)dddd    O)oooo  R)rrrrr  "
#echo "  I)   N)nn  nn S)    ss    T)     A)  aa  L)        A)  aa  D)   dd  O)    oo R)    rr "
#echo "  I)   N) nn nn  S)ss       T)    A)    aa L)       A)    aa D)    dd O)    oo R)  rrr  "
#echo "  I)   N)  nnnn      S)     T)    A)aaaaaa L)       A)aaaaaa D)    dd O)    oo R) rr    "
#echo "  I)   N)   nnn S)    ss    T)    A)    aa L)       A)    aa D)    dd O)    oo R)   rr  "
#echo "I)iiii N)    nn  S)ssss     T)    A)    aa L)llllll A)    aa D)ddddd   O)oooo  R)    rr "

echo "	  ___   _   _   ____    _____      _      _          _      ____     ___    ____   "
echo "	 |_ _| | \ | | / ___|  |_   _|    / \    | |        / \    |  _ \   / _ \  |  _ \  "
echo "	  | |  |  \| | \___ \    | |     / _ \   | |       / _ \   | | | | | | | | | |_) | "
echo "	  | |  | |\  |  ___) |   | |    / ___ \  | |___   / ___ \  | |_| | | |_| | |  _ <  "
echo "	 |___| |_| \_| |____/    |_|   /_/   \_\ |_____| /_/   \_\ |____/   \___/  |_| \_\ "
echo "                                                                                     "
echo "                                                                                     "
echo "[0] Salir                                                                            "
echo "[1] Instalar SQLServer                                                               "
echo "[2] Instalar Oracle                                                                  "
echo "                                                                                     "
echo "Elije una opcion                                                                     "
read opcion

if [ $opcion = 0 ]; then
	exit 0
elif [ $opcion = 1 ]; then
	InstalarSqlServer
elif [ $opcion = 2 ]; then
	echo "hola"
fi


#InstalarSqlServer

#echo "Ingresa tu nombre"
#read nombre

#saludar $nombre
