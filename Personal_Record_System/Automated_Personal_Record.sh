#!/bin/bash

# User should be able to add a new record, edit existing records, search for specific records, generate reports

while true; do
    echo "Welcome to the Personal Record System Manager"
    echo "1. Add a New Record"
    echo "2. Edit Existing Records"
    echo "3. Search for Records"
    echo "4. Generate Reports"
    echo "5. Backup Personal Records"
    echo "6. Generate Strong and Random Password"
    echo "7. Exit"

    read -p "Please select an option (1-7): " user_input

    case $user_input in
        1)
            read -p "Enter the name of new record: " new_record
            mkdir "$new_record"
            echo "$new_record has been created"
            ;;
        2)
            read -p "Enter the record to edit: " edit_record
            rm -r "$edit_record" || { echo "Error: Directory not found"; continue; }
            echo "$edit_record has been successfully edited"
            ;;
        3)
            read -p "Enter Record Name to Search: " search_record
            find . -type d -name "*$search_record*" 2>/dev/null
            ;;
        4)
            read -p "Which Record do you want to be Generated: " gen_record
            ls "$gen_record"
            ;;
        5)
            read -p "Which file should be backed up? " backup_dir
            backup_file="backup_$(date +%Y-%m-%d).tar.gz"
            mkdir -p "$backup_dir" || { echo "Error: Unable to create backup directory"; continue; }
            tar -czvf "$backup_dir/$backup_file" -C /path/to/directory .
            echo "Backup created successfully: $backup_dir/$backup_file"
            ;;
        6)
            read -p "Enter the length of the password: " length
            password=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c "$length")
            echo "Generated password: $password"
            ;;
        7)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 7."
            ;;
    esac
done

