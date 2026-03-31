---
tags:
  - shellscript
  - Obsidian
date: 2024-08-04
title: 심볼릭 링크 만들기
---

# Unix 환경에서 심볼릭 링크 만들기

```sh
ln -s <source_file> <myfile>
```

# 활용

아래처럼 Obsidian 설정을 여러 Vault 간에 공유할 수 있습니다.

```sh
ln -s <absolute-path-to-your-vault>/.obsidian <absolute-path-to-your-vault>/.obsidian
```

> [!Note]
> 심볼릭 링크로 Obsidian 설정을 공유하는 방법은 모바일에서는 적용되지 않습니다.
> 다른 방법을 찾아야 합니다.

# 참고
- https://kb.iu.edu/d/abbe
