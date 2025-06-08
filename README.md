# 🕰️ Update EXIF Dates for Scanned Photos

This script updates the EXIF metadata of image files to reflect the **original date the photo was taken**, rather than the date the photo was scanned or digitized.

It's ideal for photographers, archivists, and data hoarders who want accurate historical metadata for their scanned image collections.

---

## 📜 Features

- Prompts for:
  - ✅ Year photo was taken (e.g., `1987`)
  - ✅ Target directory containing the images
- Recursively processes all supported image files
- Updates the following EXIF fields:
  - `DateTimeOriginal`
  - `CreateDate`
  - `ModifyDate`
- Overwrites original metadata (no `.jpg_original` files)

---

## 📂 Supported File Types

- `.jpg`, `.jpeg`
- `.tif`, `.tiff`
- `.png`
- `.heic`, `.heif`
- `.bmp`
- `.gif`

> Note: Some formats like `.png` and `.gif` don't support full EXIF metadata; in such cases, ExifTool will use alternative metadata tags (e.g. XMP or IPTC).

---

## 🛠 Requirements

- [ExifTool](https://exiftool.org)

### Install ExifTool

**macOS (Homebrew):**
```bash
brew install exiftool
