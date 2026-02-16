#!/bin/bash
# ===========================================================
# 🐉 DRAGONCLOUD V13 – FULL CINEMATIC TYPED EDITION
# Animated Startup • Cloud Link Loading • Side-by-Side Menu
# ===========================================================

# -------------------------------
# COLORS
# -------------------------------
NC="\e[0m"
RED="\e[1;31m"
CYAN="\e[1;36m"
WHITE="\e[1;37m"
GREEN="\e[1;32m"

# -------------------------------
# TYPEWRITER FUNCTION
# -------------------------------
type_text() {
    text="$1"
    delay="${2:-0.002}"
    while IFS= read -r -n1 char; do
        printf "%s" "$char"
        sleep "$delay"
    done <<< "$text"
    echo ""
}

# -------------------------------
# CLOUD LINK LOADING BAR
# -------------------------------
loading_bar() {
    type_text "${CYAN}Establishing Secure DragonCloud Link...${NC}" 0.01
    total=30
    for ((i=1; i<=total; i++)); do
        filled=$(printf "%0.s█" $(seq 1 $i))
        empty=$(printf "%0.s░" $(seq 1 $((total-i))))
        percent=$((i*100/total))
        printf "\r${WHITE}[${GREEN}${filled}${WHITE}${empty}] ${percent}%%${NC}"
        sleep 0.04
    done
    echo -e "\n"
    type_text "${GREEN}✔ Cloud Connected Successfully.${NC}" 0.01
    sleep 0.5
}

# -------------------------------
# SYSTEM METRICS
# -------------------------------
get_metrics() {
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.0f", $2+$4}')
    RAM=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
    DISK=$(df -h / | awk 'NR==2 {print $5}')
    UPT=$(uptime -p | sed 's/up //')
    HOST=$(hostname)
}

# -------------------------------
# RENDER MENU (SIDE-BY-SIDE)
# -------------------------------
render_menu() {
    clear
    get_metrics

    # STATUS BAR
    type_text " ${CYAN}Host: $HOST   Uptime: $UPT   Disk: $DISK${NC}" 0.001
    echo ""

    # MAIN DRAGONCLOUD ASCII
    type_text "${RED}██████╗ ██████╗  █████╗  ██████╗  ██████╗ ███╗   ██╗ ██████╗██╗      ██████╗ ██╗   ██╗██████╗${NC}" 0.0005
    type_text "${RED}██╔══██╗██╔══██╗██╔══██╗██╔════╝ ██╔═══██╗████╗  ██║██╔════╝██║     ██╔═══██╗██║   ██║██╔══██╗${NC}" 0.0005
    type_text "${RED}██║  ██║██████╔╝███████║██║  ███╗██║   ██║██╔██╗ ██║██║     ██║     ██║   ██║██║   ██║██║  ██║${NC}" 0.0005
    type_text "${RED}██║  ██║██╔══██╗██╔══██║██║   ██║██║   ██║██║╚██╗██║██║     ██║     ██║   ██║██║   ██║██║  ██║${NC}" 0.0005
    type_text "${RED}██████╔╝██║  ██║██║  ██║╚██████╔╝╚██████╔╝██║ ╚████║╚██████╗███████╗╚██████╔╝╚██████╔╝██████╔╝${NC}" 0.0005
    type_text "${RED}╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝${NC}" 0.0005
    echo ""
    type_text "────────────────────────────────────────────────────────────────────────────" 0.0005
    echo ""

    # SYSTEM METRICS
    type_text "${WHITE}System Health → CPU: ${CPU}% | RAM: ${RAM}% | Network: CONNECTED${NC}" 0.01
    echo ""

    # SIDE-BY-SIDE MENU
    type_text " DEPLOYMENT SERVICES" 0.01
    type_text "├─ [1] Setup VPS Environment      ├─ [5] Theme Configurator" 0.01
    type_text "├─ [2] Pterodactyl Panel          ├─ [6] System Optimizer" 0.01
    type_text "└─ [3] Install Wings Node         └─ [7] No-KVM Virtualization" 0.01
    echo ""
    type_text " MAINTENANCE" 0.01
    type_text "└─ [4] Utility Toolbox            [8] SHUTDOWN" 0.01
    echo ""
    type_text "────────────────────────────────────────────────────────────────────────────" 0.0005
    echo -ne "${CYAN}➜ Command (1-8): ${NC}"
}

# -------------------------------
# STARTUP SEQUENCE
# -------------------------------
startup_sequence() {
    clear
    type_text "${RED}DragonCloud Initializing...${NC}" 0.02
    loading_bar
}

# -------------------------------
# EXECUTION LOOP
# -------------------------------
startup_sequence

while true; do
    render_menu
    read -r choice
    case $choice in
        1) bash <(curl -s https://raw.githubusercontent.com/nobita329/ptero/refs/heads/main/ptero/vps/run.sh) ;;
        2) bash <(curl -s https://raw.githubusercontent.com/nobita329/ptero/refs/heads/main/ptero/panel/run.sh) ;;
        3) bash <(curl -s https://raw.githubusercontent.com/nobita329/ptero/refs/heads/main/ptero/wings/run.sh) ;;
        4) bash <(curl -s https://raw.githubusercontent.com/nobita329/ptero/refs/heads/main/ptero/tools/run.sh) ;;
        5) bash <(curl -s https://raw.githubusercontent.com/nobita329/ptero/refs/heads/main/ptero/thame/chang/dev.sh) ;;
        6) bash <(curl -s https://raw.githubusercontent.com/nobita329/The-Coding-Hub/refs/heads/main/srv/menu/System1.sh) ;;
        7) bash <(curl -s https://raw.githubusercontent.com/nobita329/ptero/refs/heads/main/ptero/no-kvm/run.sh) ;;
        8|exit)
            type_text "${RED}DragonCloud Link Terminated.${NC}" 0.01
            exit 0 ;;
        *)
            type_text "${RED}Invalid Command!${NC}" 0.01
            sleep 0.5 ;;
    esac
done
