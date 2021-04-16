#!/bin/bash
clear

# Tela de bem Vindas ao Sistema 
DAY=$(date)
HOST=$(uname -n)

echo "##########################################"
echo "##########################################"
echo ""
echo "${DAY}"
echo""
echo "Ola ${LOGNAME}, Bem Vindo ao ${HOST} " 
echo "Seu Sistema Operacional eh: $(lsb_release -is)"
echo "A versao do Kernel: $(uname -r)"
echo ""
echo "##########################################"
echo "##########################################"
echo ""
echo "Criando Arquivo de Logs de ERRO na Instalacao!" > $HOME/Erro.log


# Verificar se o Usuario eh Root

if [[ "${UID}" -eq 0 ]]
	then

		echo "Voce deseja executar o UPDATE e INSTALACAO de pacotes?"
		echo -n "Digite (y) para SIM, ou (n) para NAO.: " 
		read RESPOSTA

		if [[ ${RESPOSTA} = "y" ]]

		then
			touch $HOME/Erro.log
			clear
			echo "##########################################"
			echo ""
			echo " Atualizacao do Sistema"
			echo ""
			echo "##########################################"
			sleep 3
			apt update -y  && apt upgrade -y  2>> $HOME/Erro.log  			
			
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
			apt-get install bleachbit -y  2>> $HOME/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o catfish"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install catfish -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando o gnome-tweaks"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install gnome-tweaks -y  2>> $HOME/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o gparted"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install gparted -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando do Putty"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install putty -y  2>> $HOME/Erro.log
			apt-get install putty-tools -y  2>> $HOME/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o brasero ISO to DVD"
			echo ""
			echo "##########################################"
			sleep 3
			apt install brasero -y  2>> $HOME/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o htop"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install htop -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando o Sticky Notes"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install knotes -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando o testdisk"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install testdisk -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando o libvulkan1 libvulkan1:i386"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install libvulkan1 libvulkan1:i386 -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando o chrome-gnome-shell"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install chrome-gnome-shell -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando Pacotes de Teste de WIFI"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install kismet -y 2>> $HOME/Erro.log
			apt-get install wifite -y 2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Regulando a Swap "
			echo ""
			echo "##########################################"
			sleep 3
			echo  vm.swappiness = 12 >> /etc/sysctl.conf 2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Pacote de Conversao de IMG to ISO"
			echo ""
			echo "##########################################"
			sleep 3
			apt install iat -y 2>> $HOME/Erro.log
			
			clear			
			echo " You can convert the image using the command"
			echo " iat file.img file.iso"
			sleep 5
			echo ""
			echo "##########################################"
			
			clear				
			echo "##########################################"
			echo ""
			echo " Intalando o synaptic"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install synaptic -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando o cups-pdf"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install cups-pdf -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando o vlc"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install vlc -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando o neofetch"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install neofetch -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando o gcc"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install gcc -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando o rar"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install rar -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando o qbittorrent"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install qbittorrent -y  2>> $HOME/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o dconf-editor"
			echo ""
			echo "##########################################"
			sleep 3
			apt install dconf-editor -y 2>> $HOME/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o nvme-cli"
			echo ""
			echo "##########################################"
			sleep 3
			apt install nvme-cli -y 2>> $HOME/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o stacer"
			echo ""
			echo "##########################################"
			sleep 3
			apt install stacer -y 2>> $HOME/Erro.log

			clear
			echo "##########################################"
			echo ""
			echo " Intalando o hardinfo"
			echo ""
			echo "##########################################"
			sleep 3
			apt install hardinfo -y 2>> $HOME/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o screen"
			echo ""
			echo "##########################################"
			sleep 3
			apt install screen -y 2>> $HOME/Erro.log
			apt install tmux -y 2>> $HOME/Erro.log 
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o gufw"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install gufw -y  2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Intalando o nautilus-dropbox"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install nautilus-dropbox -y  2>> $HOME/Erro.log

			clear					
			echo "##########################################"
			echo ""
			echo " Intalando leitor de cartao de Memoria exFAT"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install exfat-fuse exfat-utils -y  2>> $HOME/Erro.log
			
			clear
											
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
			# sudo savscan -bs=/dev/a1
	
			# Scan Master Boot Records :			
			# sudo savscan -mbr
				
			# Turn Live Protection On:
			# sudo /opt/sophos-av/bin/savconfig set LiveProtection true
				
			# Install Updates:
			# sudo /opt/sophos-av/bin/savupdate
				
			echo "#####################################################"
			echo ""
			echo " ATENCAO A LINHA ABAIXO SERA ADD no /etc/hosts.denny "
			echo " 	 ALL:ALL  	"
			echo ""
			echo "######################################################"
			sleep 3			
			echo "ALL:ALL" >> /etc/hosts.deny 2> $HOME/Erro_Install.txt
			
			clear			
			echo "##########################################"
			echo ""
			echo " Instalacao dos Snaps da distro"
			echo ""
			echo "##########################################"
			sleep 3
			
			clear			
			echo "##########################################"
			echo ""
			echo " Instalacao do Snap Skype"
			echo ""
			echo "##########################################"
			sleep 3
			snap install skype    2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Instalacao do Snap spotify"
			echo ""
			echo "##########################################"
			sleep 3
			snap install spotify 2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Instalacao do Snap Discord"
			echo ""
			echo "##########################################"
			sleep 3
			snap install discord 2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Instalacao do Snap do Sublime-Text"
			echo ""
			echo "##########################################"
			sleep 3
			snap install sublime-text 2>> $HOME/Erro.log
			
			clear			
			echo "##########################################"
			echo ""
			echo " Instalacao do Snap do notepad-plus-plus"
			echo ""
			echo "##########################################"
			sleep 3
			snap install notepad-plus-plus 2>> $HOME/Erro.log	
			
			clear			
			echo "##########################################"
			echo ""
			echo " Instalacao do Snap do Pycharm-Community"
			echo ""
			echo "##########################################"
			sleep 3
			snap install pycharm-community 2>> $HOME/Erro.log 
			
			clear
			echo "##########################################"
			echo ""
			echo " Instalacao do Gnome Shell Extensions"
			echo ""
			echo "##########################################"
			sleep 3
			apt install gnome-shell-extensions -y 2>> $HOME/Erro.log
						
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o libsmbios-bin"
			echo ""
			echo "##########################################"
			sleep 3								
			apt-get install libsmbios-bin -y 2>> $HOME/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o smartmontools"
			echo ""
			echo "##########################################"
			sleep 3			
			apt-get install smartmontools -y
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o photocollage"
			echo ""
			echo "##########################################"
			sleep 3	
			apt-get install photocollage 2>> $HOME/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o wireshark"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install wireshark -y  2>> $HOME/Erro.log
			
			clear
			echo "##########################################"
			echo ""
			echo " Intalando o ttf-mscorefonts-installer"
			echo ""
			echo "##########################################"
			sleep 3
			apt-get install ttf-mscorefonts-installer -y  2>> $HOME/Erro.log
			
			
			apt install powerstat -y
			apt install laptop-mode-tools -y
			lmt-config-gui
			apt install smartmontools -y
			apt install arpwatch -y
			apt  install nmap -y
			apt install indicator-multiload -y
			apt install wget gdebi-core libgl1-mesa-glx:i386 -y
			apt install nvtop -y
			apt-get install gnome-sushi -y
			sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
			
			clear			
			echo "##########################################"
			echo "Instalacao Manual (DPKG) de 7 Pacotes:" 
			echo "##########################################"
			echo ""
			echo "Chrome"
			echo "GranCursosOnline"
			echo "insync"
			echo "pdfsam"
			echo "RLinux5"
			echo "stacer"
			echo "steam"
			echo "teams"
			echo "Teamview"
			echo "VMware"
			echo "warsaw"
			echo "WPS Office"
			echo "zoom"
			echo "FoxIt"
			echo "Shopos"
			echo "Beignet"
			echo ""
			echo "Ja Instalou os programas acima?"
			echo -n "Digite (y) para SIM, ou (n) para NAO.: " 
			read RESPOSTA2

			if [[ ${RESPOSTA2} = "y" ]]

			then
				clear
				echo "##########################################"
				echo " Instalacao Manual da Extensions: " 
				echo "##########################################"
				echo ""
				echo " Instalacao de Extensions:" 
				echo ""
				echo " Blyr by yozoon"
				echo " Audio Output Switcher"
				echo " Coverflow Alt-Tab"
				echo " CPU Power Manager"
				echo " Gnome Email Notifications" 
				echo " Multi Monitors Add-On"
				echo " OpenWeather"
				echo " Removable Drive Menu"
				echo " Skype Integration"
				echo " Transparent GNOME panel"
				echo " Transparent Top Bar"
				echo " Transparent Window Moving"
				echo " User Themes by fmuellner"
				echo " Disable force-quit or wait button"
			else

			clear
			echo""			
			echo " OK, O Script Sera Fechado!! "
			echo ""

			fi
			
			clear			
			echo "###########################"			
			echo " Atualizacao do Sistema"
			echo ""
			echo "###########################"
			sleep 3
			apt update -y  && apt upgrade -y  2>> $HOME/Erro.log  			
			
			clear
			clear
			echo "###########################"
			echo " Instalacao do Wine 32Bits "
			echo "###########################"
			sleep 3
			dpkg --add-architecture i386 2>> $HOME/Erro.log
						
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
			echo "##########################################"
			echo ""
			echo " Instslacao de PPAs no `lsb_release -i -s` "
			echo ""
			echo "##########################################"
			sleep 3
			
			clear			
			echo "##########################################"
			echo ""
			echo " Instslacao PPA Lutris"
			echo ""
			echo "##########################################"
			sleep 3
			add-apt-repository ppa:lutris-team/lutris -y  2>> $HOME/Erro.log
			apt-get update -y  2>> $HOME/Erro.log
			apt-get install lutris -y  2>> $HOME/Erro.log

			clear			
			echo "############################"
			echo "Instalacao do PPA TimeShift"
			echo "############################"
			sleep 3
			add-apt-repository ppa:teejee2008/ppa -y  2>> $HOME/Erro.log
			apt-get update -y  2>> $HOME/Erro.log
			apt-get install timeshift -y  2>> $HOME/Erro.log
			
			clear			
			echo "#########################"
			echo "Instalacao PPA da Nvidia"
			echo "#########################"
			sleep 3
			snap install geforcenow
			#add-apt-repository ppa:graphics-drivers -y  2>> $HOME/Erro.log
			#apt-get update -y  2>> $HOME/Erro.log
			
			clear
			# Terminada 1 Fase da Instalacao
			
			echo "Fim da 1 Fase da Instalacao"
			
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
echo " VER arquivo  $HOME/Erro.log "

# cat $HOME/Erro.log | less

