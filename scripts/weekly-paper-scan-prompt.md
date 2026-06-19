---
type: Runbook
title: 주간 논문 스캔 — Routine 프롬프트
description: Claude Code Routine(주간 예약)이 매번 실행할 자기완결적 지시문. 그래프 표현학습/GNN 신규 논문을 서칭해 OKF 위키를 갱신하고 초안 PR을 연다.
tags: [automation, routine, weekly, prompt, runbook]
timestamp: 2026-06-19T00:00:00Z
---

# 주간 논문 스캔 — Routine 프롬프트 (자기완결 지시문)

> 이 문서는 **Claude Code Routine** 이 매주 실행할 지시문입니다. Routine 프롬프트 칸에는 아래
> "붙여넣을 프롬프트"만 넣고, 상세 규칙은 이 파일을 읽어 따르게 합니다.
> 설정 방법은 [automation-weekly-routine.md](../automation-weekly-routine.md) 참고.

---

## 🔖 Routine에 붙여넣을 프롬프트 (짧은 버전)

```
너는 이 저장소의 Graph Representation Learning(GNN) OKF 위키를 유지·관리한다.
저장소 루트의 CLAUDE.md 와 scripts/weekly-paper-scan-prompt.md 를 읽고 그 지시를
"정확히" 따른다. 오늘 날짜 기준으로 최근 1~2주의 신규 논문을 서칭해 위키를 갱신하고,
새 논문이 있으면 main 대상 draft PR을 연다. 새 논문이 없으면 아무 변경도 하지 말 것.
```

---

## 📋 상세 절차 (이 파일이 정의하는 규칙)

### 0. 기준 문서 준수
- 루트 **`CLAUDE.md`** 를 먼저 읽고 그 규칙을 따른다(OKF 작성 규칙 + ⭐ 등급은 **AI 분야** 학회·저널
  기준, OKF frontmatter, 상대링크, `(미확인)` 표기, log.md 기록 등).
- 본 번들의 범위는 **방법·표현학습 기반(아키텍처/학습 기법)** 논문이다. 특정 응용 도메인 전용 논문은
  대상이 아니다(필요하면 별도 번들).

### 1. 이미 수록된 논문 파악 (중복 방지)
- `papers/**/*.md` 의 frontmatter `resource:` 와 제목을 수집해 **이미 있는 arXiv ID/제목** 목록을 만든다.
  이 목록과 겹치는 논문은 **추가하지 않는다.**

### 2. 신규 논문 서칭 (WebSearch 사용)
- 오늘 날짜를 기준으로 **최근 1~2주** 에 공개/갱신된 논문을 우선한다. 아래 쿼리들을 실행
  (필요시 변형·추가). 네트워크 제약상 **WebSearch 위주**로, 개별 페이지 fetch가 막히면 검색 스니펫으로
  파악하고 불확실 항목은 `(미확인)` 처리:
  - `graph neural network arxiv <올해>`
  - `graph representation learning arxiv recent`
  - `graph transformer arxiv <이번 달>`
  - `knowledge graph embedding arxiv recent`
  - `heterogeneous graph neural network arxiv`
  - `hypergraph neural network arxiv`
  - `graph foundation model arxiv`
  - `self-supervised graph learning arxiv`
- **선별 기준**: ① 새로운 **방법·아키텍처·학습기법**(표현학습), ② 그래프 ML 핵심에 기여, ③ 위키에 아직 없음.
  셋 다 만족해야 추가. (단순 응용 사례는 보류.)

### 3. 신규 논문마다 concept 파일 생성 (OKF 형식)
- 알맞은 `papers/<카테고리>/` 에 `kebab-case.md` 생성. 새 주제군이면 폴더+`index.md` 신설 후
  [분류 체계](../concepts/taxonomy.md) 문서 갱신.
- frontmatter: `type: Research Paper`, `title`, `description`, `resource`(원문 링크), `tags`,
  `venue`, `year`, `timestamp`(오늘, ISO8601).
- 본문(한국어): **문제 → 방법 → 핵심 기여 → 결과·데이터셋 → 관련 링크**. 관련 [데이터셋](../datasets/index.md)·
  [개념](../concepts/index.md) 으로 상대링크 연결.
- **⭐ 등급(필독) 적용** — `CLAUDE.md` 의 **AI 분야 탑티어** 기준에 해당하면:
  1) H1 앞에 `⭐`, 2) 본문 상단 콜아웃 `> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **<VENUE>**`,
  3) frontmatter `must_read: true`, `venue_tier: top-tier conference`.
  (응용/도메인 전용 학회·저널은 🏅 보조 표기, ⭐ 아님. arXiv 프리프린트는 등급 보류.)

### 4. 색인·목록 갱신
- 해당 `papers/<카테고리>/index.md` 표에 행 추가(⭐면 ⭐ 표시).
- `papers/index.md` 연도별 표 + (⭐면) 필독 shortlist + 주제별 편수/⭐ 수 갱신.
- ⭐ 신규 추가 시 루트 `index.md` 의 ⭐ 카운트·shortlist 갱신.

### 5. 변경 이력
- `log.md` 상단에 `## <오늘 날짜> — 주간 스캔` 항목 추가: 추가한 논문 목록, `(미확인)` 항목 정리.

### 6. 검증 (커밋 전)
- 내부 상대링크 전부 resolve + 모든 concept frontmatter에 `type` 존재 + YAML 유효성 확인.

### 7. 커밋 & 초안 PR
- `claude/weekly-scan-<날짜>` 브랜치에 커밋(메시지는 영어, 추가 논문 요약).
- **main 대상 draft PR** 생성. 제목 예: `Weekly GNN paper scan (<날짜>)`.
- **새 논문이 0건이면 변경/PR 없이 종료**(빈 PR 금지).

### 8. 정확성 원칙
- 확인 안 된 저자·발표처·수치는 **날조 금지**, `(미확인)` 표기 + `log.md` 정리.
- 불확실하거나 대규모 구조 변경이 필요하면 PR 본문에 "검토 필요" 로 명시.

---
[← 번들 루트](../index.md) · [설정 가이드 →](../automation-weekly-routine.md)
