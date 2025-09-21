# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a collection of utility scripts for different purposes. The scripts are not related to one another but serve various development and automation tasks.

## Project Structure

- `skiplabs/` - Contains bootstrapping scripts for Skip Labs TypeScript projects
  - `bootstrap.sh` - Comprehensive Node.js/TypeScript project setup script

## Scripts and Commands

### Skip Labs Bootstrap Script

The `skiplabs/bootstrap.sh` script creates a complete TypeScript Node.js project with:

**Development Commands** (available after running bootstrap):
- `bun dev` - Start development server with hot reload
- `bun build` - Build TypeScript to JavaScript
- `bun start` - Start production server
- `bun lint` - Run ESLint
- `bun format` - Format code with Prettier
- `bun clean` - Clean build files and dependencies

**Technologies Set Up**:
- TypeScript with modern ES2022 target
- Fastify web server with async/await patterns
- Skip Labs integration (@skiplabs/skip)
- ESLint with dual configuration (legacy .eslintrc.json + modern flat config)
- Prettier for code formatting
- Bun runtime for TypeScript execution and package management
- Native hot-reloading with bun --watch

## Development Workflow

1. Navigate to desired project directory
2. Run `curl -sSL https://raw.githubusercontent.com/hubyrod/ScriptCollection/main/skiplabs/bootstrap.sh | bash` to set up a new TypeScript project
3. The script automatically initializes git, installs dependencies, and creates initial project structure
4. Use the generated bun scripts for development workflow

## Architecture Notes

The bootstrap script follows a modular approach:
- Separates development and production dependencies
- Uses modern TypeScript configuration with strict mode and ES modules
- Provides dual ESLint configuration for compatibility and modern standards
- Integrates Bun for fast TypeScript execution and package management
- Sets up Fastify as the default web framework with proper error handling
- Includes Skip Labs package for specialized functionality
- Creates a complete project structure with proper tooling integration