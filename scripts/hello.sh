#!/bin/bash

# Create a directory for the output if do not exist
mkdir -p output

current_date=$(date +%Y%m%d_%H%M%S)

# Greetings function
greetings () {
    echo "Hello from Bash!"
}

# Count the number of files in the current directory, excluding subdirectories function
count_files () {
    find . -maxdepth 1 -type f | wc -l 
}

# Redirect output to a file including errors
exec > output/log-${current_date}.txt 2>&1


greetings
echo "Current date and time: $current_date"
echo "Number of files: $(count_files)"