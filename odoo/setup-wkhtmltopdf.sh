#!/bin/bash
# setup/docker/setup-wkhtmltopdf.sh

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed"
    echo ""
    echo "Please install Docker first:"
    echo "  brew install --cask docker"
    echo ""
    exit 1
fi

echo "Setting up wkhtmltopdf wrapper..."

# Pull the image
docker pull --platform linux/amd64 madnight/docker-alpine-wkhtmltopdf

# Create ~/bin if it doesn't exist
mkdir -p ~/bin

# Create wrapper script
cat > ~/bin/wkhtmltopdf << 'EOF'
#!/bin/bash
docker run --rm --platform linux/amd64 -v "$(pwd)":"$(pwd)" -w "$(pwd)" madnight/docker-alpine-wkhtmltopdf wkhtmltopdf "$@"
EOF

chmod +x ~/bin/wkhtmltopdf

# Verify it works
echo "Testing wkhtmltopdf..."
wkhtmltopdf --version

echo "✓ wkhtmltopdf ready"
