.PHONY: sync serve build clean check help

# Default target
help:
	@echo "Available commands:"
	@echo "  make sync    - Sync content to GitHub using quartz sync"
	@echo "  make serve   - Start local development server"
	@echo "  make build   - Build the site"
	@echo "  make check   - Run code quality checks"
	@echo "  make clean   - Clean build artifacts"
	@echo "  make help    - Show this help message"

# Sync content to GitHub
sync:
	@echo "🔄 Syncing content to GitHub..."
	npx quartz sync

# Start local development server
serve:
	@echo "🚀 Starting local development server..."
	npx quartz build --serve

# Build the site
build:
	@echo "🏗️ Building the site..."
	npx quartz build

# Build with bundle info
build-info:
	@echo "🏗️ Building with bundle information..."
	npx quartz build --bundleInfo

# Run code quality checks
check:
	@echo "✅ Running code quality checks..."
	npm run check

# Run tests
test:
	@echo "🧪 Running tests..."
	npm test

# Format code
format:
	@echo "💄 Formatting code..."
	npm run format

# Clean build artifacts
clean:
	@echo "🧹 Cleaning build artifacts..."
	rm -rf public/
	rm -rf .quartz-cache/

# Development workflow - check, build, serve
dev: check build serve

# Production workflow - check, test, build
prod: check test build

# Quick sync workflow - format, build, sync
quick-sync: format build sync