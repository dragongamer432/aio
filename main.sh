#!/bin/bash

# ================= COLORS =================
NC='\033[0m'
B_RED='\033[1;31m'
B_CYAN='\033[1;36m'
B_PURPLE='\033[1;35m'
B_GREEN='\033[1;32m'
G='\033[0;32m'
W='\033[1;37m'
GOLD='\033[1;33m'
BG_SHADE='\033[100m'

# ============== COMMAND LINKS ==============
URL1="https://raw.githubusercontent.com/dragongamer432/aio/main/vpsrun.sh"
URL2="https://raw.githubusercontent.com/dragongamer432/aio/main/ptero.sh"
URL3="https://raw.githubusercontent.com/dragongamer432/pteropanel/main/wings.sh"
URL4="https://raw.githubusercontent.com/dragongamer432/aio/main/tools.sh"
URL5="https://raw.githubusercontent.com/dragongamer432/aio/main/blueprint2.sh"
URL6="https://raw.githubusercontent.com/MuhammadAliUsman/vms/main/optimize-vps.sh"
URL7="https://raw.githubusercontent.com/dragongamer432/DragonShield/main/ddos.sh"

# ================= METRICS =================
get_metrics() {
    CPU=$(top -bn1 | awk -F',' '/Cpu/ {print int($1)}')
    RAM=$(free | awk '/Mem:/ {printf "%.0f", $3*100/$2}')
    UPT=$(uptime -p 2>/dev/null | sed 's/up //')
    DISK=$(df -h / | awk 'NR==2 {print $5}')
    CURRENT_HOST="dragoncloud"
}

# ================= SAFE EXECUTION =================
run_script() {
    curl -fsSL "$1" | bash
}

# ================= MENU =================
show_menu() {
clear
get_metrics

echo -e "${B_RED}"
cat << "EOF"
██████╗ ██████╗  █████╗  ██████╗  ██████╗ ███╗   ██╗
██╔══██╗██╔══██╗██╔══██╗██╔════╝ ██╔═══██╗████╗  ██║
██║  ██║██████╔╝███████║██║  ███╗██║   ██║██╔██╗ ██║
██║  ██║██╔══██╗██╔══██║██║   ██║██║   ██║██║╚██╗██║
██████╔╝██║  ██║██║  ██║╚██████╔╝╚██████╔╝██║ ╚████║
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝
EOF
echo -e "${NC}"

echo -e "${B_CYAN}                    DRAGONCLOUD CONTROL HUB${NC}"
echo -e "  ${G}───────────────────────────────────────────────────────────────────────────${NC}"

echo -e "  ${W}System Health:${NC}"
printf "  ${G}CPU:${NC} ${B_CYAN}%s%%%${NC}    ${G}RAM:${NC} ${B_PURPLE}%s%%%${NC}    ${G}Disk:${NC} ${GOLD}%s${NC}\n" "$CPU" "$RAM" "$DISK"
printf "  ${G}Uptime:${NC} ${B_GREEN}%s${NC}    ${G}Host:${NC} ${B_RED}%s${NC}\n" "$UPT" "$CURRENT_HOST"
echo ""

echo -e "  ${B_CYAN}  DEPLOYMENT SERVICES${NC}"
echo -e "  ${G}├─ ${W}[1]${NC} Setup VPS Environment      ${G}├─ ${W}[5]${NC} BluePrint Configurator"
echo -e "  ${G}├─ ${W}[2]${NC} Pterodactyl Panel          ${G}├─ ${W}[6]${NC} System Optimizer"
echo -e "  ${G}└─ ${W}[3]${NC} Install Pterodactyl Wings  ${G}└─ ${W}[7]${NC} DDoS Protection"
echo ""

echo -e "  ${B_PURPLE}  MAINTENANCE${NC}"
echo -e "  ${G}└─ ${W}[4]${NC} Utility Toolbox            ${B_RED}${NC}${BG_SHADE}${W} [8] SHUTDOWN ${NC}${B_RED}${NC}"

echo -e "\n  ${G}───────────────────────────────────────────────────────────────────────────${NC}"
echo -ne "  ${B_CYAN}➜${NC} ${W}Command${NC} ${G}(1-8):${NC} "
}

# ================= MAIN LOOP =================
while true; do
    show_menu
    read -r choice

    case "$choice" in
        1) run_script "$URL1" ;;
        2) run_script "$URL2" ;;
        3) run_script "$URL3" ;;
        4) run_script "$URL4" ;;
        5) run_script "$URL5" ;;
        6) run_script "$URL6" ;;
        7) run_script "$URL7" ;;
        8) shutdown now ;;
        *) echo -e "${B_RED}Invalid Option!${NC}" ;;
    esac

    echo ""
    read -rp "Press Enter to return to menu..."
done
