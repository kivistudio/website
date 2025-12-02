.PHONY: help install build serve watch clean check format test update sync restore

# Default content and output directories
CONTENT_DIR ?= content
OUTPUT_DIR ?= public
PORT ?= 8080

# Colors for output
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[0;33m
NC := \033[0m # No Color

help: ## Show this help message
	@echo "$(BLUE)Quartz Makefile Commands$(NC)"
	@echo ""
	@echo "$(GREEN)Setup:$(NC)"
	@echo "  make install     - Install dependencies"
	@echo ""
	@echo "$(GREEN)Development:$(NC)"
	@echo "  make build       - Build Quartz (output: $(OUTPUT_DIR))"
	@echo "  make serve       - Build and serve locally on port $(PORT)"
	@echo "  make watch       - Build and watch for changes with hot-reload"
	@echo ""
	@echo "$(GREEN)Maintenance:$(NC)"
	@echo "  make update      - Get latest Quartz updates"
	@echo "  make sync        - Sync Quartz to/from GitHub"
	@echo "  make restore     - Restore content folder from cache"
	@echo ""
	@echo "$(GREEN)Code Quality:$(NC)"
	@echo "  make check       - Run type checking and format check"
	@echo "  make format      - Format code with Prettier"
	@echo "  make test        - Run tests"
	@echo ""
	@echo "$(GREEN)Utilities:$(NC)"
	@echo "  make clean       - Remove build artifacts and cache"
	@echo ""
	@echo "$(YELLOW)Variables:$(NC)"
	@echo "  CONTENT_DIR=$(CONTENT_DIR)  - Content directory"
	@echo "  OUTPUT_DIR=$(OUTPUT_DIR)    - Output directory"
	@echo "  PORT=$(PORT)                - Server port"

install: ## Install dependencies
	@echo "$(BLUE)Installing dependencies...$(NC)"
	npm install

build: ## Build Quartz
	@echo "$(BLUE)Building Quartz...$(NC)"
	npx quartz build -d $(CONTENT_DIR) -o $(OUTPUT_DIR)

build-verbose: ## Build Quartz with verbose output
	@echo "$(BLUE)Building Quartz (verbose)...$(NC)"
	npx quartz build -d $(CONTENT_DIR) -o $(OUTPUT_DIR) -v

serve: ## Build and serve locally
	@echo "$(BLUE)Building and serving Quartz on port $(PORT)...$(NC)"
	npx quartz build -d $(CONTENT_DIR) -o $(OUTPUT_DIR) --serve --port $(PORT)

update: ## Get latest Quartz updates
	@echo "$(BLUE)Updating Quartz...$(NC)"
	npx quartz update

sync: ## Sync Quartz to/from GitHub
	@echo "$(BLUE)Syncing Quartz...$(NC)"
	npx quartz sync

restore: ## Restore content folder from cache
	@echo "$(BLUE)Restoring content folder...$(NC)"
	npx quartz restore

check: ## Run type checking and format check
	@echo "$(BLUE)Running checks...$(NC)"
	npm run check

format: ## Format code with Prettier
	@echo "$(BLUE)Formatting code...$(NC)"
	npm run format

test: ## Run tests
	@echo "$(BLUE)Running tests...$(NC)"
	npm test

clean: ## Remove build artifacts and cache
	@echo "$(BLUE)Cleaning build artifacts...$(NC)"
	rm -rf $(OUTPUT_DIR)
	rm -rf .quartz-cache
	rm -rf node_modules/.cache
	@echo "$(GREEN)Clean complete!$(NC)"

