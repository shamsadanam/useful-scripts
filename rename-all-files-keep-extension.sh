#!/bin/bash

# Check if directory exists
if [ ! -d "$1" ]; then
  echo "Directory $1 does not exist."
  exit 1
fi

# Check if base filename is provided
if [ -z "$2" ]; then
  echo "No base filename provided."
  exit 1
fi

# Change to the specified directory
cd "$1"

# Rename files
i=1
for file in *; do
  mv -- "$file" "$2-$i.${file##*.}"
  i=$((i+1))
done