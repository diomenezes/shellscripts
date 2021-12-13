#!/bin/bash
clear

# Tela de bem Vindas ao Sistema
# Criando Variaveis de Ambiente

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

# Verificar se o Usuario eh Root

if [[ "${UID}" -eq 0 ]]
	then
		echo ""
		echo ""
		echo " ATENCAO !!!!  ANTES DE CONFIRMAR TENHA CERTEZA QUE:"
		echo " 1 - Rodou o dnf update e dnf upgrade"
		echo " 2 - Reiniciou seu pc"
		echo " 3 - Ativou os Repositorios na loja"
		echo ""
		echo ""
		echo "Voce deseja executar o as INSTALACOES de pacotes?"
		echo -n "Digite (y) para SIM, ou (n) para NAO.: "
		read RESPOSTA

		if [[ ${RESPOSTA} = "y" ]]

		then
			clear
			echo "##########################################"
			echo ""
			echo " Atualizacao do Sistema"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install -y  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 2>> $LOG/Erro.log
			dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 2>> $LOG/Erro.log
			dnf update -y 2>> $LOG/Erro.log
			dnf upgrade -y 2>> $LOG/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Instalacao dos programas da distro"
			echo ""
			echo "##########################################"
			sleep 3

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o bleachbit"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install bleachbit -y  2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o catfish"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install catfish -y  2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o gnome-tweaks"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install gnome-tweaks -y  2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o gparted"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install gparted -y  2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o brasero ISO to DVD"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install brasero -y  2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o htop"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install htop -y  2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o testdisk"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install testdisk -y  2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o chrome-gnome-shell"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install chrome-gnome-shell -y  2>> $LOG/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Regulando a Swap --> swappiness = 10"
			echo ""
			echo "##########################################"
			sleep 3
			echo  vm.swappiness = 10 >> /etc/sysctl.conf 2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o cups-pdf"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install cups-pdf -y  2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o vlc"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install vlc -y  2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o neofetch"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install neofetch -y  2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o gcc"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install gcc -y  2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o rar"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install cabextract lzip p7zip p7zip-plugins unrar -y  2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o qbittorrent"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install qbittorrent -y  2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o dconf-editor"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install dconf-editor -y 2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o nvme-cli"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install nvme-cli -y 2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o stacer"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install stacer -y 2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o screen e Tmux"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install screen -y 2>> $LOG/Erro.log
			dnf install tmux -y 2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o nautilus-dropbox"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install nautilus-dropbox -y  2>> $LOG/Erro.log

			
			# clear
			# SOPHOS ANTI VIRUS
			# sudo /opt/sophos-av/bin/savdstatus
			# https://secure2.sophos.com/en-us/pages/downloadredirect.aspx?downloadKey=8f2ca4a9-f6b1-44be-816c-d7d08461b795&

			# uninstall
			# sudo /opt/sophos-av/uninstall.sh

			# Enable on-access scanning:
			# sudo /opt/sophos-av/bin/savdctl enable
			# Disable on-access scanning:
			# sudo /opt/sophos-av/bin/savdctl disable
			# Scan Volume Boot Records:
			# sudo savscan -bs=/dev/a1l
			# Scan Master Boot Records :
			# sudo savscan -mbr

			# Turn Live Protection On:
			# sudo /opt/sophos-av/bin/savconfig set LiveProtection true

			# Install Updates:
			# sudo /opt/sophos-av/bin/savupdate
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o smartmontools"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install smartmontools -y 2>> $LOG/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o photocollage"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install photocollage -y 2>> $LOG/Erro.log

			echo "#####################################################"
			echo ""
			echo " ATENCAO A LINHA ABAIXO SERA ADD no /etc/hosts.denny "
			echo " 	 ALL:ALL  	"
			echo ""
			echo "######################################################"
			sleep 3
			echo " ALL:ALL" >> /etc/hosts.deny 2>> $LOG/Erro.log
						
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o nmap"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install nmap -y 2>> $LOG/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o calibre"
			echo ""
			echo "##########################################"
			sleep 3
			sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o Sticky Notes"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install knotes -y 2>> $LOG/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Instalacao do Discord"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install discord -y 2>> $LOG/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Instalacao do VirtualBox"
			echo ""
			echo "##########################################"
			sleep 3
			dnf install VirtualBox -y 2>> $LOG/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Instalacao do dnfdragora"
			echo ""
			echo "##########################################"
			sleep 3			
			dnf install dnfdragora-gui -y 2>> $LOG/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Instalacao do insync"
			echo ""
			echo "##########################################"
			sleep 3	
			dnf install  https://d2t3ff60b2tol4.cloudfront.net/builds/insync-3.6.1.50206-fc35.x86_64.rpm -y 2>> $LOG/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Instalacao do Google-Chrome"
			echo ""
			echo "##########################################"
			sleep 3	
			dnf install google-chrome-stable -y 2>> $LOG/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Instalacao do Steam"
			echo ""
			echo "##########################################"
			sleep 3	
			dnf install steam -y 2>> $LOG/Erro.log			
			
			
			clear
			dnf install mesa-dri-drivers.i686 mesa-libGL.i686 xorg-x11-drv-intel -y 2>> $LOG/Erro.log
			clear
			dnf install xorg-x11-drv-nvidia-libs.i686 -y 2>> $LOG/Erro.log			
			sleep 8
			clear
			
			dnf install https://www.r-studio.com/downloads/RLinux5_x64.rpm -y 2>> $LOG/Erro.log
			clear
			dnf install https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -y 2>> $LOG/Erro.log
			clear
			dnf install https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10702/wps-office-11.1.0.10702.XA-1.x86_64.rpm -y 2>> $LOG/Erro.log
			clear
			dnf install https://zoom.us/client/latest/zoom_x86_64.rpm -y 2>> $LOG/Erro.log
			
     			clear
			echo " Instalar os seguintes Softwares: "
      			echo " teams"			
			echo " FoxIT "
			echo ""
			echo "Ja Instalou os programas acima?"
			echo -n "Digite (y) para SIM, ou (n) para NAO.: "
			read RESPOSTA2

			if [[ ${RESPOSTA2} = "y" ]]

			then
				clear
				echo "##########################################"
				echo " Instalacao de Extensions: " 
				echo "##########################################"
				echo ""
				echo " Instalacao de Extensions:" 
				echo ""

				clear
				dnf install gnome-shell-extension-dash-to-dock -y 2>> $LOG/Erro.log
				clear
				dnf install gnome-extensions-app -y 2>> $LOG/Erro.log
				clear
				dnf install gnome-shell-extension-appindicator -y 2>> $LOG/Erro.log

				clear
				echo " Instalacao MANULA das Extensions:" 
				echo ""
				echo " Blyr by yozoon"
				echo " Audio Output Switcher"
				echo " Coverflow Alt-Tab"
				echo " Multi Monitors Add-On"
				echo " Removable Drive Menu"
				echo " Transparent GNOME panel"
				echo " Transparent Top Bar"
				echo " Transparent Window Moving"
				echo " User Themes by fmuellner"
				echo " Applications Overview Tooltip by RaphaelR"

			else

			clear
			echo""
			echo " OK, O Script Sera Fechado!! "
			echo ""

			fi


			# Instalacao do Wine Staging branch
			# DEVE SER CONFIGURADO DE ACORDO COM A VERSAO DO LINUX

			#wget -nc https://dl.winehq.org/wine-builds/winehq.key -y
			#apt-key add winehq.key -y
			#apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ eoan main' -y
			#apt update -y
			#apt install --install-recommends winehq-staging -y


			#clear
			#echo "##########################################"
			#echo "		HABILITANDO HIBERNAÇÃO		"
			#echo ""
			#echo "##########################################"
			#apt install pm-utils hibernate
			#echo ""
			#echo ""
			#echo "freeze mem disk = $(cat /sys/power/state) .: OK!"
			#sleep 5
			#USWAP=$(sudo grep swap /etc/fstab | cut -f1 -d " " | grep -v "#")
			#echo $USWAP >> /etc/default/grub
			#clear
			#echo "##########################################"
			#echo "		SUBSTITUIR O VALOR DA LINHA 01 "
			#echo "		PELO VALOR DA LINHA 02"
			#echo ""
			#echo " Linha 01 - GRUB_CMDLINE_LINUX_DEFAULT="quiet splash" "
			#echo " Linha 02 - GRUB_CMDLINE_LINUX_DEFAULT="VALOR DA $USWAP""
			#echo ""
			#echo " Ver o Valor no da Variavel no Fim do Arquivo! "
			#echo ""
			#echo "##########################################"
			#sleep 6
			#vi /etc/default/grub

			#update-grub


			clear
			# Terminada 1 Fase da Instalacao

			echo "Fim da 1 Fase da Instalacao"
			sleep 15
			chown $USUARIO.$USUARIO $LOG/Erro.log
			chmod 755 $LOG/Erro.log
			cat $LOG/Erro.log | less

		else
			clear
			echo""
			echo "OK, O Script Sera Fechado!!"
			echo ""


		fi

	else
		echo "O Script nao foi executado como root"
		echo "${USER}, EXECUTE o script como o comando SUDO "
fi

echo ""
echo "##########################################"
echo "####             OBRIGADO             ####"
echo "##########################################"
echo ""



