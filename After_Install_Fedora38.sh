#!/bin/bash

clear

# Tela de bem Vindas ao Sistema
# Criando Variaveis de Ambiente


echo $DAY >> /tmp/ErroAfterInstall.log

echo "##########################################"
echo "##########################################"
echo ""
echo "$(date)"
echo ""
echo "Ola $(logname), Bem Vindo ao $(uname -n) "
echo "A versao do Kernel: $(uname -r)"
echo ""
echo "##########################################"
echo "##########################################"
echo ""
sleep 8


clear
echo "##########################################"
echo " Atualizacao do Sistema"
echo "##########################################"
sleep 3
echo " "
sudo dnf update -y && sudo dnf upgrade -y
sleep 5



clear
echo "################################################"
echo " Iniciando Instalacao dos programas via FlatHub"
echo "################################################"
sleep 5

clear
echo "##########################################"
echo " Intalando o vlc"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub org.videolan.VLC -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Intalando o Hidamari"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub io.github.jeffshee.Hidamari -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Intalando o Skype"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub com.skype.Client -y 2>> /tmp/ErroAfterInstall.log
sleep 3 

clear
echo "##########################################"
echo " Intalando o telegram"
echo "##########################################"
sleep 3 
echo " "
flatpak install flathub org.telegram.desktop -y 2>> /tmp/ErroAfterInstall.log
sleep 3 

clear
echo "##########################################"
echo " Intalando o WhatsAppDesktop"
echo "##########################################"
sleep 3 
echo " "
flatpak install flathub io.github.mimbrero.WhatsAppDesktop -y 2>> /tmp/ErroAfterInstall.log
sleep 3 

clear
echo "##########################################"
echo " Intalando o tokodon"
echo "##########################################"
sleep 3 
echo " "
flatpak install flathub org.kde.tokodon -y 2>> /tmp/ErroAfterInstall.log
sleep 3 

clear
echo "##########################################"
echo " Intalando o yubico"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub com.yubico.yubioath -y  2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Intalando o qbittorrent"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub org.qbittorrent.qBittorrent -y  2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Intalando o Zenmap"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub org.nmap.Zenmap -y  2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Intalando o trimmer"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub org.gnome.gitlab.YaLTeR.VideoTrimmer -y  2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Intalando o calibre"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub com.calibre_ebook.calibre -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Intalando o Sticky Notes"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub com.vixalien.sticky -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Instalacao do Discord"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub com.discordapp.Discord -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Instalacao OnlyOffice"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub org.onlyoffice.desktopeditors -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Instalacao ZOOM"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub us.zoom.Zoom -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Instalacao TEAMS"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Instalacao do Steam"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub com.valvesoftware.Steam -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Instalacao Lutris"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub net.lutris.Lutris -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Instalacao Evolution"
echo "##########################################"
sleep 3
echo " "
flatpak install flathub org.gnome.Evolution -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Instalacao de Remmia: " 
echo "##########################################"
sleep 3
echo " "
flatpak install flathub org.remmina.Remmina -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Instalacao de Flameshot: " 
echo "##########################################"
sleep 3
echo " "
flatpak install flathub org.flameshot.Flameshot -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Instalacao de Wireshark: " 
echo "##########################################"
sleep 3
echo " "
flatpak install flathub org.wireshark.Wireshark -y 2>> /tmp/ErroAfterInstall.log
sleep 3

