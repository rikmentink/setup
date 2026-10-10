#!/bin/bash

IDE=${1:-cursor}

if [ "$IDE" = "vscode" ]; then
    SETTINGS_DIR="$HOME/Library/Application Support/Code/User"
elif [ "$IDE" = "cursor" ]; then
    SETTINGS_DIR="$HOME/Library/Application Support/Cursor/User"
else
    echo "Error: Unknown IDE: $IDE"
    exit 1
fi

REPO_SETTINGS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/settings.json"

if [ ! -f "$REPO_SETTINGS" ]; then
    echo "Error: settings.json not found"
    exit 1
fi

mkdir -p "$SETTINGS_DIR"
cp "$REPO_SETTINGS" "$SETTINGS_DIR/settings.json"

echo "✓ Settings installed for $IDE"
