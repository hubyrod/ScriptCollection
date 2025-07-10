# ScriptCollection

A collection of utility scripts for different purposes. These scripts are not related to one another but serve various development and automation tasks.

## Scripts Overview

### Skip Labs Bootstrap Script

Located at `skiplabs/bootstrap.sh`, this script creates a complete TypeScript Node.js project with modern development tooling.

#### Quick Start

```bash
cd /path/to/your/new/project
curl -sSL https://raw.githubusercontent.com/hubyrod/ScriptCollection/main/skiplabs/bootstrap.sh | bash
```

#### What Gets Created

**Project Structure:**
- TypeScript Node.js project with `src/` directory
- Git repository with comprehensive `.gitignore`
- pnpm package manager configuration

**Development Stack:**
- **TypeScript** - Modern ES2022 target with strict mode
- **Fastify** - Fast web server with async/await patterns
- **Skip Labs** - Integration with @skiplabs/skip package
- **ESLint** - Dual configuration (legacy + modern flat config)
- **Prettier** - Code formatting
- **tsx** - Fast TypeScript execution
- **Nodemon** - Development hot-reloading

**Available Commands:**
```bash
pnpm dev      # Start development server with hot reload
pnpm build    # Build TypeScript to JavaScript
pnpm start    # Start production server
pnpm lint     # Run ESLint
pnpm format   # Format code with Prettier
pnpm clean    # Clean build files and dependencies
```

The script automatically initializes git, installs dependencies, creates the initial project structure, and makes the first commit - giving you a complete, ready-to-use TypeScript project.

### General Development Environment

Located at `general/`, this directory contains Docker-based development environment tools.

#### Docker Development Environment

The `dockerize` script creates a portable development environment using Docker.

**Quick Start:**
```bash
# Run from any project directory
curl -sSL https://raw.githubusercontent.com/hubyrod/ScriptCollection/main/general/dockerize | bash
```

**Features:**
- **Ubuntu 22.04** base with essential development tools
- **Languages & Runtimes:** Python 3, Node.js 20.x, npm, pnpm
- **Development Tools:** git, vim, nano, htop, tree, jq, curl, wget
- **Shell:** zsh with Oh My Zsh and basic configuration
- **Claude CLI** pre-installed for AI-assisted development
- **Port Mapping:** Automatically exposes ports 3000, 8080 (configurable)

**Usage Options:**
```bash
# Basic usage (mounts current directory)
./dockerize

# Rebuild Docker image
./dockerize --rebuild

# Custom port mapping
./dockerize --ports "3000:3000,8000:8000,9000:9000"

# Make globally available
echo 'alias dockerize="/path/to/dockerize"' >> ~/.zshrc
```

**What You Get:**
- Current directory mounted at `/home/dev/workspace`
- Non-root user `dev` with sudo privileges
- Git configured with sensible defaults
- All common development ports exposed
- Clean, isolated development environment


