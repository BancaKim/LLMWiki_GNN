---
type: Guide
title: 주간 자동 업데이트 설정 — Claude Code Routine
description: Claude Code의 Routine(예약 트리거)으로 매주 그래프 표현학습/GNN 신규 논문을 서칭해 위키를 갱신하고 초안 PR을 여는 방법.
tags: [guide, automation, routine, schedule, weekly]
timestamp: 2026-06-19T00:00:00Z
---

# 🤖 주간 자동 업데이트 — Claude Code Routine 설정

[← 번들 루트](index.md) · 실행 지시문: [scripts/weekly-paper-scan-prompt.md](scripts/weekly-paper-scan-prompt.md)

매주 한 번, 클라우드에서 새 세션이 떠서 **오늘 한 작업(서칭→OKF 갱신→초안 PR)** 을 반복합니다.
**구독으로 동작(API 키 불필요)**, [Routines](https://code.claude.com/docs/en/routines) 기능을 사용합니다.

> 🔬 Routines는 연구 프리뷰 기능입니다. Pro/Max/Team/Enterprise + Claude Code on the web 필요.

---

## ✅ 사전 준비 — 먼저 PR을 `main`에 머지

Routine은 저장소의 **기본 브랜치(`main`)** 를 클론해서 동작합니다. 지금 `main` 은 비어 있고,
위키·`CLAUDE.md`·실행 지시문은 작업 브랜치(`claude/gnn-research-knowledge-wuof6u`)에만 있습니다.
**→ 해당 PR을 `main` 에 머지한 뒤** Routine을 만드세요.
(머지 전에는 주간 실행이 빈 `main` 을 클론해 아무것도 못 합니다.)

---

## 설정 방법 A — CLI 한 줄 (`/schedule`)

Claude Code 터미널/세션에서:
```
/schedule weekly, 이 저장소(LLMWiki_GNN)에서 그래프 표현학습/GNN 신규 논문 주간 스캔
```
그러면 Claude가 웹 폼과 동일한 정보를 대화로 받습니다. **프롬프트** 칸에는 아래를 넣으세요:

```
너는 이 저장소의 Graph Representation Learning(GNN) OKF 위키를 유지·관리한다.
저장소 루트의 CLAUDE.md 와 scripts/weekly-paper-scan-prompt.md 를 읽고 그 지시를
"정확히" 따른다. 오늘 날짜 기준 최근 1~2주의 신규 논문을 서칭해 위키를 갱신하고,
새 논문이 있으면 main 대상 draft PR을 연다. 새 논문이 없으면 아무 변경도 하지 말 것.
```

- **Repository**: `BancaKim/LLMWiki_GNN`
- **Schedule**: `weekly` (원하는 요일/시간 — 로컬 시간 입력, 자동 UTC 변환)
- 관리: `/schedule list`(목록) · `/schedule update`(수정, 커스텀 cron) · `/schedule run`(즉시 실행)

> `/schedule` 가 "Unknown command" 면: claude.ai 구독 로그인 상태여야 하며
> 셸에 `ANTHROPIC_API_KEY`/`ANTHROPIC_AUTH_TOKEN` 이 있으면 제거, CLI를 최신으로 업데이트.

---

## 설정 방법 B — 웹 UI

1. [claude.ai/code/routines](https://claude.ai/code/routines) → **New routine**.
2. **이름**: `GNN Weekly Paper Scan` / **프롬프트**: 위 프롬프트 붙여넣기 + 모델 선택.
3. **Repositories**: `BancaKim/LLMWiki_GNN` 추가.
4. **Environment**: **Default**(Trusted 네트워크)면 충분 — WebSearch는 Anthropic 경유라 동작.
   (개별 사이트 fetch까지 필요하면 환경을 **Custom/Full** 로 바꿔 도메인 허용.)
5. **Select a trigger** → **Schedule** → **Weekly** + 요일/시간.
6. **Permissions**: 기본값 유지(`claude/` 브랜치만 푸시 → 안전). 초안 PR로 검토 후 머지.
7. **Create** → 상세 페이지에서 **Run now** 로 1회 시험 실행.

---

## 동작 방식 & 검토

- 매주 새 **세션**이 생성되어 실행됩니다. 결과는 세션에서 확인하고, **초안 PR** 로 변경을 리뷰→머지.
- 새 논문이 없으면 PR을 만들지 않습니다(불필요한 알림 없음).
- 커밋·PR은 **연결된 GitHub 계정(=본인)** 으로 표시됩니다.
- 사용량: 일반 세션처럼 구독 사용량 차감 + 계정별 일일 routine 실행 상한 있음.

## 운영 팁
- 실행 규칙을 바꾸려면 [scripts/weekly-paper-scan-prompt.md](scripts/weekly-paper-scan-prompt.md)
  를 수정·머지하면 다음 주부터 자동 반영(프롬프트가 이 파일을 읽으므로).
- "green" 상태는 인프라 성공일 뿐 작업 성공이 아닙니다. 첫 몇 주는 PR 내용을 직접 확인하세요.
- 주간이 과하면 `/schedule update` 로 격주/월간 cron 으로 조정(최소 간격 1시간).

---
[← 번들 루트](index.md) · [실행 지시문 →](scripts/weekly-paper-scan-prompt.md)
