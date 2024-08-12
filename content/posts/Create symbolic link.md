---
tags:
  - shellscript
  - obsidian
date: 2024-08-04
title: 심볼릭 링크 만들기
---

# Unix 환경에서 심볼릭 링크 만들기

```sh
ln -s <source_file> <myfile>
```

# 활용

하면 아래처럼 옵시디언 설정도 공유 가능 🥱

```sh
ln -s <absolute-path-to-your-vault>/.obsidian <absolute-path-to-your-vault>/.obsidian
```

# References
- https://kb.iu.edu/d/abbe