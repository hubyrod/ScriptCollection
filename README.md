# ScriptCollection
A collection of various scripts for different purposes. These scripts are not related to one another but are useful for various tasks and projects.

## Skiplabs

### bootstrap.sh
A comprehensive Node.js project bootstrapping script that sets up a modern TypeScript development environment with the following features:

#### Usage
```bash
cd /path/to/your/new/project
curl -sSL https://raw.githubusercontent.com/hubyrod/ScriptCollection/main/skiplabs/bootstrap.sh | bash
```

#### Features

- **Project Structure**
  - Initializes a Git repository with a comprehensive `.gitignore`
  - Creates a structured project layout with `src` directory
  - Sets up a TypeScript-based Node.js project using pnpm

- **Development Tools**
  - TypeScript configuration with modern settings (ES2022, strict mode)
  - ESLint with TypeScript support (both legacy and flat config)
  - Prettier code formatting
  - Nodemon with tsx for development hot-reloading

- **Dependencies**
  - Fastify for web server functionality
  - Skip Labs integration (@skiplabs/skip)
  - All necessary TypeScript and development types

- **Generated Scripts**
  - `pnpm dev` - Start development server with hot reload
  - `pnpm build` - Build the project
  - `pnpm start` - Start the production server
  - `pnpm lint` - Run ESLint
  - `pnpm format` - Format code with Prettier
  - `pnpm clean` - Clean build files and dependencies

The script creates a complete, ready-to-use TypeScript project with a basic Fastify server and automatically makes an initial Git commit.


