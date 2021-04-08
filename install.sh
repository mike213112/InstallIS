#!/bin/bash

# Funtion for install SQLServer
INSTALLSQLSERVER() {
	python3 -c "

'''
	Import modulo os
'''
import os


'''
	define class for installed sqlserver
'''
class InstalarSqlServer:
	def __init__(self,file = 'requirements/SqlServer/sqlserver.txt'):
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


# Funtion for install Oracle
INSTALLORACLE() {
	python3 -c "

import os
import time
from getpass import getuser

try:
	from mega import Mega
	
	oracle = InstallOracle()
	oracle.instalarOracle()

except:
	mega = InstallMega()
	mega.instalarMega()

	oracle = InstallOracle()
	oracle.instalarOracle()


'''
	Class
'''
class InstallOracle:
	def __init__(self,file_oracle='requirements/Oracle/oracle.txt',url='https://mega.nz/file/uXRSHBDD#hqNtbw_jUPxrC_Fp-uyM8KfmqASViPtNvc5fWJ3-iZ4'):
		self.file = file_oracle
		self.url = url


	def instalarOracle(self):

		file = open(self.file_oracle,'r')
		data = file.read()

		'''
		self.create = 'sudo mkdir sbin'
		self.move_file = 'sudo move /Oracle/chkconfig /sbin/'
		'''

		self.create_and_move_file = [
			'sudo mkdir /sbin',
			'sudo move /Oracle/chkconfig /sbin/'
		]

		self.new_file = [
			'# Oracle 11g XE kernel parameters\n',  
			'fs.file-max=6815744\n',
			'net.ipv4.ip_local_port_range=9000 65000\n',  
			'kernel.sem=250 32000 100 128\n',
			'kernel.shmmax=536870912'
		]

		self.move_new_file = 'sudo move 60-oracle.conf /etc/sysctl.d/'

		self.data_new_file = [
			'#!/bin/sh',
			'case "$1" in',
			'start) mkdir /var/lock/subsys 2>/dev/null',
       		'	   touch /var/lock/subsys/listener',
       		'	   rm /dev/shm 2>/dev/null',
       		'	   mkdir /dev/shm 2>/dev/null',
       		'	   mount -t tmpfs shmfs -o size=2048m /dev/shm ;;',
			'*) echo error',
   			'exit 1 ;;',
			'esac' 
		]

		self.instrucctions = [
			'Introducimos la siguiente informacion:',
			'Un puerto HTTP valido para la aplicacion Oracle Application Express (por default es: 8080).',
			'UN puerto valido para el escuchador de la base de datos de Oracle (por default es: 1521).',
			'Una contraseña para el administrador de cuentas de usuario de SYS y SYSTEM.',
			'Confirmar las contraseñas.',
			'Seleccionar si deseamos que  el sistema gestor se inicie cuando inicie el sistema.'
		]

		self.bashrc = [
			'export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe',
			'export ORACLE_SID=XE',
			'export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`',
			'export ORACLE_BASE=/u01/app/oracle',
			'export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH',
			'export PATH=$ORACLE_HOME/bin:$PATH'
		]

		self.USER = getuser()

		for i in data.split(';'):
			if 'sudo pico /sbin/chkconfig' in i:
				'''
				os.system(self.move)
				os.system(self.create)
				os.system(self.move_file)
				'''
				for x in self.move_create_move_file:
					os.system(x)

			elif 'sudo pico /etc/sysctl.d/60-oracle.conf':
				file = open('60-oracle.conf','w')

				for y in self.new_file:
					file.write(y)

				file.close()

				os.system(self.move_new_file)

			elif 'sudo pico /etc/rc2.d/S01shm_load' in i:
				
				file = open('S01shm_load','w')

				for z in self.data_new_file:
					file.write(z)

				file.close()

			elif 'sudo /etc/init.d/oracle-xe configure' in i:

				for w in self.instrucctions:
					print(i)
					time.sleep(10)

				os.system('sudo /etc/init.d/oracle-xe configure')

			elif 'pico ~/.bashrc' in i:

				for m in self.bashrc:
					os.system(m)

			elif 'sudo usermod -a -G dba' in i:
				compled = i + " " + self.USER
				os.system(compled)

			else:
				os.system(i)


'''
'''
class InstallMega:
	def __init__(self,file_mega='requirements/Mega/InstallMega.txt'):
		self.file = file_mega


	def instalarMega(self):
		file = open(self.file_mega,'r')
		data = file.read()

		for i in data.split(';'):
			os.system(i)

	"	
}


# Banner
echo "	  ___   _   _   ____    _____      _      _          _      ____     ___    ____   "
echo "	 |_ _| | \ | | / ___|  |_   _|    / \    | |        / \    |  _ \   / _ \  |  _ \  "
echo "	  | |  |  \| | \___ \    | |     / _ \   | |       / _ \   | | | | | | | | | |_) | "
echo "	  | |  | |\  |  ___) |   | |    / ___ \  | |___   / ___ \  | |_| | | |_| | |  _ <  "
echo "	 |___| |_| \_| |____/    |_|   /_/   \_\ |_____| /_/   \_\ |____/   \___/  |_| \_\ "

while :
do
	echo "                                                                                 "
	echo "                                                                                 "
	echo "[0] Salir                                                                        "
	echo "[1] Instalar SQLServer                                                           "
	echo "[2] Instalar Oracle                                                              "
	echo "                                                                                 "
	echo -n "Elije una opcion[]: "
	read opcion

	if [ $opcion = 0 ]; then
		exit 0
	elif [ $opcion = 1 ]; then
		INSTALLSQLSERVER
		echo "¿Quieres Finalizar o volver a ejecutar?"
		echo "[0] Salir."
		echo "[1] Continuar."
		echo " "
		echo -n "Elije una opcion: "
		read second

		if [ $second = 0 ]; then
			exit 0
		fi

	elif [ $opcion = 2 ]; then
		INSTALLORACLE
	fi
done