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

# ============== COMMAND LINKS (EDIT THESE) ==============
CMD1="bash <(curl -s https://raw.githubusercontent.com/dragongamer432/aio/refs/heads/main/vpsrun.sh)"
CMD2="bash <(curl -s https://raw.githubusercontent.com/dragongamer432/aio/refs/heads/main/ptero.sh)"
CMD3="bash <(curl -s https://raw.githubusercontent.com/dragongamer432/pteropanel/refs/heads/main/wings.sh)"
CMD4="bash <(curl -s https://raw.githubusercontent.com/dragongamer432/aio/refs/heads/main/tools.sh)"
CMD5="bash <(curl -s https://raw.githubusercontent.com/dragongamer432/aio/refs/heads/main/blueprint2.sh)"
CMD6="bash <(curl -s https://raw.githubusercontent.com/MuhammadAliUsman/vms/refs/heads/main/optimize-vps.sh)"
CMD7="bash <(curl -s bash <(curl -s https://raw.githubusercontent.com/dragongamer432/DragonShield/refs/heads/main/ddos.sh))"
CMD8="shutdown now"

# ================= REAL-TIME ANALYTICS =================
get_metrics() {
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.0f", $2+$4}')
    RAM=$(free | grep Mem | awk '{printf "%.0f", $3*100/$2}')
    UPT=$(uptime -p | sed 's/up //')
    DISK=$(df -h / | awk 'NR==2 {print $5}')
    CURRENT_HOST="dragoncloud"
}

# ================= MENU =================
show_menu() {
clear
get_metrics

# ===== DRAGON ASCII TITLE =====
echo -e "${B_RED}"
echo "██████╗ ██████╗  █████╗  ██████╗  ██████╗ ███╗   ██╗"
echo "██╔══██╗██╔══██╗██╔══██╗██╔════╝ ██╔═══██╗████╗  ██║"
echo "██║  ██║██████╔╝███████║██║  ███╗██║   ██║██╔██╗ ██║"
echo "██║  ██║██╔══██╗██╔══██║██║   ██║██║   ██║██║╚██╗██║"
echo "██████╔╝██║  ██║██║  ██║╚██████╔╝╚██████╔╝██║ ╚████║"
echo "╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝"
echo -e "${NC}"

echo -e "${B_CYAN}                    DRAGONCLOUD CONTROL HUB${NC}"
echo -e "  ${G}───────────────────────────────────────────────────────────────────────────${NC}"

# ===== DASHBOARD CORE =====
echo -e "  ${W}System Health:${NC}"
printf "  ${G}CPU:${NC} ${B_CYAN}%s%%%${NC}    ${G}RAM:${NC} ${B_PURPLE}%s%%%${NC}    ${G}Disk:${NC} ${GOLD}%s${NC}\n" "$CPU" "$RAM" "$DISK"
printf "  ${G}Uptime:${NC} ${B_GREEN}%s${NC}    ${G}Host:${NC} ${B_RED}%s${NC}\n" "$UPT" "$CURRENT_HOST"
echo ""

# ===== ACTION GRID =====
echo -e "  ${B_CYAN}  DEPLOYMENT SERVICES${NC}"
echo -e "  ${G}├─ ${W}[1]${NC} Setup VPS Environment      ${G}├─ ${W}[5]${NC} BluePrint Configurator"
echo -e "  ${G}├─ ${W}[2]${NC} Pterodactyl Panel          ${G}├─ ${W}[6]${NC} System Optimizer"
echo -e "  ${G}└─ ${W}[3]${NC} Install Pterodactyl Wings  ${G}└─ ${W}[7]${NC} DDoS Protection"
echo ""

echo -e "  ${B_PURPLE}  MAINTENANCE${NC}"
echo -e "  ${G}└─ ${W}[4]${NC} Utility Toolbox            ${B_RED}${NC}${BG_SHADE}${W} [8] SHUTDOWN ${NC}${B_RED}${NC}"

# ===== FOOTER =====
echo -e "\n  ${G}───────────────────────────────────────────────────────────────────────────${NC}"
echo -ne "  ${B_CYAN}➜${NC} ${W}Command${NC} ${G}(1-8):${NC} "
}

# ================= MAIN LOOP =================
while true; do
show_menu
read choice

case $choice in
    1) eval $CMD1 ;;
    2) eval $CMD2 ;;
    3) eval $CMD3 ;;
    4) eval $CMD4 ;;
    5) eval $CMD5 ;;
    6) eval $CMD6 ;;
    7) eval $CMD7 ;;
    8) eval $CMD8 ;;
    *) echo -e "${B_RED}Invalid Option!${NC}" ;;
esac

echo ""
read -p "Press Enter to return to menu..."
done
