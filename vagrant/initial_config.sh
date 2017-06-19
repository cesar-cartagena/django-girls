#!/bin/bash
#Se actualiza todos los paquetes del sistema.
sudo locale-gen UTF-8
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get -y install zlib1g-dev
sudo apt-get -y install libssl-dev
sudo apt-get -y install libsqlite3-dev
sudo apt-get -y install unzip

#Actualización de dependencias para poder instalar el iPython
sudo apt-get -y install build-essential python-dev

#Se crea una carpeta para descargar los archivos de instalación.
mkdir instaladores

cd instaladores
#Instalo Python 2.7.12
sudo curl -O https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tar.xz
sudo unxz Python-3.6.1.tar.xz
sudo tar xf Python-3.6.1.tar

cd Python-3.6.1
sudo ./configure
sudo make
sudo make install

#Vuelvo a instaladores
cd ..

#Se descarga el PIP y se se actualiza sus dependencias principales.
curl -O https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
cd ..


sudo pip3 install -U pip
sudo pip3 install -U setuptools

#Instalación de Django
sudo pip3 install Django==1.11.2
#sudo apt-get install python-django

sudo unlink /etc/localtime
sudo ln -s /usr/share/zoneinfo/America/Bogota /etc/localtime
