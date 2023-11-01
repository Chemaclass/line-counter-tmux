#!/bin/bash
# "$(tmux display-message -p '#{pane_current_path}')"
# #!/bin/bash

# Check if the required arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <file_endings> <directory_to_ignore>"
    exit 1
fi

file_endings="$1"
current_directory="$(tmux display-message -p '#{pane_current_path}')"
directory_to_ignore="$2"
lines_of_code=0

# Function to traverse the directory tree
traverse_directory() {
    local directory="$1"
    local ignore_directory="$2"

    for item in "$directory"/*; do
        if [ "$item" -ef "$ignore_directory" ]; then
            continue  # Skip the directory to ignore
        elif [ -d "$item" ]; then
            # If it's a directory, recursively call the function
            traverse_directory "$item" "$ignore_directory"
        elif [ -f "$item" ]; then
            # If it's a file, check if it matches the specified file endings
            if [[ "$item" == *.$file_endings ]]; then
                # If it matches, count lines of code and add to the total
                lines=$(wc -l < "$item")
                lines_of_code=$((lines_of_code + lines))
            fi
        fi
    done
}

# Start the directory traversal
traverse_directory "$current_directory" "$(readlink -f "$directory_to_ignore")"

# Return the total lines of code
echo "Total lines of code: $lines_of_code"
