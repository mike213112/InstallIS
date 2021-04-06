#!/bin/bash

IPADDRESS() {
	ADDIP="ip a add $1 dev $2 brd +"
	echo `$ADDIP`
}


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
		
}

#IPADDRESS="ip a add '$1' "

saludar() {
	hola="Hola $1, como estas"
	echo $hola
}

  

echo "Ingresa tu nombre"
read nombre

saludar $nombre
