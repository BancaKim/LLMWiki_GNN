---
type: Index
title: 🌀 그래프 트랜스포머 (Graph Transformer)
description: 메시지 패싱의 한계(장거리 의존성·오버스무딩)를 어텐션으로 넘어서는 그래프 트랜스포머 2편 — Graphormer(구조 인코딩)와 GraphGPS(국소+전역 하이브리드·선형 확장). 2편 모두 탑티어 학회 필독.
tags: [graph-transformer, attention, positional-encoding, scalability, must-read]
timestamp: 2026-06-30T00:00:00Z
---

# 🌀 그래프 트랜스포머 (Graph Transformer)

[← 논문 모음](../index.md) · [번들 루트](../../index.md)

메시지 패싱([GCN](../foundations/gcn.md)/[GAT](../foundations/gat.md))은 **장거리 의존성** 과 **오버스무딩**
에 약하다. 그래프 트랜스포머는 **(준)전역 어텐션** 으로 이 한계를 넘되, 문제는 "어텐션이 그래프 **구조**
를 어떻게 알게 하느냐"와 "$O(N^2)$ 를 어떻게 줄이느냐"였다. **이 카테고리는 2편 모두 ⭐ 필독입니다.**

> **범례**: ⭐ = 탑티어 AI 학회 게재 **필독(MUST-READ)**.

| ⭐ | 논문 | 연도/발표처 | 핵심 아이디어 | concept |
|:--:|------|------------|--------------|---------|
| ⭐ | Graphormer | **NeurIPS 2021** | 어텐션 bias로 구조 주입(centrality·spatial·edge) | [graphormer.md](graphormer.md) |
| ⭐ | GraphGPS | **NeurIPS 2022** | 국소 MPNN + 전역 어텐션 하이브리드, 선형 O(N+E) | [graphgps.md](graphgps.md) |

> **흐름**: [Graphormer](graphormer.md)(구조 인코딩으로 "트랜스포머도 그래프에서 SOTA" 입증) →
> [GraphGPS](graphgps.md)(하이브리드·선형화로 **일반·확장** 레시피). 표현력 배경은 [GIN](../foundations/gin.md),
> 이종판은 [HGT](../heterogeneous/hgt.md). 관련 데이터셋: [OGB](../../datasets/ogb.md).

---
[← 이전: 하이퍼그래프](../hypergraph/index.md) · [논문 모음 →](../index.md)
