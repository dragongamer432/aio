#!/bin/bash
# ==============================================
# Blueprint & Theme Setup Menu (GitHub Links)
# ==============================================

while true; do
    clear
    echo "=================================="
    echo "     BLUEPRINT & THEME SETUP      "
    echo "=================================="
    echo "1) Blueprint Installation"
    echo "2) Themes / Extensions Setup"
    echo "3) Exit"
    echo "=================================="
    read -p "root@dragoncloud:~#" choice

    case $choice in
        1)
            echo "Running Blueprint Installation..."
            bash <(curl -s https://raw.githubusercontent.com/dragongamer432/aio/refs/heads/main/blueprint.sh)
            read -p "Press Enter to return to main menu..."
            ;;
        2)
            echo "Running Themes / Extensions Setup..."
            bash <(curl -s https://raw.githubusercontent.com/dragongamer432/aio/refs/heads/main/ext.sh)
            read -p "Press Enter to return to main menu..."
            ;;
        3)
            echo "Exiting... Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option! Please enter 1, 2, or 3."
            sleep 2
            ;;
    esac
done
