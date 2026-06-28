---
type: Dataset
title: Reddit / PPI
description: 귀납적(inductive) 노드 분류의 표준 벤치마크. Reddit은 대규모 게시물-커뮤니티 그래프, PPI는 여러 단백질 상호작용 그래프(그래프 간 일반화)를 다룸.
resource: https://snap.stanford.edu/graphsage/
tags: [dataset, inductive, node-classification, reddit, ppi, benchmark]
timestamp: 2026-06-19T00:00:00Z
---

# Reddit / PPI

[← 데이터셋 카탈로그](index.md)

## 개요
**귀납적(inductive) 노드 분류** 를 평가하기 위해 [GraphSAGE](../papers/foundations/graphsage.md) 가
대중화한 두 벤치마크. 학습에 없던 노드/그래프로의 일반화를 본다.

## Reddit
- 노드 = 게시물(post), 엣지 = 같은 사용자가 댓글을 단 두 게시물.
- 라벨 = 게시물이 속한 **커뮤니티(subreddit)**. 노드 특징 = 게시물 텍스트 임베딩 등.
- **대규모**(수십만 노드) → 이웃 샘플링·미니배치 학습의 필요성을 보여주는 대표 사례.

## PPI (Protein-Protein Interaction)
- **여러 개의 그래프**(서로 다른 인체 조직) — 일부 그래프로 학습하고 **완전히 새로운 그래프** 로 평가.
- 노드 = 단백질, 엣지 = 상호작용. **다중 라벨**(유전자 온톨로지 기능) → Micro-F1로 평가.
- 그래프 간 일반화를 직접 측정하는 전형적 귀납 설정.

## 특징
- **귀납 평가의 표준**: 학습 시 안 본 노드/그래프에 임베딩을 생성해야 함.
- [GraphSAGE](../papers/foundations/graphsage.md), [GAT](../papers/foundations/gat.md)(PPI),
  [node2vec](../papers/foundations/node2vec.md)(PPI) 등이 사용.

> ⚠️ **같은 "PPI"라도 사용 방식이 다름**:
> - **귀납적(다중 그래프)** — [GraphSAGE](../papers/foundations/graphsage.md)·[GAT](../papers/foundations/gat.md):
>   조직별 그래프 여러 개로 구성, 일부로 학습하고 **새 그래프** 로 평가(위 설명).
> - **전이적(단일 그래프)** — [node2vec](../papers/foundations/node2vec.md): 사람 단백질망을 **그래프 1개**
>   로 보고, 같은 그래프에서 **라벨만 분할** 해 다중 라벨 분류(전이적). 위 "다중 그래프" 설명은 node2vec엔 해당 안 됨.

## 이 데이터셋을 쓰는 논문
- [GraphSAGE](../papers/foundations/graphsage.md), [GAT](../papers/foundations/gat.md), [node2vec](../papers/foundations/node2vec.md)

> 관련 개념: [귀납 vs 전이](../concepts/overview.md) · [평가지표(Micro-F1)](../concepts/datasets-overview.md)

---
[← 데이터셋 카탈로그](index.md) · [소셜 임베딩: BlogCatalog →](blogcatalog.md)
