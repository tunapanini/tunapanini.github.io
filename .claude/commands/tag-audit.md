---
description: Comprehensive tag analysis and optimization suggestions
---

# Tag System Audit

## Current Tag Analysis
- All tags in use: !`grep -r "tags:" content --include="*.md" | cut -d: -f3- | tr ',' '\n' | tr -d '[]' | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//' | sort | uniq -c | sort -nr`

## Content Statistics
- Total notes: !`find content -name "*.md" | wc -l`
- Notes with tags: !`grep -r "tags:" content --include="*.md" | wc -l`
- Average tags per note: !`grep -r "tags:" content --include="*.md" | cut -d: -f3- | tr ',' '\n' | wc -l`

## Analysis Tasks
1. Identify similar/duplicate tags that should be merged
2. Find orphaned tags (used only once)
3. Suggest tag hierarchy improvements
4. Recommend commonly used tag combinations
5. Check for inconsistent tag formatting
6. Propose new tag categories based on content themes

Provide actionable recommendations for tag system optimization.