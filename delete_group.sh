#!/bin/bash

# Function to delete a group
groupname=$(dialog --inputbox "Enter the group name to delete:" 8 40 3>&1 1>&2 2>&3)
exit_status=$?
if [ $exit_status -eq 0 ]; then
    if getent group "$groupname" > /dev/null; then
        sudo groupdel "$groupname"
        dialog --msgbox "Group $groupname deleted successfully." 6 40
    else
        dialog --msgbox "Group $groupname does not exist. Cannot delete the group." 6 40
    fi
elif [ $exit_status -eq 1 ]; then
    dialog --msgbox "Operation canceled." 6 40
fi
