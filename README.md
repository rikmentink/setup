# Setup

Standardized development environment for macOS — shell config, Docker services, and Odoo setup.

## Quick Start

```bash
git clone https://github.com/rikmentink/setup.git ~/setup
cd ~/setup
bash install.sh
```

Prompts you to install shell config, Docker services, and Odoo tools.

## What's Included

- **Shell config** — `.zshenv` and `.zshrc` with Pyenv, NVM, Postgres, XML tools
- **Docker** — Postgres + Maildev (optional)
- **Odoo** — Config templates, requirements, wkhtmltopdf setup, enterprise dependency scanner (optional)

## Customization

Copy config files to your projects and customize as needed:

```bash
cp ~/.odoo/odoo.conf.template ~/my-project/odoo.conf
# Edit db_name, db_filter, addons_path
```

For enterprise addon dependencies:

```bash
bash ~/.odoo/install-enterprise-deps.sh
```