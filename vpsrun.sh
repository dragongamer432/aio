#!/bin/bash

# ================= COLORS =================
NC='\033[0m'
B_RED='\033[1;31m'
B_CYAN='\033[1;36m'
B_PURPLE='\033[1;35m'
B_GREEN='\033[1;32m'
B_YELLOW='\033[1;33m'
W='\033[1;37m'
G='\033[0;32m'

# ============== ADD YOUR COMMANDS HERE ==============
CMD1="bash <(curl -s https://yourlink.com/kvm.sh)"
CMD2="bash <(curl -s https://yourlink.com/nokvm.sh)"
CMD3="bash <(curl -s https://yourlink.com/lxc.sh)"
CMD4="bash <(curl -s https://yourlink.com/docker.sh)"
CMD5="bash <(curl -s https://yourlink.com/idx.sh)"

# ================= MENU FUNCTION =================
show_menu() {
clear

echo -e "${B_CYAN}"
echo "  _____                               _____ _                 _ "
echo " |  __ \                             / ____| |               | |"
echo " | |  | |_ __ __ _  __ _  ___  _ __ | |    | | ___  _   _  __| |"
echo " | |  | | '__/ _` |/ _` |/ _ \| '_ \| |    | |/ _ \| | | |/ _` |"
echo " | |__| | | | (_| | (_| | (_) | | | | |____| | (_) | |_| | (_| |"
echo " |_____/|_|  \__,_|\__, |\___/|_| |_|\_____|_|\___/ \__,_|\__,_|"
echo "                    __/ |                                       "
echo "                   |___/                                        "
echo -e "${NC}"

echo -e "${B_PURPLE}                VPS RUN CONTROL PANEL${NC}"
echo -e "${G}────────────────────────────────────────────────────────${NC}"

echo -e " ${B_GREEN}[1]${NC} KVM-VM Manager"
echo -e " ${B_GREEN}[2]${NC} NO-KVM Environment"
echo -e " ${B_GREEN}[3]${NC} LXC/LXD Container Manager"
echo -e " ${B_GREEN}[4]${NC} Docker Engine Setup"
echo -e " ${B_GREEN}[5]${NC} IDX Tool Setup"
echo ""
echo -e " ${B_RED}[6] Exit${NC}"

echo -e "\n${G}────────────────────────────────────────────────────────${NC}"
echo -ne "${B_CYAN}➜${NC} ${W}Select Option (1-6): ${NC}"
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
    6) echo -e "${B_RED}Exiting VPS Run...${NC}"; exit 0 ;;
    *) echo -e "${B_RED}Invalid Option!${NC}" ;;
esac

echo ""
read -p "Press Enter to return to menu..."
done
