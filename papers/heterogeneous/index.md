---
type: Index
title: 🔀 이종 그래프 (Heterogeneous Graphs)
description: 여러 타입의 노드·엣지를 갖는 이종 그래프 표현학습 3편 — metapath2vec(메타패스 랜덤워크), HAN(2단계 어텐션), HGT(메타관계 트랜스포머). 3편 모두 탑티어 학회 필독.
tags: [heterogeneous, meta-path, meta-relation, attention, graph-transformer, must-read]
timestamp: 2026-09-28T00:00:00Z
---

# 🔀 이종 그래프 (Heterogeneous Graphs)

[← 논문 모음](../index.md) · [번들 루트](../../index.md)

현실 그래프는 **여러 타입의 노드·엣지**(저자–논문–학회, 사용자–상품–카테고리 등)를 갖습니다. 동질 그래프
방법([DeepWalk](../foundations/deepwalk.md)/[GCN](../foundations/gcn.md))을 **타입 인지(type-aware)** 로
확장하는 흐름입니다. **이 카테고리는 3편 모두 ⭐ 필독입니다.**

> **범례**: ⭐ = 탑티어 AI 학회 게재 **필독(MUST-READ)**.

| ⭐ | 논문 | 연도/발표처 | 핵심 아이디어 | concept |
|:--:|------|------------|--------------|---------|
| ⭐ | metapath2vec | **KDD 2017** | 메타패스 랜덤워크 + 이종 SkipGram | [metapath2vec.md](metapath2vec.md) |
| ⭐ | HAN | **WWW 2019** | 노드+의미 2단계 어텐션 | [han.md](han.md) |
| ⭐ | HGT | **WWW 2020** | 메타관계별 어텐션 + 시간 인코딩(RTE) | [hgt.md](hgt.md) |

> **흐름**: [metapath2vec](metapath2vec.md)(수작업 메타패스·얕은 임베딩) → [HAN](han.md)(메타패스 + 2단계
> 어텐션 GNN) → [HGT](hgt.md)(메타관계 자동 학습·대규모 샘플링).
> 관련 데이터셋: [DBLP/AMiner](../../datasets/dblp-aminer.md)

---
[← 이전: 기초](../foundations/index.md) · [다음: 지식 그래프 →](../knowledge-graph/index.md)