clear
echo "##########################################"
echo " Instalacao do system-monitoring-center " 
echo "##########################################"
echo ""
flatpak install flathub io.github.hakandundar34coding.system-monitoring-center -y 2>> /tmp/ErroAfterInstall.log
sleep 3


 clear
 echo "##########################################"
 echo " Atualizacao do Sistema"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf update -y && sudo dnf upgrade -y
 sleep 5

 clear
 echo "######################################################"
 echo " Instalacao fedora-repositories - rpmfusion-free"
 echo "######################################################"
 sleep 3
 echo " "
 dnf install -y  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 2>> /tmp/ErroAfterInstall.log

 clear
 echo "######################################################"
 echo " Instalacao fedora-repositories - rpmfusion-nonfree"
 echo "######################################################"
 sleep 3
 echo " "
 dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Instalacao fedora-workstation-repositories"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install fedora-workstation-repositories -y 2>> /tmp/ErroAfterInstall.log
 sleep 3


 clear
 echo "##########################################"
 echo " Atualizacao do Sistema"
 echo "##########################################"
 sleep 3
 sudo dnf update -y && sudo dnf upgrade -y
 sleep 5


 clear
 echo "################################################"
 echo " Iniciando Instalacao dos programas via DNF"
 echo "################################################"
 sleep 5

 clear
 echo "##########################################"
 echo " Intalando o catfish"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install catfish -y  2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o gnome-tweaks"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install gnome-tweaks -y  2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o htop"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install htop -y  2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o testdisk"
  echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install testdisk -y  2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o cups-pdf"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install cups-pdf -y  2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o neofetch"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install neofetch -y  2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o gcc"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install gcc -y  2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o rar"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install cabextract lzip p7zip p7zip-plugins unrar -y  2>> /tmp/ErroAfterInstall.log
 sudo dnf install pigz pbzip2 pxz -y  2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o nvme-cli"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install nvme-cli -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o stacer"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install stacer -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o smartmontools"
 echo "##########################################"
 sleep 3
 echo " " 
 sudo dnf install smartmontools -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o nmap"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install nmap -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Instalacao do dnfdragora"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install dnfdragora-gui -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Instalacao do Google-Chrome"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install google-chrome-stable -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Instalacao  nvidia-driver  1...4 "
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf config-manager rpmfusion-nonfree-nvidia-driver --set-enabled 2>> /tmp/ErroAfterInstall.log
 echo " "
 sudo dnf update -y && sudo dnf upgrade -y
 sleep 3

 clear
 echo "##########################################"
 echo " Instalacao  nvidia-driver  2...4 "
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install akmod-nvidia acpi xorg-x11-drv-nvidia-cuda vulkan -y 2>> /tmp/ErroAfterInstall.log 
 sleep 3

 clear
 echo "##########################################"
 echo " Instalacao  nvidia-driver  3...4 "
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install mesa-dri-drivers.i686 mesa-libGL.i686 xorg-x11-drv-intel -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Instalacao  nvidia-driver  4...4 "
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install xorg-x11-drv-nvidia-libs.i686 -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Instalacao de gnome-extensions-app " 
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install gnome-extensions-app -y 2>> /tmp/ErroAfterInstall.log -y
 sleep 3

 clear
 echo "##########################################"
 echo " Instalacao de extension-dash-to-doc " 
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install gnome-shell-extension-dash-to-dock -y 2>> /tmp/ErroAfterInstall.log -y
 sleep 3

 clear
 echo "##########################################"
 echo " Instalacao de extension-appindicator " 
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install gnome-shell-extension-appindicator -y 2>> /tmp/ErroAfterInstall.log -y
 sleep 3



 clear
 echo "##############################################################"
 echo " Iniciando Instalacao dos programas via DNF - Download"
 echo "##############################################################"
 sleep 5

 clear
 echo "##########################################"
 echo " Intalando o Angry IP"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install https://github.com/angryip/ipscan/releases/download/3.9.1/ipscan-3.9.1-1.x86_64.rpm -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o virtualbox"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install https://download.virtualbox.org/virtualbox/7.0.10/VirtualBox-7.0-7.0.10_158379_fedora36-1.x86_64.rpm -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o Binance"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install https://download.binance.com/electron-desktop/linux/production/binance-x86_64-linux.rpm -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Intalando o mullvad"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install https://mullvad.net/en/download/app/rpm/latest -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Instalacao r-studio"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install https://www.r-studio.com/downloads/RLinux5_x64.rpm -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Instalacao TeamView"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "##########################################"
 echo " Instalacao do insync"
 echo "##########################################"
 sleep 3
 echo " "
 sudo dnf install https://cdn.insynchq.com/builds/linux/insync-3.8.6.50504-fc38.x86_64.rpm -y 2>> /tmp/ErroAfterInstall.log
 sleep 3

 clear
 echo "#####################################################"
 echo " ATENCAO A LINHA ABAIXO SERA ADD no /etc/hosts.denny "
 echo " 	 ALL:ALL  	"
 echo "######################################################"
 sleep 3
 echo " "
 sudo bash -c "echo 'ALL:ALL' >> /etc/hosts.deny" 2>> /tmp/ErroAfterInstall.log

 clear
 echo "##########################################"
 echo " Regulando a Swap --> swappiness = 10"
 echo "##########################################"
 sleep 3
 echo " "
 sudo bash -c "echo 'vm.swappiness = 10' >> /etc/sysctl.conf" 2>> /tmp/ErroAfterInstall.log
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
 echo " Aperte ENTER para continuar " 
 read CONTINUAR


 clear
 echo " "
 echo "Fim da da Instalacao"
 sleep 10
 sudo su root
 echo " "
 sudo chown $USUARIO:$USUARIO /tmp/ErroAfterInstall.log
 sudo chmod 755 /tmp/ErroAfterInstall.log
 sudo cat /tmp/ErroAfterInstall.log | less

 echo ""
 echo "##########################################"
 echo "####             OBRIGADO             ####"
 echo "##########################################"
 echo ""
