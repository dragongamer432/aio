#!/bin/bash
# ===========================================================
# 🐉 DRAGONCLOUD V16 – HOST SET TO DRAGONCLOUD
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
# TYPEWRITER FUNCTION (FOR LINK ONLY)
# -------------------------------
type_text() {
    text="$1"
    delay="${2:-0.01}"   # fast typing
    for (( i=0; i<${#text}; i++ )); do
        printf "%s" "${text:$i:1}"
        sleep "$delay"
    done
    echo ""
}

# -------------------------------
# LOADING BAR (FAST)
# -------------------------------
loading_bar() {
    total=30
    for ((i=1; i<=total; i++)); do
        filled=$(printf "%0.s█" $(seq 1 $i))
        empty=$(printf "%0.s░" $(seq 1 $((total-i))))
        percent=$((i*100/total))
        printf "\r${WHITE}[${GREEN}${filled}${WHITE}${empty}] ${percent}%%${NC}"
        sleep 0.03
    done
    echo -e "\n"
}

# -------------------------------
# SYSTEM METRICS
# -------------------------------
get_metrics() {
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{printf "%.0f", $2+$4}')
    RAM=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
    DISK=$(df -h / | awk 'NR==2 {print $5}')
    UPT=$(uptime -p | sed 's/up //')
    HOST="DragonCloud"   # Forced hostname
}

# -------------------------------
# MENU RENDER (INSTANT PRINT)
# -------------------------------
render_menu() {
    clear
    get_metrics

    # STATUS BAR
    echo -e "${CYAN}Host: $HOST   Uptime: $UPT   Disk: $DISK${NC}"
    echo ""

    # MAIN DRAGONCLOUD ASCII (INSTANT)
    echo -e "${RED}██████╗ ██████╗  █████╗  ██████╗  ██████╗ ███╗   ██╗ ██████╗██╗      ██████╗ ██╗   ██╗██████╗${NC}"
    echo -e "${RED}██╔══██╗██╔══██╗██╔══██╗██╔════╝ ██╔═══██╗████╗  ██║██╔════╝██║     ██╔═══██╗██║   ██║██╔══██╗${NC}"
    echo -e "${RED}██║  ██║██████╔╝███████║██║  ███╗██║   ██║██╔██╗ ██║██║     ██║     ██║   ██║██║   ██║██║  ██║${NC}"
    echo -e "${RED}██║  ██║██╔══██╗██╔══██║██║   ██║██║   ██║██║╚██╗██║██║     ██║     ██║   ██║██║   ██║██║  ██║${NC}"
    echo -e "${RED}██████╔╝██║  ██║██║  ██║╚██████╔╝╚██████╔╝██║ ╚████║╚██████╗███████╗╚██████╔╝╚██████╔╝██████╔╝${NC}"
    echo -e "${RED}╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝${NC}"
    echo ""
    echo "────────────────────────────────────────────────────────────────────────────"
    echo ""

    # SYSTEM METRICS
    echo -e "${WHITE}System Health → CPU: ${CPU}% | RAM: ${RAM}% | Network: CONNECTED${NC}"
    echo ""

    # SIDE-BY-SIDE MENU
    echo " DEPLOYMENT SERVICES"
    echo "├─ [1] Setup VPS Environment      ├─ [5] Theme Configurator"
    echo "├─ [2] Pterodactyl Panel          ├─ [6] System Optimizer"
    echo "└─ [3] Install Wings Node         └─ [7] No-KVM Virtualization"
    echo ""
    echo " MAINTENANCE"
    echo "└─ [4] Utility Toolbox            [8] SHUTDOWN"
    echo ""
    echo "────────────────────────────────────────────────────────────────────────────"
    echo -ne "${CYAN}➜ root@DragonCloud: ${NC}"
}

# -------------------------------
# STARTUP SEQUENCE
# -------------------------------
startup_sequence() {
    clear
    type_text "${RED}DragonCloud Initializing...${NC}" 0.01
    type_text "${CYAN}Establishing Secure DragonCloud Link...${NC}" 0.005
    loading_bar
}

# -------------------------------
# MAIN LOOP
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
            echo -e "${RED}DragonCloud Link Terminated.${NC}"
            exit 0 ;;
        *)
            echo -e "${RED}Invalid Command!${NC}"
            sleep 0.5 ;;
    esac
done
