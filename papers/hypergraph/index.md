---
type: Index
title: 🕸️ 하이퍼그래프·하이퍼관계 (Hypergraph & Hyper-relational)
description: 2-노드 엣지를 넘어선 고차 관계를 다루는 2편 — HGNN(하이퍼엣지 스펙트럼 합성곱)과 StarE(한정자 포함 하이퍼관계 KG 메시지 패싱). 2편 모두 탑티어 학회 필독.
tags: [hypergraph, hyper-relational, high-order, qualifiers, must-read]
timestamp: 2026-06-19T00:00:00Z
---

# 🕸️ 하이퍼그래프·하이퍼관계 (Hypergraph & Hyper-relational)

[← 논문 모음](../index.md) · [번들 루트](../../index.md)

일반 그래프의 엣지는 **두 노드** 만 잇습니다. 이 카테고리는 그 한계를 넘어 **여러 객체를 동시에 묶는
고차 관계** 를 다룹니다. **이 카테고리는 2편 모두 ⭐ 필독입니다.**

> **범례**: ⭐ = 탑티어 AI 학회 게재 **필독(MUST-READ)**.

| ⭐ | 논문 | 연도/발표처 | 핵심 아이디어 | concept |
|:--:|------|------------|--------------|---------|
| ⭐ | HGNN | **AAAI 2019** | 하이퍼엣지(≥3노드) 스펙트럼 합성곱 | [hgnn.md](hgnn.md) |
| ⭐ | StarE | **EMNLP 2020** | 한정자(qualifier) 포함 하이퍼관계 KG 메시지 패싱 | [stare.md](stare.md) |

> **두 갈래**:
> - **하이퍼그래프(hypergraph)** — [HGNN](hgnn.md): 하나의 하이퍼엣지가 임의 개수 노드를 묶음(집합 관계).
> - **하이퍼관계(hyper-relational) KG** — [StarE](stare.md): 삼중항에 한정자(연도·장소 등)가 붙은 문장.
>   [CompGCN](../knowledge-graph/compgcn.md)을 확장하며 KG 흐름과 이어집니다.

---
[← 이전: 지식 그래프](../knowledge-graph/index.md) · [논문 모음 →](../index.md)
