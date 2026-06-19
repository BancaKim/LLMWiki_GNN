---
type: Dashboard
title: 대시보드 (Dataview)
description: Obsidian + Dataview 플러그인에서 frontmatter로 논문을 동적으로 모아보는 생산성 대시보드.
tags: [dashboard, dataview, obsidian]
timestamp: 2026-06-19T00:00:00Z
---

# 📊 대시보드 (Dataview)

[← 번들 루트](index.md) · 세팅: [obsidian-setup.md](obsidian-setup.md)

> ℹ️ 아래 ` ```dataview ` 블록은 **Obsidian + [Dataview](https://github.com/blacksmithgu/obsidian-dataview)
> 플러그인** 에서 표/목록으로 **자동 렌더링** 됩니다. GitHub 웹에서는 코드로만 보입니다(정상).
> 우리 OKF frontmatter(`type`, `must_read`, `year`, `venue`, `tags`, `venue_tier`)를 그대로 활용합니다.

---

## ⭐ 필독 논문 (탑티어 AI 학회)

```dataview
TABLE WITHOUT ID
  link(file.link, title) AS "논문",
  venue AS "발표처",
  year AS "연도"
FROM "papers"
WHERE must_read = true
SORT year ASC, venue ASC
```

## 📅 전체 논문 — 연도순 (⭐ 표시)

```dataview
TABLE WITHOUT ID
  link(file.link, title) AS "논문",
  venue AS "발표처",
  year AS "연도",
  choice(must_read, "⭐", "") AS "필독"
FROM "papers"
WHERE type = "Research Paper"
SORT year ASC, must_read DESC
```

## 🗂️ 주제별 편수 / 필독 수

```dataview
TABLE WITHOUT ID
  rows.file.folder AS "폴더",
  length(rows) AS "편수",
  length(filter(rows, (r) => r.must_read = true)) AS "⭐ 필독"
FROM "papers"
WHERE type = "Research Paper"
GROUP BY file.folder
SORT length(rows) DESC
```

## 🔎 태그로 찾기 (예: knowledge-graph / attention / random-walk)

```dataview
LIST link(file.link, title)
FROM "papers"
WHERE contains(tags, "knowledge-graph")
SORT year ASC
```

> 위 쿼리의 `"knowledge-graph"` 를 `"attention"`, `"random-walk"`, `"heterogeneous"`,
> `"hypergraph"`, `"message-passing"` 등으로 바꾸면 해당 태그 논문만 모입니다.

## 🧪 데이터셋 카탈로그

```dataview
TABLE WITHOUT ID link(file.link, title) AS "데이터셋", description AS "설명"
FROM "datasets"
WHERE type = "Dataset"
SORT file.name ASC
```

---

## 📋 정적 요약 (GitHub에서도 보이는 백업본)

Dataview 없이도 볼 수 있도록 핵심만 정리합니다. (자동 갱신 아님)

**⭐ 필독 12편**: TransE(NeurIPS'13) · DeepWalk(KDD'14) · node2vec(KDD'16) · GCN(ICLR'17) ·
GraphSAGE(NeurIPS'17) · metapath2vec(KDD'17) · GAT(ICLR'18) · RotatE(ICLR'19) · HGNN(AAAI'19) ·
HGT(WWW'20) · CompGCN(ICLR'20) · StarE(EMNLP'20)
→ 전체 색인: [papers/index.md](papers/index.md)

---
[← 번들 루트](index.md) · [Obsidian 세팅 →](obsidian-setup.md)
