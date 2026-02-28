#!/bin/bash

# Colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

# Function to get current Tailscale status
get_status() {
    if ! command -v tailscale >/dev/null 2>&1; then
        STATUS="${RED}notinstalled${RESET}"
    else
        sudo tailscale status >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            STATUS="${GREEN}active${RESET}"
        else
            STATUS="${YELLOW}stopped${RESET}"
        fi
    fi
}

# Install Tailscale using your exact steps
install_tailscale() {
    echo "Installing Tailscale..."
    sudo mkdir -p --mode=0755 /usr/share/keyrings
    curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
    curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
    sudo apt-get update && sudo apt-get install -y tailscale
    echo "Starting Tailscale..."
    sudo tailscale up
    sleep 2
}

# Uninstall Tailscale
uninstall_tailscale() {
    echo "Uninstalling Tailscale..."
    sudo apt-get remove --purge -y tailscale
    sudo rm -f /etc/apt/sources.list.d/tailscale.list
    sudo rm -f /usr/share/keyrings/tailscale-archive-keyring.gpg
    echo "Tailscale uninstalled."
    sleep 2
}

# Reinstall Tailscale
reinstall_tailscale() {
    uninstall_tailscale
    install_tailscale
}

# Menu loop
while true; do
    clear
    get_status
    echo "=============================="
    echo "       Tailscale Manager      "
    echo "=============================="
    echo -e "Status: $STATUS"
    echo ""
    echo "1) Install Tailscale"
    echo "2) Uninstall Tailscale"
    echo "3) Reinstall Tailscale"
    echo "4) Show Tailscale Status"
    echo "5) Exit"
    echo ""
    read -p "root@DragonCloud " choice

    case $choice in
        1) install_tailscale ;;
        2) uninstall_tailscale ;;
        3) reinstall_tailscale ;;
        4) get_status; echo -e "Current status: $STATUS" ;;
        5) exit 0 ;;
        *) echo "Invalid option!" ;;
    esac
    echo ""
    read -p "Press Enter to continue..."
done
