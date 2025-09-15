---
description: Start development server with intelligent change detection
allowed-tools: Bash(npx:quartz build --serve)
---

# Development Preview

## Pre-flight Checks
- Recent changes: !`git status --porcelain`
- Config validation: !`node -e "console.log('Config valid:', !!require('./quartz.config.ts'))"`

## Starting Development Server

Starting Quartz development server with live reload...

!`npx quartz build --serve`

## Monitoring
While the server runs, monitor for:
1. Any build errors in the console
2. Changes to configuration files
3. New content additions
4. Link validation issues

The server will be available at http://localhost:8080