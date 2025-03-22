#!/bin/bash
clear

# Caminhos dos arquivos de log
LOG_MODIFICATIONS="security_modifications.log"
LOG_ERRORS="security_errors.log"

# Função para verificar e corrigir vulnerabilidades
check_and_fix() {
    clear
    echo "[$(date)] Verificando vulnerabilidades comuns no sistema Linux..." | tee -a "$LOG_MODIFICATIONS"

    total_steps=9
    current_step=0

    # Vulnerabilidade 1: Arquivos com permissões '777'
    current_step=$((current_step + 1))
    echo -e "\n1. Verificando arquivos com permissões '777'..." | tee -a "$LOG_MODIFICATIONS"
    files_with_777=$(find / -type f -perm 777 2>>"$LOG_ERRORS")
    if [[ -n "$files_with_777" ]]; then
        echo "$files_with_777" | tee -a "$LOG_MODIFICATIONS"
        echo -e "Deseja aplicar as correções sugeridas automaticamente? (sim/não) "
        read -r apply_fix
        if [[ "$apply_fix" == "sim" ]]; then
            echo "$files_with_777" | while read -r file; do
                chmod 644 "$file" 2>>"$LOG_ERRORS"
                echo "Permissão corrigida para arquivo: $file" | tee -a "$LOG_MODIFICATIONS"
            done
        fi
    else
        echo "Nenhum arquivo com permissões '777' encontrado." | tee -a "$LOG_MODIFICATIONS"
    fi

    # Vulnerabilidade 2: Diretórios com permissões '777'
    current_step=$((current_step + 1))
    echo -e "\n2. Verificando diretórios com permissões '777'..." | tee -a "$LOG_MODIFICATIONS"
    dirs_with_777=$(find / -type d -perm 777 2>>"$LOG_ERRORS")
    if [[ -n "$dirs_with_777" ]]; then
        echo "$dirs_with_777" | tee -a "$LOG_MODIFICATIONS"
        echo -e "Deseja aplicar as correções sugeridas automaticamente? (sim/não) "
        read -r apply_fix
        if [[ "$apply_fix" == "sim" ]]; then
            echo "$dirs_with_777" | while read -r dir; do
                chmod 755 "$dir" 2>>"$LOG_ERRORS"
                echo "Permissão corrigida para diretório: $dir" | tee -a "$LOG_MODIFICATIONS"
            done
        fi
    else
        echo "Nenhum diretório com permissões '777' encontrado." | tee -a "$LOG_MODIFICATIONS"
    fi

    # Vulnerabilidade 3: Usuários sem senha
    current_step=$((current_step + 1))
    echo -e "\n3. Verificando usuários sem senha definida..." | tee -a "$LOG_MODIFICATIONS"
    users_no_password=$(awk -F: '($2=="") {print $1}' /etc/shadow 2>>"$LOG_ERRORS")
    if [[ -n "$users_no_password" ]]; then
        echo "Usuários sem senha encontrados:" | tee -a "$LOG_MODIFICATIONS"
        echo "$users_no_password" | tee -a "$LOG_MODIFICATIONS"
        echo -e "Sugestão: Configure senhas fortes para esses usuários manualmente."
    else
        echo "Nenhum usuário sem senha encontrado." | tee -a "$LOG_MODIFICATIONS"
    fi

    # Vulnerabilidade 4: Serviços SSH com root permitido
    current_step=$((current_step + 1))
    echo -e "\n4. Verificando configuração do SSH para login como root..." | tee -a "$LOG_MODIFICATIONS"
    ssh_config="/etc/ssh/sshd_config"
    if grep -q "^PermitRootLogin yes" "$ssh_config" 2>>"$LOG_ERRORS"; then
        echo "O SSH permite login como root." | tee -a "$LOG_MODIFICATIONS"
        echo -e "Deseja aplicar as correções sugeridas automaticamente? (sim/não) "
        read -r apply_fix
        if [[ "$apply_fix" == "sim" ]]; then
            sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' "$ssh_config" 2>>"$LOG_ERRORS"
            systemctl restart sshd 2>>"$LOG_ERRORS"
            echo "Configuração do SSH alterada para não permitir login como root." | tee -a "$LOG_MODIFICATIONS"
        fi
    else
        echo "SSH já configurado para não permitir login como root." | tee -a "$LOG_MODIFICATIONS"
    fi

    # Vulnerabilidade 5: Pacotes desatualizados
    current_step=$((current_step + 1))
    echo -e "\n5. Verificando pacotes desatualizados..." | tee -a "$LOG_MODIFICATIONS"
    echo "Deseja aplicar as correções sugeridas automaticamente? (sim/não) "
    read -r apply_fix
    if [[ "$apply_fix" == "sim" ]]; then
        dnf update -y 2>>"$LOG_ERRORS"
        echo "Pacotes atualizados." | tee -a "$LOG_MODIFICATIONS"
    else
        echo "Atualização automática não aplicada." | tee -a "$LOG_MODIFICATIONS"
    fi

    # Vulnerabilidade 6: Serviços desnecessários
    current_step=$((current_step + 1))
    echo -e "\n6. Verificando serviços em execução..." | tee -a "$LOG_MODIFICATIONS"
    running_services=$(systemctl list-units --type=service --state=running 2>>"$LOG_ERRORS")
    echo "Serviços em execução:" | tee -a "$LOG_MODIFICATIONS"
    echo "$running_services" | tee -a "$LOG_MODIFICATIONS"
    echo "Sugestão: Desative serviços desnecessários manualmente."

    # Vulnerabilidade 7: Firewall configurado
    current_step=$((current_step + 1))
    echo -e "\n7. Verificando configuração do firewall..." | tee -a "$LOG_MODIFICATIONS"
    firewall_status=$(firewall-cmd --state 2>>"$LOG_ERRORS")
    if [[ "$firewall_status" == "running" ]]; then
        echo "Firewall está ativo." | tee -a "$LOG_MODIFICATIONS"
    else
        echo "Firewall não está ativo." | tee -a "$LOG_MODIFICATIONS"
        echo -e "Deseja ativar o firewall automaticamente? (sim/não) "
        read -r apply_fix
        if [[ "$apply_fix" == "sim" ]]; then
            systemctl start firewalld 2>>"$LOG_ERRORS"
            echo "Firewall ativado." | tee -a "$LOG_MODIFICATIONS"
        fi
    fi

    # Vulnerabilidade 8: SELinux configurado
    current_step=$((current_step + 1))
    echo -e "\n8. Verificando configuração do SELinux..." | tee -a "$LOG_MODIFICATIONS"
    selinux_status=$(sestatus 2>>"$LOG_ERRORS")
    echo "$selinux_status" | tee -a "$LOG_MODIFICATIONS"

    # Vulnerabilidade 9: Arquivos sem dono ou grupo
    current_step=$((current_step + 1))
    echo -e "\n9. Verificando arquivos sem dono ou grupo..." | tee -a "$LOG_MODIFICATIONS"
    files_no_owner=$(find / -nouser -o -nogroup 2>>"$LOG_ERRORS")
    if [[ -n "$files_no_owner" ]]; then
        echo "$files_no_owner" | tee -a "$LOG_MODIFICATIONS"
        echo -e "Deseja aplicar as correções sugeridas automaticamente? (sim/não) "
        read -r apply_fix
        if [[ "$apply_fix" == "sim" ]]; then
            echo "$files_no_owner" | while read -r file; do
                chown root:root "$file" 2>>"$LOG_ERRORS"
                echo "Propriedade corrigida para arquivo: $file" | tee -a "$LOG_MODIFICATIONS"
            done
        fi
    else
        echo "Nenhum arquivo sem dono ou grupo encontrado." | tee -a "$LOG_MODIFICATIONS"
    fi

    echo -e "\nTodas as verificacoes foram concluidas." | tee -a "$LOG_MODIFICATIONS"
}

# Início do script
clear
echo "Este script verifica vulnerabilidades comuns no sistema e sugere correções."
echo "Deseja continuar? (sim/não)"
read -r continue_script

if [[ "$continue_script" == "sim" ]]; then
    > "$LOG_MODIFICATIONS"
    > "$LOG_ERRORS"
    check_and_fix
else
    echo "Script cancelado pelo usuário. Saindo." | tee -a "$LOG_ERRORS"
fi

