---
type: Guide
title: Obsidian로 보기 — iPad · iPhone · MacBook 동기화 가이드
description: GitHub에 저장된 이 OKF 위키를 Obsidian으로 열어 굿노트처럼 모든 Apple 기기에서 보고 편집하는 방법.
tags: [guide, obsidian, sync, icloud, working-copy, apple]
timestamp: 2026-06-19T00:00:00Z
---

# 📱💻 Obsidian로 보기 — iPad · iPhone · MacBook 동기화 가이드

[← 번들 루트](index.md)

이 위키는 **마크다운 폴더 + 상대링크 + frontmatter** 구조라 **[Obsidian](https://obsidian.md)** 으로
열면 그래프뷰·백링크·검색·태그가 그대로 작동합니다. Obsidian은 **macOS · iPadOS · iOS** 네이티브 앱이
있어서, 동기화만 정하면 **굿노트처럼 모든 Apple 기기에서** 보고 편집할 수 있습니다.

> 핵심: **GitHub = 원본/백업소**, **Obsidian = 보기·편집**, **동기화 방식 = 아래 3가지 중 택1**.

---

## 🔁 동기화 방식 고르기 (셋 중 하나)

| 방식 | 비용 | 굿노트 느낌 | GitHub 연동 | 추천 대상 |
|------|------|:----------:|:-----------:|-----------|
| **A. iCloud Drive 보관소** | 무료 | ★★★ | 맥에서 git push | **대부분에게 추천** |
| **B. Obsidian Sync** | 유료(월 구독) | ★★★★ | 맥에서 git push | 설정 0, 가장 매끄럽게 |
| **C. Working Copy(iOS)+git** | Working Copy 1회 결제 | ★★ | 모든 기기 git | GitHub를 단일 원본으로 |

---

## 방식 A — iCloud Drive 보관소 (무료, 추천) ⭐

iCloud가 굿노트처럼 기기 간 자동 동기화를 해 주고, **GitHub 백업은 맥에서** 합니다.

### ⚡ 빠른 시작 — 맥에서 한 줄 실행 (자동 클론)
터미널에 붙여넣기:
```bash
curl -fsSL https://raw.githubusercontent.com/BancaKim/LLMWiki_GNN/claude/gnn-research-knowledge-wuof6u/scripts/setup-mac.command | bash
```
또는 저장소를 이미 받았다면 `scripts/setup-mac.command` 를 **더블클릭**.
→ iCloud Obsidian 폴더로 클론하고 보관소 열기를 시도합니다. 이후 [추천 플러그인](#-추천-플러그인)만 설치하면 끝.

> 수동으로 하려면 아래 단계대로 진행하세요.

### 1) MacBook (최초 1회)
1. [Obsidian](https://obsidian.md) 설치.
2. 저장소를 **iCloud Drive 안에** 클론:
   ```bash
   git clone https://github.com/BancaKim/LLMWiki_GNN.git \
     ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/LLMWiki_GNN
   ```
   (또는 `~/Library/Mobile Documents/com~apple~CloudDocs/LLMWiki_GNN` 등 iCloud Drive 경로)
3. Obsidian → **Open folder as vault** → 위 폴더 선택.
4. 커뮤니티 플러그인 설치(아래 [추천 플러그인](#-추천-플러그인)).
5. **GitHub 백업**: 맥에서 **Obsidian Git** 플러그인으로 자동 commit/push 하거나, 터미널에서 주기적으로
   `git add -A && git commit -m "update" && git push`.

### 2) iPad / iPhone
1. App Store에서 **Obsidian** 설치.
2. Obsidian → **"Open folder as vault"** → iCloud Drive의 `LLMWiki_GNN` 폴더 선택.
   (iCloud가 이미 동기화해 둠 — 굿노트처럼 바로 보임.)
3. 끝. 어디서 편집해도 iCloud로 즉시 동기화됩니다.

> ⚠️ 모바일에서는 **git 동기화를 켜지 마세요.** GitHub 푸시는 **맥에서만** 하면 충돌이 없습니다.
> (iCloud = 기기 간 실시간 / GitHub = 맥에서 스냅샷 백업)

---

## 방식 B — Obsidian Sync (유료, 가장 매끄러움)

git을 전혀 몰라도 됩니다. 가장 굿노트에 가깝습니다.
1. 세 기기 모두 Obsidian 설치 → **Obsidian Sync** 구독 → 같은 보관소 연결.
2. Mac/iPad/iPhone 간 **암호화 실시간 동기화**.
3. GitHub 백업이 필요하면 **맥에서만** Obsidian Git으로 가끔 push.

---

## 방식 C — Working Copy + git (모든 기기 GitHub 직결)

GitHub를 **유일한 원본**으로 두고 싶을 때. iOS는 손이 조금 더 갑니다.
1. **Mac**: 방식 A의 맥 단계 + Obsidian Git 자동 push.
2. **iPad/iPhone**: [**Working Copy**](https://workingcopy.app) 앱으로 저장소 clone →
   Files 앱으로 노출 → 그 폴더를 Obsidian 보관소로 열기. 편집 후 Working Copy에서 **pull/push**.
   - 자세한 연동: Working Copy 문서의 "Obsidian" 안내 참고.
   - 장점: 모든 기기가 GitHub와 직접 동기화 / 단점: 모바일에서 수동 pull·push.

---

## 🧩 추천 플러그인 (Settings → Community plugins)

| 플러그인 | 용도 |
|----------|------|
| **Dataview** | frontmatter(`must_read`, `year`, `venue`, `tags`)로 **동적 목록** 생성 → [dashboard.md](dashboard.md) 가 바로 작동 |
| **Obsidian Git** | (맥 권장) 자동 commit/pull/push 로 GitHub 동기화 |

### 코어 기능(설정에서 켜기)
- **Graph view** — 논문↔데이터셋↔개념 연결을 시각화 (우리 위키의 상대링크가 그래프로 보임)
- **Backlinks / Outgoing links** — 어떤 문서가 이 논문을 참조하는지
- **Search / Tags** — frontmatter `tags` 로 필터

> 우리 위키는 표준 마크다운 링크(`[..](..md)`)를 써서 **그래프뷰·백링크가 그대로** 잡힙니다.
> OKF frontmatter 덕분에 **Dataview 쿼리**가 바로 동작합니다 → [대시보드](dashboard.md) 참고.

---

## ✅ 한눈 요약

- **그냥 무료로 굿노트처럼** → **방식 A (iCloud)**. 맥에서 클론·푸시, 아이패드/아이폰은 iCloud로 자동.
- **돈 내고 제일 편하게** → **방식 B (Obsidian Sync)**.
- **GitHub를 모든 기기에서 직접** → **방식 C (Working Copy)**.
- 어느 방식이든 **첫 화면**은 [`index.md`](index.md), 생산성 노트는 [`dashboard.md`](dashboard.md).

---
[← 번들 루트](index.md) · [대시보드 →](dashboard.md)
