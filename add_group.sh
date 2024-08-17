#!/bin/bash

# Function to add a new group
groupname=$(dialog --inputbox "Enter the group name to add:" 8 40 3>&1 1>&2 2>&3)
exit_status=$?
if [ $exit_status -eq 0 ]; then
    if getent group "$groupname" > /dev/null; then
        dialog --msgbox "Group $groupname already exists. Cannot add the group." 6 40
    else
        if sudo groupadd "$groupname" 2>/tmp/addgroup_error.log; then
            if getent group "$groupname" > /dev/null; then
                dialog --msgbox "Group $groupname added successfully." 6 40
            else
                dialog --msgbox "Failed to add group $groupname. Group not found." 6 40
            fi
        else
            dialog --msgbox "Failed to add group $groupname. Check /tmp/addgroup_error.log for details." 6 40
        fi
    fi
elif [ $exit_status -eq 1 ]; then
    dialog --msgbox "Operation canceled." 6 40
fi
