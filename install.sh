#!/bin/bash
# setup/install.sh

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Setup Installation"
echo ""

# Backup existing shell config
if [ -f ~/.zshenv ]; then
    cp ~/.zshenv ~/.zshenv.bak
    echo "✓ Backed up existing .zshenv to .zshenv.bak"
fi
if [ -f ~/.zshrc ]; then
    cp ~/.zshrc ~/.zshrc.bak
    echo "✓ Backed up existing .zshrc to .zshrc.bak"
fi
if [ -f ~/.odoorc ]; then
    cp ~/.odoorc ~/.odoorc.bak
    echo "✓ Backed up existing .odoorc to .odoorc.bak"
fi
echo ""

# Install shell config
echo "Installing shell configuration..."
cp "$REPO_DIR/root/.zshenv" ~/.zshenv
cp "$REPO_DIR/root/.zshrc" ~/.zshrc
echo "✓ .zshenv and .zshrc installed"
echo ""

# Docker
read -p "Install Docker services (Postgres + Maildev)? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    mkdir -p ~/.docker-projects
    cp "$REPO_DIR/docker/docker-compose.yml" ~/.docker-projects/
    cp "$REPO_DIR/docker/init-postgres.sql" ~/.docker-projects/
    echo "✓ Docker files copied to ~/.docker-projects"
    echo "  To start: cd ~/.docker-projects && docker compose up -d"
    echo ""
fi

# wkhtmltopdf
read -p "Install wkhtmltopdf wrapper? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    bash "$REPO_DIR/odoo/setup-wkhtmltopdf.sh"
    echo ""
fi

echo "✓ Setup complete"
echo "  Reload shell: source ~/.zshrc"