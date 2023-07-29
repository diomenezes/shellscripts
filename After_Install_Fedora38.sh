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

clear
echo "##########################################"
echo ""
echo " Atualizacao do Sistema"
echo ""
echo "##########################################"
sleep 3
sudo dnf update -y && sudo dnf upgrade -y
sleep 3
clear 
sudo dnf install -y  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 2>> $LOG/Erro.log
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 2>> $LOG/Erro.log
sudo dnf update -y 2>> $LOG/Erro.log
sudo dnf upgrade -y 2>> $LOG/Erro.log
sleep 3
			
clear
echo "################################################"
echo ""
echo " Iniciando Instalacao dos programas da distro"
echo ""
echo "################################################"
sleep 5

clear
echo "##########################################"
echo ""
echo " Intalando o catfish"
echo ""
echo "##########################################"
sleep 3
sudo dnf install catfish -y  2>> $LOG/Erro.log
sleep 3


clear
echo "##########################################"
echo ""
echo " Intalando o gnome-tweaks"
echo ""
echo "##########################################"
sleep 3
sudo dnf install gnome-tweaks -y  2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o htop"
echo ""
echo "##########################################"
sleep 3
sudo dnf install htop -y  2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o testdisk"
echo ""
echo "##########################################"
sleep 3
sudo dnf install testdisk -y  2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Regulando a Swap --> swappiness = 10"
echo ""
echo "##########################################"
sleep 3
sudo echo  vm.swappiness = 10 >> /etc/sysctl.conf 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o cups-pdf"
echo ""
echo "##########################################"
sleep 3
sudo dnf install cups-pdf -y  2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o vlc"
echo ""
echo "##########################################"
sleep 3
flatpak install flathub org.videolan.VLC -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o Angry IP"
echo ""
echo "##########################################"
sleep 3
sudo dnf install https://github.com/angryip/ipscan/releases/download/3.9.1/ipscan-3.9.1-1.x86_64.rpm -y 2>> $LOG/Erro.log
sleep 3


clear
echo "##########################################"
echo ""
echo " Intalando o Binance"
echo ""
echo "##########################################"
sleep 3
sudo dnf install https://download.binance.com/electron-desktop/linux/production/binance-x86_64-linux.rpm -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o mullvad"
echo ""
echo "##########################################"
sleep 3
sudo dnf install https://mullvad.net/en/download/app/rpm/latest -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o Hidamari"
echo ""
echo "##########################################"
sleep 3
flatpak install flathub io.github.jeffshee.Hidamari -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o Skype"
echo ""
echo "##########################################"
sleep 3
flatpak install flathub com.skype.Client -y 2>> $LOG/Erro.log
sleep 3 

clear
echo "##########################################"
echo ""
echo " Intalando o telegram"
echo ""
echo "##########################################"
sleep 3 
flatpak install flathub org.telegram.desktop -y 2>> $LOG/Erro.log
sleep 3 

clear
echo "##########################################"
echo ""
echo " Intalando o WhatsAppDesktop"
echo ""
echo "##########################################"
sleep 3 
flatpak install flathub io.github.mimbrero.WhatsAppDesktop -y 2>> $LOG/Erro.log
sleep 3 

clear
echo "##########################################"
echo ""
echo " Intalando o tokodon"
echo ""
echo "##########################################"
sleep 3 
flatpak install flathub org.kde.tokodon -y 2>> $LOG/Erro.log

clear
echo "##########################################"
echo ""
echo " Intalando o neofetch"
echo ""
echo "##########################################"
sleep 3
sudo dnf install neofetch -y  2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o gcc"
echo ""
echo "##########################################"
sleep 3
sudo dnf install gcc -y  2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o yubico"
echo ""
echo "##########################################"
sleep 3
flatpak install flathub com.yubico.yubioath -y  2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o rar"
echo ""
echo "##########################################"
sleep 3
sudo dnf install cabextract lzip p7zip p7zip-plugins unrar -y  2>> $LOG/Erro.log
sudo dnf install pigz pbzip2 pxz -y  2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o qbittorrent"
echo ""
echo "##########################################"
sleep 3
flatpak install flathub org.qbittorrent.qBittorrent -y  2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o Zenmap"
echo ""
echo "##########################################"
sleep 3
flatpak install flathub org.nmap.Zenmap -y  2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o trimmer"
echo ""
echo "##########################################"
sleep 3f
latpak install flathub org.gnome.gitlab.YaLTeR.VideoTrimmer -y  2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o nvme-cli"
echo ""
echo "##########################################"
sleep 3
sudo dnf install nvme-cli -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o stacer"
echo ""
echo "##########################################"
sleep 3
sudo dnf install stacer -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o smartmontools"
echo ""
echo "##########################################"
sleep 3
sudo dnf install smartmontools -y 2>> $LOG/Erro.log
sleep 3

echo "#####################################################"
echo ""
echo " ATENCAO A LINHA ABAIXO SERA ADD no /etc/hosts.denny "
echo " 	 ALL:ALL  	"
echo ""
echo "######################################################"
sleep 5
sudo echo " ALL:ALL" >> /etc/hosts.deny 2>> $LOG/Erro.log
						
clear
echo "##########################################"
echo ""
echo " Intalando o nmap"
echo ""
echo "##########################################"
sleep 3
sudo dnf install nmap -y 2>> $LOG/Erro.log
sleep 3
			
clear
echo "##########################################"
echo ""
echo " Intalando o calibre"
echo ""
echo "##########################################"
sleep 3
flatpak install flathub com.calibre_ebook.calibre -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Intalando o Sticky Notes"
echo ""
echo "##########################################"
sleep 3
flatpak install flathub com.vixalien.sticky -y 2>> $LOG/Erro.log
sleep 3
			
