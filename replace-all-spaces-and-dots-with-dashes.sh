#!/bin/bash

# Navigate to the target directory
cd academy

# Loop through each file in the directory
for file in *; do
  # Check if it's a file and not a directory
  if [ -f "$file" ]; then
    # Extract the file extension (e.g., .png)
    extension="${file##*.}"
    
    # Remove the extension from the filename
    filename_no_extension="${file%.*}"
    
    # Replace spaces and dots with hyphens in the filename (excluding the extension)
    new_filename=$(echo "$filename_no_extension" | sed -E 's/[\. ]+/-/g')
    
    # Combine the new filename with the original extension
    new_filename_with_extension="${new_filename}.${extension}"
    
    # Rename the file if the new filename is different
    if [ "$file" != "$new_filename_with_extension" ]; then
      mv "$file" "$new_filename_with_extension"
    fi
  fi
done
