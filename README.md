# Bulk-Meta-Data-Year-Change
Script asks for a year then a directory and updates the meta data to reflect a new capture your based on input

 How to Use

    Save this script as update_exif_prompt.sh

    Make it executable:

chmod +x update_exif_prompt.sh

Run it:

./update_exif_prompt.sh

It will:

    Ask for the year

    Ask for the directory

    Process all .jpg/.jpeg files recursively


 Notes

    exiftool can handle EXIF-compatible formats like .tif, .heic, and .png, but not all formats support all date fields (e.g., .png has no native EXIF, but ExifTool stores it in XMP or IPTC).

    -overwrite_original avoids creating backup files. Remove it if you want to keep .original versions.
