#!/bin/bash

# Function to delete an existing user
username=$(dialog --inputbox "Enter the username to delete:" 8 40 3>&1 1>&2 2>&3)
exit_status=$?
if [ $exit_status -eq 0 ]; then
    if id "$username" &>/dev/null; then
        delete_home=$(dialog --yesno "Do you want to delete the home directory of $username as well?" 7 60)
        if [ $? -eq 0 ]; then
            sudo userdel -r "$username"
            dialog --msgbox "User $username and their home directory have been deleted successfully." 6 40
        else
            sudo userdel "$username"
            dialog --msgbox "User $username deleted successfully. Home directory not deleted." 6 40
        fi
    else
        dialog --msgbox "User $username does not exist. Cannot delete the user." 6 40
    fi
elif [ $exit_status -eq 1 ]; then
    dialog --msgbox "Operation canceled." 6 40
fi
