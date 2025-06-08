#!/bin/bash

# Prompt for the year
read -p "Enter the year the photos were taken (e.g., 1987): " YEAR

# Validate year input
if ! [[ "$YEAR" =~ ^[0-9]{4}$ ]]; then
  echo "Error: Invalid year. Please enter a 4-digit number like 1987."
  exit 1
fi

# Prompt for the directory
read -p "Enter the full path to the directory containing the photos: " TARGET_DIR

# Validate directory
if [[ ! -d "$TARGET_DIR" ]]; then
  echo "Error: Directory does not exist: $TARGET_DIR"
  exit 1
fi

# Set the default date (Jan 1, noon of the entered year)
NEW_DATE="${YEAR}:01:01 12:00:00"

# Confirm exiftool is installed
if ! command -v exiftool &> /dev/null; then
  echo "Error: exiftool not found. Please install it first."
  exit 1
fi

echo
echo "Updating EXIF dates in: $TARGET_DIR"
echo "Target file types: JPG, JPEG, TIFF, PNG, HEIC, BMP, GIF"
echo "Setting DateTimeOriginal, CreateDate, and ModifyDate to: $NEW_DATE"
echo

# File extensions to include (case-insensitive)
EXTENSIONS="jpg jpeg tif tiff png heic heif bmp gif"

# Loop through each extension and find/update matching files
for EXT in $EXTENSIONS; do
  find "$TARGET_DIR" -type f -iname "*.$EXT" | while read -r file; do
    echo "Processing: $file"
    exiftool \
      "-DateTimeOriginal=$NEW_DATE" \
      "-CreateDate=$NEW_DATE" \
      "-ModifyDate=$NEW_DATE" \
      -overwrite_original "$file"
  done
done

echo
echo "All done."
