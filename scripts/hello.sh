#!/bin/bash

# Create a directory for the output if do not exist
mkdir -p output
mkdir -p logs

# Set current date
current_date=$(date +%Y%m%d_%H%M%S)

# Greetings function
greetings () {
    echo "Hello from Bash!"
}

# Count the number of files in the current directory, excluding subdirectories function
count_files() {
    find . -maxdepth 1 -type f | wc -l 
}

log_count_files(){
    echo "LOG_FILE_COUNT=$(count_files)" >> "$GITHUB_ENV"
}
log_count_files

# Generate and Export log name so GitHub Actions can read it later

if [[ -n "$1" ]]; then
    output_file="$1"
else 
    output_file="log-${current_date}.txt"
fi



log_file() {
    echo "LOG_FILE=${output_file}" >> "$GITHUB_ENV"
}
log_file



# Redirect output to a file including errors
exec > output/$output_file 2>&1


greetings
echo "Current date and time: $current_date"
echo "Number of files: $(count_files)"

# append to logs/history
echo "$current_date $output_file" >> logs/history.txt
