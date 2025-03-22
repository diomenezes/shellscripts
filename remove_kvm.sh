#!/bin/bash

# Desativar e Remover KVM no Fedora 41 devido à incompatibilidade com VirtualBox

# Verificar se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute como root."
  exit 1
fi

# Parar e desativar os serviços do KVM
echo "Parando e desativando serviços do KVM..."
systemctl stop libvirtd
systemctl disable libvirtd

# Remover pacotes relacionados ao KVM
echo "Removendo pacotes relacionados ao KVM..."
dnf remove -y qemu-kvm libvirt virt-install virt-manager

# Verificar e descarregar módulos do KVM
echo "Verificando e descarregando módulos do KVM..."
modprobe -r kvm_intel kvm_amd kvm 2>/dev/null

# Adicionar módulos do KVM à blacklist
echo "Adicionando módulos do KVM à blacklist..."
echo -e "blacklist kvm\nblacklist kvm_intel\nblacklist kvm_amd" > /etc/modprobe.d/blacklist-kvm.conf

# Atualizar configuração do initramfs
echo "Atualizando configuração do initramfs..."
dracut --force

# Informar ao usuário sobre o reboot necessário
echo "As alterações foram aplicadas. Por favor, reinicie o sistema para concluir o processo."

exit 0

