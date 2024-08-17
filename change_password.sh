#!/bin/bash

# Function to change user password
username=$(dialog --inputbox "Enter the username to change the password:" 8 40 3>&1 1>&2 2>&3)
exit_status=$?
if [ $exit_status -eq 0 ]; then
    if id "$username" &>/dev/null; then
        sudo passwd "$username"
    else
        dialog --msgbox "User $username does not exist. Cannot change password." 6 40
    fi
elif [ $exit_status -eq 1 ]; then
    dialog --msgbox "Operation canceled." 6 40
fi
