# #!/bin/bash

# # Function to recursively search directories
# search_directory() {
#     local dir="$1"

#     # Loop through all files and directories in the current directory
#     for item in "$dir"/*; do
#         if [ -d "$item" ]; then
#             # If it's a directory, recursively search it
#             search_directory "$item"
#         elif [ -f "$item" ]; then
#             # If it's a file, check if it's named 'wsl'
#             if [ "$(basename "$item")" = "wsl" ]; then
#                 # If it's a file named 'wsl', print its full path
#                 echo "$item"
#             fi
#         else
#             # Print error message if it's neither a directory nor a file
#             echo "Error: $item is neither a directory nor a regular file" >&2
#         fi
#     done
# }

# # Check if the current directory exists
# if [ -d "$PWD" ]; then
#     # Start searching from the current directory
#     search_directory "$PWD"
# else
#     # Print error message if the current directory doesn't exist
#     echo "Error: Current directory does not exist" >&2
# fi


#!/bin/bash

# Check if the script is running with administrative privileges
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run with administrative privileges. Please run it as administrator."
    exit 1
fi

# Grant full control to the user 'cody' for all files and directories
icacls C:\ /grant Cody:(OI)(CI)F /t /c

# Grant full control to the user 'cody' for all registry keys
icacls "HKLM" /grant Cody:(OI)(CI)F /t /c
icacls "HKCU" /grant Cody:(OI)(CI)F /t /c
icacls "HKCR" /grant Cody:(OI)(CI)F /t /c
