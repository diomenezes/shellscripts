#!/bin/bash
clear

DAY=$(date)
HOST=$(uname -n)
LOG=$(pwd)
USUARIO=$(logname)

echo "##########################################"
echo "##########################################"
echo ""
echo "${DAY}"
echo ""
echo "Ola ${LOGNAME}, Bem Vindo ao ${HOST} "
echo "A versao do Kernel: $(uname -r)"
echo ""
echo "##########################################"
echo "##########################################"
echo ""


	echo "Deseja REMOVER os Drivres da Nvidia-RPM-FUSION ?"
	read RESPOSTA1
	if [[ ${RESPOSTA1} = "y" ]]
	then
		sudo systemctl isolate multi-user.target
		sudo systemctl set-default multi-user.target
		sudo dnf remove nvidia* 
		rm /var/lib/dkms/nvidia
		sudo init 6
	else
		echo "Proximo..."
	fi


	echo "Deseja INSTALAR os Drivres da Nvidia-PROPRIETARIOS ?"
	read RESPOSTA2
	if [[ ${RESPOSTA2} = "y" ]]
	then
		cd ~/Downloads/
		sudo ./NVIDIA-Linux-x86_64-510.47.03.run 
		sudo init 6
	else
		echo "Proximo..."
	fi


	echo "Deseja REMOVER os Drivres da Nvidia-PROPRIETARIOS ?"
	read RESPOSTA3
	if [[ ${RESPOSTA3} = "y" ]]
	then
		cd ~/Downloads/
		sudo ./NVIDIA-Linux-x86_64-510.47.03.run  --uninstall
	else
		echo "Proximo..."
	fi


	echo "Deseja INSTALAR os Drivres da Nvidia-RPM-FUSION ?"
	read RESPOSTA4
	if [[ ${RESPOSTA4} = "y" ]]
	then
		sudo dnf update -y && sudo dnf install -y akmod-nvidia
		sudo dnf install -y xorg-x11-drv-nvidia-power
		sudo systemctl enable nvidia-{suspend,resume,hibernate}
		sudo systemctl set-default graphical.target && init 6
	else
		echo "Proximo..."
	fi

