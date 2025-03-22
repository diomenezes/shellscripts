#!/bin/bash
clear

# Caminhos dos arquivos de log
LOG_MODIFICATIONS="security_modifications.log"
LOG_ERRORS="security_errors.log"

# Função para exibir uma barra de progresso
progress_bar() {
    local progress=0
    local total_steps=$1
    local current_step=$2
    local bar_length=50

    progress=$((current_step * 100 / total_steps))
    filled_length=$((bar_length * current_step / total_steps))
    bar=$(printf '%0.s#' $(seq 1 $filled_length))
    empty=$(printf '%0.s-' $(seq 1 $((bar_length - filled_length))))

    printf "\r[%s%s] %d%%" "$bar" "$empty" "$progress"
}

# Função para verificar e corrigir vulnerabilidades
check_and_fix() {
    clear
    echo "[$(date)] Verificando vulnerabilidades comuns no sistema Linux..." | tee -a "$LOG_MODIFICATIONS"

    total_steps=9
    current_step=0

    # Vulnerabilidade 1: Arquivos com permissões '777'
    current_step=$((current_step + 1))
    progress_bar $total_steps $current_step
    echo ""
    echo ""
    echo -e "\n1. Verificando arquivos com permissões '777' (inseguros)..." | tee -a "$LOG_MODIFICATIONS"
    echo ""
    files_with_777=$(find / -type f -perm 777 2>>"$LOG_ERRORS")
    if [[ -n "$files_with_777" ]]; then
        echo "Encontrado(s):" | tee -a "$LOG_MODIFICATIONS"
        echo "$files_with_777" | tee -a "$LOG_MODIFICATIONS"
        echo "Sugestão: Ajustar permissões para 644, evitar acesso total por qualquer usuário." | tee -a "$LOG_MODIFICATIONS"
        echo -e "Deseja aplicar as correções sugeridas automaticamente? (sim/não) "
        read -r apply_fix
        if [[ "$apply_fix" == "sim" ]]; then
            echo "$files_with_777" | while read -r file; do
                if [[ -e "$file" ]]; then
                    chmod 644 "$file" 2>>"$LOG_ERRORS"
                    echo "Permissões corrigidas para arquivo: $file" | tee -a "$LOG_MODIFICATIONS"
                else
                    echo "Arquivo não encontrado: $file" >> "$LOG_ERRORS"
                fi
            done
        fi
    else
        echo "Nenhum arquivo com permissões '777' encontrado." | tee -a "$LOG_MODIFICATIONS"
    fi

    # Vulnerabilidade 2: Diretórios com permissões '777'
    current_step=$((current_step + 1))
    progress_bar $total_steps $current_step
    echo ""
    echo ""
    echo -e "\n2. Verificando diretórios com permissões '777'..." | tee -a "$LOG_MODIFICATIONS"
    echo ""
    dirs_with_777=$(find / -type d -perm 777 2>>"$LOG_ERRORS")
    if [[ -n "$dirs_with_777" ]]; then
        echo "Encontrado(s):" | tee -a "$LOG_MODIFICATIONS"
        echo "$dirs_with_777" | tee -a "$LOG_MODIFICATIONS"
        echo "Sugestão: Ajustar permissões para 755, restringir acesso não autorizado." | tee -a "$LOG_MODIFICATIONS"
        echo -e "Deseja aplicar as correções sugeridas automaticamente? (sim/não) "
        read -r apply_fix
        if [[ "$apply_fix" == "sim" ]]; then
            echo "$dirs_with_777" | while read -r dir; do
                if [[ -d "$dir" ]]; then
                    chmod 755 "$dir" 2>>"$LOG_ERRORS"
                    echo "Permissões corrigidas para diretório: $dir" | tee -a "$LOG_MODIFICATIONS"
                else
                    echo "Diretório não encontrado: $dir" >> "$LOG_ERRORS"
                fi
            done
        fi
    else
        echo "Nenhum diretório com permissões '777' encontrado." | tee -a "$LOG_MODIFICATIONS"
    fi

    # Vulnerabilidade 3: Usuários sem senha
    current_step=$((current_step + 1))
    progress_bar $total_steps $current_step
    echo ""
    echo ""
    echo -e "\n3. Verificando usuários sem senha definida..." | tee -a "$LOG_MODIFICATIONS"
    echo ""
    users_no_password=$(awk -F: '($2=="") {print $1}' /etc/shadow 2>>"$LOG_ERRORS")
    if [[ -n "$users_no_password" ]]; then
        echo "Usuários encontrados sem senha definida:" | tee -a "$LOG_MODIFICATIONS"
        echo "$users_no_password" | tee -a "$LOG_MODIFICATIONS"
        echo "Sugestão: Configure senhas fortes para esses usuários." | tee -a "$LOG_MODIFICATIONS"
        echo -e "Deseja aplicar as correções sugeridas automaticamente? (sim/não) "
        read -r apply_fix
        if [[ "$apply_fix" == "sim" ]]; then
            echo "Usuários sem senha não podem ser corrigidos automaticamente. Configure senhas fortes manualmente." | tee -a "$LOG_MODIFICATIONS"
        fi
    else
        echo "Nenhum usuário sem senha encontrado." | tee -a "$LOG_MODIFICATIONS"
    fi

    # Vulnerabilidade 4: Serviços SSH com root permitido
    current_step=$((current_step + 1))
    progress_bar $total_steps $current_step
    echo ""
    echo ""
    echo -e "\n4. Verificando configuração do SSH para permitir login como root..." | tee -a "$LOG_MODIFICATIONS"
    echo ""
    ssh_config="/etc/ssh/sshd_config"
    if grep -q "^PermitRootLogin yes" "$ssh_config" 2>>"$LOG_ERRORS"; then
        echo "O SSH permite login como root." | tee -a "$LOG_MODIFICATIONS"
        echo "Sugestão: Altere a configuração para 'PermitRootLogin no' no arquivo $ssh_config." | tee -a "$LOG_MODIFICATIONS"
        echo -e "Deseja aplicar as correções sugeridas automaticamente? (sim/não) "
        read -r apply_fix
        if [[ "$apply_fix" == "sim" ]]; then
            sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' "$ssh_config" 2>>"$LOG_ERRORS"
            echo "Configuração do SSH alterada para não permitir login como root." | tee -a "$LOG_MODIFICATIONS"
            systemctl restart sshd 2>>"$LOG_ERRORS"
        fi
    else
        echo "SSH configurado para não permitir login como root." | tee -a "$LOG_MODIFICATIONS"
    fi

    # Vulnerabilidade 5: Arquivos sem dono ou grupo
    current_step=$((current_step + 1))
    progress_bar $total_steps $current_step
    echo ""
    echo ""
    echo -e "\n5. Verificando arquivos sem dono ou grupo..." | tee -a "$LOG_MODIFICATIONS"
    echo ""
    files_no_owner=$(find / -nouser -o -nogroup 2>>"$LOG_ERRORS")
    if [[ -n "$files_no_owner" ]]; then
        echo "Arquivos encontrados sem dono ou grupo:" | tee -a "$LOG_MODIFICATIONS"
        echo "$files_no_owner" | tee -a "$LOG_MODIFICATIONS"
        echo "Sugestão: Reatribuir um dono ou grupo apropriado." | tee -a "$LOG_MODIFICATIONS"
        echo -e "Deseja aplicar as correções sugeridas automaticamente? (sim/não) "
        read -r apply_fix
        if [[ "$apply_fix" == "sim" ]]; then
            echo "$files_no_owner" | while read -r file; do
                if [[ -e "$file" ]]; then
                    chown root:root "$file" 2>>"$LOG_ERRORS"
                    echo "Propriedade corrigida para arquivo: $file" | tee -a "$LOG_MODIFICATIONS"
                else
                    echo "Arquivo não encontrado: $file" >> "$LOG_ERRORS"
                fi
            done
        fi
    else
        echo "Nenhum arquivo sem dono ou grupo encontrado." | tee -a "$LOG_MODIFICATIONS"
    fi

    # Vulnerabilidade 6: Pacotes desatualizados
    current_step=$((current_step + 1))
    progress_bar $total_steps $current_step
    echo ""
    echo ""
    echo -e "\n6. Verificando pacotes desatualizados..." | tee -a "$LOG_MODIFICATIONS"
    echo ""
    outdated_packages=$(dnf check-update 2>>"$LOG_ERRORS")
    if [[ -n "$outdated_packages" ]]; then
        echo "Pacotes desatualizados encontrados:" | tee -a "$LOG_MODIFICATIONS"
        echo "$outdated_packages" | tee -a "$LOG_MODIFICATIONS"
        echo "Sugestão: Atualize os pacotes listados usando 'sudo dnf update'." | tee -a "$LOG_MODIFICATIONS"
        echo -e "Deseja aplicar as correções sugeridas automaticamente? (sim/não) "
        read -r apply_fix
        if [[ "$apply_fix" == "sim" ]]; then
            dnf update -y 2>>"$LOG_ERRORS"
            echo "Pacotes atualizados com sucesso." | tee -a "$LOG_MODIFICATIONS"
        fi
    else
        echo "Nenhum pacote desatualizado encontrado." | tee -a "$LOG_MODIFICATIONS"
    fi

    # Vulnerabilidade 7: Serviços desnecessários
    current_step=$((current_step + 1))
    progress_bar $total_steps $current_step
    echo ""
    echo ""
    echo -e "\n7. Verificando serviços em execução..." | tee -a "$LOG_MODIFICATIONS"
    echo ""
    running_services=$(systemctl list-units --type=service --state=running 2>>"$LOG_ERRORS")
    echo ""
    echo "Serviços em execução:" | tee -a "$LOG_MODIFICATIONS"
    echo "$running_services" | tee -a "$LOG_MODIFICATIONS"
    echo "Sugestão: Desative serviços desnecessários para reduzir a superfície de ataque." | tee -a "$LOG_MODIFICATIONS"

    # Vulnerabilidade 8: Firewall configurado
    current_step=$((current_step + 1))
    progress_bar $total_steps $current_step
    echo ""
    echo ""
    echo -e "\n8. Verificando configuração do firewall..." | tee -a "$LOG_MODIFICATIONS"
    echo ""
    firewall_status=$(firewall-cmd --state 2>>"$LOG_ERRORS")
    if [[ "$firewall_status" == "running" ]]; then
        echo "Firewall está ativo." | tee -a "$LOG_MODIFICATIONS"
    else
        echo "Firewall não está ativo. Sugestão: Ative o firewall usando 'sudo systemctl start firewalld'." | tee -a "$LOG_MODIFICATIONS"
    fi

    # Vulnerabilidade 9: SELinux configurado
    current_step=$((current_step + 1))
    progress_bar $total_steps $current_step
    echo ""
    echo ""
    echo -e "\n9. Verificando configuração do SELinux..." | tee -a "$LOG_MODIFICATIONS"
    echo ""
    selinux_status=$(sestatus 2>>"$LOG_ERRORS")
    echo "$selinux_status" | tee -a "$LOG_MODIFICATIONS"

    echo -e "\nTodas as verificações foram concluídas." | tee -a "$LOG_MODIFICATIONS"
}

# Início do script
echo ""
echo ""
echo "Este script verifica vulnerabilidades comuns no sistema e sugere correções."
echo "Deseja continuar? (sim/não)"
read -r continue_script

if [[ "$continue_script" == "sim" ]]; then
    # Limpar logs anteriores
    >"$LOG_MODIFICATIONS"
    >"$LOG_ERRORS"

    check_and_fix
else
    echo "Script cancelado pelo usuário. Saindo." | tee -a "$LOG_ERRORS"
fi

chown dmenezes:dmenezes security_errors.log security_modifications.log
