# CLAUDE.md

이 파일은 tunapanini.github.io 저장소에서 작업할 때 Claude Code (claude.ai/code)에게 가이드를 제공합니다.

## 프로젝트 개요

이 저장소는 Quartz v4를 사용하여 구축된 개인 디지털 정원입니다. Quartz는 마크다운 파일을 정적 웹사이트로 변환하는 도구로, 특히 Obsidian과 같은 도구에서 작성된 노트를 웹 사이트로 게시하는 데 최적화되어 있습니다.

## 핵심 명령어

### Makefile 기반 명령어
```bash
make sync        # 컨텐츠 동기화 및 GitHub 배포
make serve       # 개발 서버 실행
make build       # 사이트 빌드
make check       # 코드 품질 검사
make dev         # 개발 워크플로우 (check + build + serve)
make quick-sync  # 빠른 동기화 (format + build + sync)
make help        # 사용 가능한 명령어 목록
```

### 직접 명령어
```bash
npx quartz build --serve  # 개발 서버 실행
npx quartz build         # 사이트 빌드
npx quartz sync          # GitHub 동기화
npm run check           # TypeScript 타입 검사 + Prettier 포맷 검사
npm run format          # Prettier로 코드 포맷 수정
npm test                # 테스트 실행
npm run docs            # docs 디렉토리를 빌드하고 서빙
```

### Claude Code Slash Commands
프로젝트에는 다음 slash command들이 설정되어 있습니다:
- `/new-note [title]` - 지능적 태깅과 분류로 새 노트 생성
- `/new-post [title]` - SEO 최적화된 새 블로그 포스트 생성
- `/preview` - 개발 서버 시작 및 변경사항 모니터링
- `/tag-audit` - 태그 시스템 분석 및 최적화 제안
- `/sync` - Makefile을 사용한 컨텐츠 동기화

## 아키텍처 및 구조

### 핵심 구성 요소

**quartz.config.ts**: Quartz의 메인 설정 파일로, 플러그인 설정, 테마, 언어, 분석 도구 등을 구성합니다.
- 한국어 로케일(`ko-KR`) 설정
- Google Analytics 통합
- Noto Sans Korean 폰트 사용
- 라이트/다크 모드 커스텀 색상 설정

**quartz.layout.ts**: 페이지 레이아웃 구성 파일로, 컴포넌트 배치를 정의합니다.
- `sharedPageComponents`: 모든 페이지에서 공유되는 컴포넌트 (헤더, 푸터, 댓글 등)
- `defaultContentPageLayout`: 단일 페이지 레이아웃 (노트 페이지)
- `defaultListPageLayout`: 목록 페이지 레이아웃 (태그, 폴더 페이지)

### 디렉토리 구조

**content/**: 마크다운 컨텐츠 파일들
- `index.md`: 메인 페이지
- `posts/`: 블로그 게시글
- `notes/`: 노트 파일들
- `thoughts/`: 생각과 아이디어
- `daily/`: 일일 노트
- `templates/`: 템플릿 파일들
- `attachments/`: 첨부 파일들 (이미지 등)

**quartz/**: Quartz 프레임워크 코드
- `plugins/`: 변환, 필터, 방출기 플러그인들
  - `transformers/`: 마크다운 변환 플러그인
  - `filters/`: 컨텐츠 필터링 플러그인
  - `emitters/`: 최종 파일 방출 플러그인
- `components/`: React(Preact) 컴포넌트들
- `processors/`: 컨텐츠 처리 로직
- `build.ts`: 빌드 프로세스 메인 파일

### 플러그인 시스템

Quartz는 3단계 플러그인 파이프라인을 사용합니다:

1. **Transformers**: 마크다운 파일을 처리하고 메타데이터를 추출
   - `FrontMatter()`: YAML front matter 처리
   - `ObsidianFlavoredMarkdown()`: Obsidian 스타일 마크다운 지원
   - `SyntaxHighlighting()`: 코드 하이라이팅

2. **Filters**: 컨텐츠 필터링
   - `RemoveDrafts()`: 드래프트 파일 제외

3. **Emitters**: 최종 HTML 파일 생성
   - `ContentPage()`: 개별 컨텐츠 페이지
   - `TagPage()`: 태그 페이지
   - `ContentIndex()`: 사이트맵과 RSS 피드

### Giscus 댓글 시스템

`quartz.layout.ts`에서 Giscus를 통한 GitHub Discussion 기반 댓글 시스템이 구성되어 있습니다:
- Repository: `tunapanini/tunapanini.github.io`
- Category: "Announcements"
- URL 기반 매핑

## 배포 프로세스

### GitHub Actions
- **메인 브랜치**: `v4`
- **배포 트리거**: `v4` 브랜치에 푸시 시 자동 배포
- **배포 대상**: GitHub Pages
- **빌드 아티팩트**: `public/` 디렉토리

### CI/CD 파이프라인
1. `npm ci`: 의존성 설치
2. `npx quartz build`: 사이트 빌드
3. GitHub Pages 배포

## 특수 설정

### 무시 패턴
`quartz.config.ts`의 `ignorePatterns`에 정의:
- `private/`: 비공개 파일
- `templates/`: 템플릿 파일
- `.obsidian/`: Obsidian 설정 파일
- `_*`: 언더스코어로 시작하는 파일

### 날짜 처리
`defaultDateType: "modified"`로 설정되어, Git 수정 날짜를 우선 사용합니다.

### 한국어 지원
- 로케일: `ko-KR`
- 폰트: Noto Sans Korean
- 별칭 지원: 메인 페이지에 `홈` 별칭 설정

## 개발 시 주의사항

- 모든 컨텐츠 파일은 `content/` 디렉토리에 작성
- 이미지는 `content/attachments/`에 저장
- Obsidian 링크 문법 `[[]]` 사용 가능
- 프론트매터에서 `draft: true` 설정 시 빌드에서 제외
- TypeScript와 Preact 기반으로 컴포넌트 개발 가능