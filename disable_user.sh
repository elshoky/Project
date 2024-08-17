#!/bin/bash

# Function to disable a user
username=$(dialog --inputbox "Enter the username to disable:" 8 40 3>&1 1>&2 2>&3)
exit_status=$?
if [ $exit_status -eq 0 ]; then
    if id "$username" &>/dev/null; then
        sudo usermod -L "$username"
        dialog --msgbox "User $username has been disabled." 6 40
    else
        dialog --msgbox "User $username does not exist. Cannot disable the user." 6 40
    fi
elif [ $exit_status -eq 1 ]; then
    dialog --msgbox "Operation canceled." 6 40
fi
