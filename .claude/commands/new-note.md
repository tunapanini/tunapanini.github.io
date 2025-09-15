---
description: Create a new note with intelligent tagging and categorization
argument-hint: [title]
---

# New Note Creation

Create a new note file with the title: "$ARGUMENTS"

## Context Analysis
- Current content structure: !`find content -type d -maxdepth 2`
- Existing tags analysis: !`grep -r "tags:" content --include="*.md" | cut -d: -f3- | tr ',' '\n' | tr -d '[]' | sort | uniq -c | sort -nr | head -10`

## Task
1. Analyze the existing content structure and tag patterns
2. Suggest appropriate category (notes/thoughts/daily) based on the title
3. Recommend relevant tags based on existing content
4. Create the note file with proper frontmatter
5. Include related note suggestions if any exist

Place the note in the most appropriate subdirectory and ensure proper metadata.