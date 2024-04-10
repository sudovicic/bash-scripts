#!/bin/bash

dry_run=false

# Check for options and shift arguments accordingly
while [[ $# -gt 0 ]]; do
    case "$1" in
        --dry-run)
            dry_run=true
            shift
            ;;
    esac
done

# Remove empty directories after last file deletion
find . -mindepth 1 -type d -empty -print0 | while IFS= read -r -d '' dir; do
    if "$dry_run"; then
        echo "Would delete: $dir"
    else
        echo "Deleting: $dir"
        rmdir "$dir"
    fi
done
