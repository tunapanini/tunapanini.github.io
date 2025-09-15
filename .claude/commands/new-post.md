---
description: Create a new blog post with SEO optimization
argument-hint: [title]
---

# New Blog Post Creation

Create a new blog post with title: "$ARGUMENTS"

## Current Content Analysis
- Existing posts: !`ls -la content/posts/ | head -10`
- Recent post topics: !`grep -h "title:" content/posts/*.md 2>/dev/null | head -5`

## Requirements
1. Generate SEO-friendly filename from the title
2. Create comprehensive frontmatter with:
   - Auto-generated description based on title
   - Relevant tags by analyzing similar existing posts
   - Proper date formatting
   - Initial draft status
3. Include basic blog post structure
4. Suggest related internal links to existing content

Ensure the post follows the site's Korean language conventions and styling.