clear
echo "##########################################"
echo ""
echo " Instalacao do Discord"
echo ""
echo "##########################################"
sleep 3
flatpak install flathub com.discordapp.Discord -y 2>> $LOG/Erro.log
sleep 3
			
clear
echo "##########################################"
echo ""
echo " Instalacao do VirtualBox"
echo ""
echo "##########################################"
sleep 3
sudo dnf install VirtualBox -y 2>> $LOG/Erro.log
sleep 3
			
clear
echo "##########################################"
echo ""
echo " Instalacao do dnfdragora"
echo ""
echo "##########################################"
sleep 3			
sudo dnf install dnfdragora-gui -y 2>> $LOG/Erro.log
sleep 3
			
clear
echo "##########################################"
echo ""
echo " Instalacao do insync"
echo ""
echo "##########################################"
sleep 3	
sudo dnf install https://cdn.insynchq.com/builds/linux/insync-3.8.6.50504-fc38.x86_64.rpm -y 2>> $LOG/Erro.log
sleep 3
			
clear
echo "##########################################"
echo ""
echo " Instalacao do Google-Chrome"
echo ""
echo "##########################################"
sleep 3	
sudo dnf install google-chrome-stable -y 2>> $LOG/Erro.log
sleep 3
			
clear
echo "##########################################"
echo ""
echo " Instalacao do Steam"
echo ""
echo "##########################################"
sleep 3	
flatpak install flathub com.valvesoftware.Steam -y 2>> $LOG/Erro.log			
sleep 3
			
clear
echo "##########################################"
echo ""
echo " Instalacao fedora-workstation-repositories"
echo ""
echo "##########################################"
sleep 3
sudo dnf install fedora-workstation-repositories -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Instalacao  nvidia-driver"
echo ""
echo "##########################################"
sleep 3
sudo dnf config-manager rpmfusion-nonfree-nvidia-driver --set-enabled 2>> $LOG/Erro.log
sleep 3

clear
sudo dnf install akmod-nvidia acpi xorg-x11-drv-nvidia-cuda vulkan -y 2>> $LOG/Erro.log 
sleep 3

clear
sudo dnf install mesa-dri-drivers.i686 mesa-libGL.i686 xorg-x11-drv-intel -y 2>> $LOG/Erro.log
sleep 3

clear
sudo dnf install xorg-x11-drv-nvidia-libs.i686 -y 2>> $LOG/Erro.log			
sleep 3

clear
echo "##########################################"
echo ""
echo " Instalacao r-studio"
echo ""
echo "##########################################"
sleep 3
sudo dnf install https://www.r-studio.com/downloads/RLinux5_x64.rpm -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Instalacao TeamView"
echo ""
echo "##########################################"
sleep 3
sudo dnf install https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Instalacao OnlyOffice"
echo ""
echo "##########################################"
sleep 3
flatpak install flathub org.onlyoffice.desktopeditors -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Instalacao ZOOM"
echo ""
echo "##########################################"
sleep 3
flatpak install flathub us.zoom.Zoom -y 2>> $LOG/Erro.log
sleep 3
			
clear
echo "##########################################"
echo ""
echo " Instalacao TEAMS"
echo ""
echo "##########################################"
sleep 3
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo ""
echo " Instalacao Lutris"
echo ""
echo "##########################################"
sleep 3
flatpak install flathub net.lutris.Lutris -y 2>> $LOG/Erro.log
sleep 3


clear
echo "##########################################"
echo ""
echo " Instalacao Evolution"
echo " "
echo "##########################################"
sleep 3
flatpak install flathub org.gnome.Evolution -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo " Instalacao de Remmia: " 
echo "##########################################"
echo " "
sleep 3
flatpak install flathub org.remmina.Remmina -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo " Instalacao de Flameshot: " 
echo "##########################################"
echo ""
sleep 3
flatpak install flathub org.flameshot.Flameshot -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo " Instalacao de Wireshark: " 
echo "##########################################"
echo ""
sleep 3
flatpak install flathub org.wireshark.Wireshark -y 2>> $LOG/Erro.log
sleep 3

clear
echo "##########################################"
echo " Instalacao de gnome-extensions-app " 
echo "##########################################"
echo ""
sleep 3
sudo dnf install gnome-extensions-app -y 2>> $LOG/Erro.log -y
sleep 3

clear
echo "##########################################"
echo " Instalacao de extension-dash-to-doc " 
echo "##########################################"
echo ""
sleep 3
sudo dnf install gnome-shell-extension-dash-to-dock -y 2>> $LOG/Erro.log -y
sleep 3

clear
echo "##########################################"
echo " Instalacao de extension-appindicator " 
echo "##########################################"
echo ""
sleep 3
sudo dnf install gnome-shell-extension-appindicator -y 2>> $LOG/Erro.log -y
sleep 3

clear
echo "##########################################"
echo " Instalacao do system-monitoring-center " 
echo "##########################################"
echo ""
flatpak install flathub io.github.hakandundar34coding.system-monitoring-center -y 2>> $LOG/Erro.log

clear
echo "##########################################"
echo " Instalacao de Zmap " 
echo "##########################################"
echo ""
sleep 3
sudo dnf install zmap -y  2>> $LOG/Erro.log
sleep 3

clear
echo " Instalacao MANUAL das Extensions:" 
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
echo "Aperte ENTER para continuar " 
read CONTINUAR

clear
echo "Fim da da Instalacao"
sleep 15
sudo chown $USUARIO.$USUARIO $LOG/Erro.log
sudo chmod 755 $LOG/Erro.log
sudo cat $LOG/Erro.log | less

echo ""
echo "##########################################"
echo "####             OBRIGADO             ####"
echo "##########################################"
echo ""
