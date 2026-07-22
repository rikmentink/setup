#!/bin/bash

IDE=${1:-cursor}

if [ "$IDE" = "vscode" ]; then
    CLI_CMD="code"
elif [ "$IDE" = "cursor" ]; then
    CLI_CMD="cursor"
else
    echo "Error: Unknown IDE: $IDE"
    exit 1
fi

if ! command -v "$CLI_CMD" &> /dev/null; then
    echo "Error: $IDE is not installed"
    exit 1
fi

EXTENSIONS_FILE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/extensions.txt"

echo "Installing $IDE extensions..."

while IFS= read -r extension; do
    [ -z "$extension" ] && continue
    echo "Installing: $extension"
    "$CLI_CMD" --install-extension "$extension"
done < "$EXTENSIONS_FILE"

echo "✓ Extensions installed"