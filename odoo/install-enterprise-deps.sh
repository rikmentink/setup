#!/bin/bash
# install-enterprise-deps.sh - Extract and install Odoo enterprise addon dependencies

read -p "Enter path to Odoo enterprise addons: " ENTERPRISE_PATH

if [ ! -d "$ENTERPRISE_PATH" ]; then
    echo "Error: Path does not exist"
    exit 1
fi

echo "Scanning $ENTERPRISE_PATH for external dependencies..."

python3 << PYTHON_SCRIPT
import os
import ast

enterprise_path = "$ENTERPRISE_PATH"
deps = set()

for root, dirs, files in os.walk(enterprise_path):
    if "__manifest__.py" in files:
        manifest_path = os.path.join(root, "__manifest__.py")
        try:
            with open(manifest_path) as f:
                manifest = ast.literal_eval(f.read())
                if "external_dependencies" in manifest:
                    if "python" in manifest["external_dependencies"]:
                        for pkg in manifest["external_dependencies"]["python"]:
                            deps.add(pkg)
        except Exception as e:
            print(f"Warning: Could not parse {manifest_path}: {e}")

if deps:
    print("\nFound dependencies:")
    for dep in sorted(deps):
        print(f"  - {dep}")
    
    deps_file = "/tmp/enterprise_deps.txt"
    with open(deps_file, "w") as f:
        f.write("\n".join(sorted(deps)))
    
    print(f"\nInstalling {len(deps)} packages...")
    os.system(f"pip install -r {deps_file}")
    print("✓ Enterprise addon dependencies installed")
else:
    print("No external Python dependencies found")
PYTHON_SCRIPT