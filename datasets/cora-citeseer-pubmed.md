---
type: Dataset
title: Cora / Citeseer / Pubmed
description: 인용 네트워크(논문=노드, 인용=엣지) 3종. 전이적 준지도 노드 분류의 사실상 표준 벤치마크로 GCN·GAT 등이 평가에 사용.
resource: https://relational.fit.cvut.cz/dataset/CORA
tags: [dataset, citation-network, node-classification, transductive, benchmark]
timestamp: 2026-06-19T00:00:00Z
---

# Cora / Citeseer / Pubmed

[← 데이터셋 카탈로그](index.md)

## 개요
세 개의 **인용 네트워크(citation network)**. 노드 = 논문, 엣지 = 인용 관계, 노드 특징 = 단어
(bag-of-words / TF-IDF) 벡터, 라벨 = 논문 주제(분야). **전이적(transductive) 준지도 노드 분류** 의
사실상 표준 벤치마크로, [GCN](../papers/foundations/gcn.md)·[GAT](../papers/foundations/gat.md) 등
거의 모든 GNN 논문이 비교에 쓴다.

## 규모 (대략)
| 데이터셋 | 노드(논문) | 엣지(인용) | 클래스 | 특징 차원 |
|----------|:----------:|:---------:|:------:|:---------:|
| **Cora** | 2,708 | ~5,429 | 7 | 1,433 |
| **Citeseer** | 3,327 | ~4,732 | 6 | 3,703 |
| **Pubmed** | 19,717 | ~44,338 | 3 | 500 (TF-IDF) |

> 수치는 가장 널리 쓰이는 표준 분할 기준의 근사값입니다 *(세부 분할·전처리에 따라 약간 다를 수 있음)*.

## 특징
- **준지도 설정**: 클래스당 소수(예: 20개) 노드만 라벨로 사용하고 나머지를 예측.
- **강한 동질성(homophily)**: 인용으로 이어진 논문은 주제가 비슷한 경향 → 기본 GNN 가정에 부합.
- 작고 표준화되어 **빠른 비교·재현** 에 적합.

## 이 데이터셋을 쓰는 논문
- [GCN](../papers/foundations/gcn.md), [GAT](../papers/foundations/gat.md), [HGNN](../papers/hypergraph/hgnn.md)

> 관련 개념: [전이 vs 귀납](../concepts/overview.md) · [평가지표](../concepts/datasets-overview.md)

---
[← 데이터셋 카탈로그](index.md) · [귀납 벤치마크: Reddit/PPI →](reddit-ppi.md)
