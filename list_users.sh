#!/bin/bash

# Function to list all users with username, UID, and home directory
users=$(getent passwd | awk -F: '{print $1 ":" $3 ":" $6}')

if [ -z "$users" ]; then
    dialog --msgbox "No users found." 6 40
    exit 0
fi

tempfile=$(mktemp)
echo "$users" > "$tempfile"

selected_user=$(dialog --menu "Select a user" 20 50 15 $(awk '{print NR " " $0}' "$tempfile") 3>&1 1>&2 2>&3)
exit_status=$?
if [ $exit_status -eq 0 ]; then
    user_info=$(sed -n "${selected_user}p" "$tempfile")
    dialog --msgbox "Selected User Information:\n\n$user_info" 10 60
elif [ $exit_status -eq 1 ]; then
    dialog --msgbox "Operation canceled." 6 40
fi

rm -f "$tempfile"
