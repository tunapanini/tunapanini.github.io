---
description: Sync content using Makefile commands
allowed-tools: Bash(make:*), Bash(git:*), Bash(npm:*), Read
---

# Content Synchronization

## Available Make Commands
- Project Makefile: @Makefile

## Current Status
- Working directory: !`pwd`
- Git status: !`git status --porcelain`
- Current branch: !`git branch --show-current`

## Pre-sync Validation
1. Ensure dependencies are installed: !`npm ci`
2. Run quality checks: !`make check`
3. Verify no uncommitted critical changes: !`git diff --name-only`

## Sync Execution
Executing sync using Makefile...

!`make sync`

## Post-sync Verification
- Final git status: !`git status`
- Check recent commits: !`git log --oneline -3`

## Available Makefile Commands
Use these commands for different workflows:
- `make serve` - Start local development server
- `make dev` - Full development workflow (check + build + serve)
- `make quick-sync` - Quick sync workflow (format + build + sync)
- `make help` - Show all available commands

For more options, run: !`make help`