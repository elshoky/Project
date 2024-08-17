#!/bin/bash

# Function to add a new user
username=$(dialog --inputbox "Enter the username to add:" 8 40 3>&1 1>&2 2>&3)
exit_status=$?
if [ $exit_status -eq 0 ]; then
    if id "$username" &>/dev/null; then
        dialog --msgbox "User $username already exists. Cannot add the user." 6 40
    else
        sudo adduser "$username"
        if [ $? -eq 0 ]; then
            dialog --msgbox "User $username added successfully." 6 40
        else
            dialog --msgbox "Failed to add user $username." 6 40
        fi
    fi
elif [ $exit_status -eq 1 ]; then
    dialog --msgbox "Operation canceled." 6 40
fi
