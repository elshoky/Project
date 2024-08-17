#!/bin/bash

# Main menu
while true; do
    option=$(dialog --menu "Admin Helper Script" 20 50 10 \
        1 "Add User" \
        2 "Delete User" \
        3 "Change User Password" \
        4 "List Users" \
        5 "Add Group" \
        6 "Delete Group" \
        7 "Disable User" \
        8 "Enable User" \
        9 "About" \
        10 "Exit" 3>&1 1>&2 2>&3)

    if [ $? -ne 0 ]; then
        dialog --msgbox "Thanks for using the program." 6 40
        break
    fi

    case $option in
        1) ./add_user.sh ;;
        2) ./delete_user.sh ;;
        3) ./change_password.sh ;;
        4) ./list_users.sh ;;
        5) ./add_group.sh ;;
        6) ./delete_group.sh ;;
        7) ./disable_user.sh ;;
        8) ./enable_user.sh ;;
        9) ./about.sh ;;
        10) dialog --msgbox "Thanks for using the program." 6 40; break ;;
    esac
done

clear
