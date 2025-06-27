#!/bin/bash

# Colors and formatting
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
BOLD='\033[1m'

print_step() {
    echo -e "\n${BLUE}${BOLD}$1...${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_step "Initializing Git repository"
git init > /dev/null 2>&1
print_success "Git repository initialized"

print_step "Setting up .gitignore"
cat > .gitignore << EOL
# Dependencies
node_modules
.pnpm-store

# Build output
dist
build

# Logs
logs
*.log
npm-debug.log*
pnpm-debug.log*

# Environment variables
.env
.env.local
.env.*.local

# IDE
.vscode/*
!.vscode/extensions.json
!.vscode/launch.json
!.vscode/settings.json
.idea
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?

# OS
.DS_Store
Thumbs.db
EOL
print_success ".gitignore created"

print_step "Initializing pnpm project"
pnpm init > /dev/null 2>&1
print_success "Project initialized"

print_step "Installing development dependencies"
pnpm add -D @eslint/js \
  @types/node \
  @typescript-eslint/eslint-plugin \
  @typescript-eslint/parser \
  eslint \
  eslint-config-prettier \
  eslint-plugin-prettier \
  nodemon \
  prettier \
  ts-node \
  tsx \
  typescript > /dev/null 2>&1
print_success "Development dependencies installed"

print_step "Creating project structure"
mkdir -p src
print_success "Source directory created"

print_step "Configuring TypeScript"
npx tsc --init \
  --target ES2022 \
  --module nodenext \
  --moduleResolution nodenext \
  --rootDir "./src" \
  --outDir "./dist" \
  --esModuleInterop true \
  --sourceMap true \
  --strict true \
  --skipLibCheck true > /dev/null 2>&1
print_success "TypeScript configured"

print_step "Configuring ESLint"
cat > .eslintrc.json << EOL
{
  "parser": "@typescript-eslint/parser",
  "plugins": ["@typescript-eslint", "prettier"],
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "prettier"
  ],
  "rules": {
    "prettier/prettier": "error",
    "@typescript-eslint/explicit-function-return-type": "off",
    "@typescript-eslint/no-explicit-any": "warn"
  }
}
EOL
cat > eslint.config.js << EOL
import js from '@eslint/js';
import typescript from '@typescript-eslint/eslint-plugin';
import typescriptParser from '@typescript-eslint/parser';
import prettier from 'eslint-plugin-prettier';
import prettierConfig from 'eslint-config-prettier';

export default [
  js.configs.recommended,
  {
    files: ['src/**/*.{js,ts}'],
    languageOptions: {
      parser: typescriptParser,
      ecmaVersion: 2022,
      sourceType: 'module',
      globals: {
        console: 'readonly',
        process: 'readonly',
      },
    },
    plugins: {
      '@typescript-eslint': typescript,
      'prettier': prettier,
    },
    rules: {
      ...typescript.configs.recommended.rules,
      'prettier/prettier': 'error',
      '@typescript-eslint/no-unused-vars': 'error',
    },
  },
  prettierConfig,
];
EOL
print_success "ESLint configured"

print_step "Configuring Prettier"
cat > .prettierrc << EOL
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": true,
  "printWidth": 100,
  "tabWidth": 2
}
EOL
print_success "Prettier configured"

print_step "Configuring package.json scripts"
pnpm pkg set type="module"
pnpm pkg set scripts.build="tsc"
pnpm pkg set scripts.start="node dist/index.js"
pnpm pkg set scripts.dev="nodemon --watch 'src/**/*.ts' --exec 'tsx' src/index.ts"
pnpm pkg set scripts.clean="rm -rf dist node_modules"
pnpm pkg set scripts.lint="eslint 'src/**/*.{js,ts}'"
pnpm pkg set scripts.format="prettier --write 'src/**/*.{js,ts}'"
print_success "Package.json configured"

print_step "Installing Skip Labs dependencies"
pnpm add @skiplabs/skip > /dev/null 2>&1
print_success "Skip Labs package installed"

print_step "Installing Fastify and types"
pnpm add fastify > /dev/null 2>&1
pnpm add -D @types/fastify > /dev/null 2>&1
print_success "Fastify installed"

print_step "Creating initial source file"
cat > src/index.ts << EOL
import Fastify from 'fastify';

const fastify = Fastify({ logger: true });
const port = Number(process.env.PORT) || 3000;

fastify.get('/', async () => {
  return { message: 'Hello from TypeScript!' };
});

const start = async () => {
  try {
    await fastify.listen({ port, host: '0.0.0.0' });
    console.log(\`Server running at http://localhost:\${port}\`);
  } catch (err) {
    fastify.log.error(err);
    process.exit(1);
  }
};
start();
EOL
print_success "Created initial source file"

print_step "Creating initial commit"
git add . > /dev/null 2>&1
git commit -m "Initial commit" > /dev/null 2>&1
print_success "Initial commit created"

echo -e "\n${GREEN}${BOLD}🚀 Project setup complete!${NC}"
echo -e "${YELLOW}Available commands:${NC}"
echo -e "  ${BOLD}pnpm dev${NC}      - Start development server with hot reload"
echo -e "  ${BOLD}pnpm build${NC}    - Build the project"
echo -e "  ${BOLD}pnpm start${NC}    - Start the production server"
echo -e "  ${BOLD}pnpm lint${NC}     - Run ESLint"
echo -e "  ${BOLD}pnpm format${NC}   - Format code with Prettier"
echo -e "  ${BOLD}pnpm clean${NC}    - Clean build files and dependencies\n"


