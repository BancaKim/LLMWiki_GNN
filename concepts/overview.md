---
type: Concept
title: 개요 — 그래프 표현학습이란
description: 그래프 표현학습의 큰 그림 — 왜 그래프인가, 랜덤워크 임베딩에서 메시지 패싱 GNN으로, 그리고 이종/KG/하이퍼그래프 확장으로 이어지는 흐름.
tags: [overview, graph-representation-learning, message-passing, transductive, inductive]
timestamp: 2026-06-19T00:00:00Z
---

# 개요 — 그래프 표현학습이란

[← 개념 목록](index.md) · [번들 루트](../index.md)

## 1. 왜 그래프 표현학습인가

세상의 많은 데이터는 **관계(그래프)** 다 — 소셜 네트워크, 인용망, 분자, 추천(사용자–상품), 지식그래프.
머신러닝 모델은 보통 **고정 길이 벡터** 를 입력으로 받는데, 그래프는 크기·연결이 제각각이라 그대로 넣기
어렵다. **그래프 표현학습(graph representation learning)** 은 노드/엣지/그래프를 **저차원 벡터(embedding)**
로 바꿔, 분류·링크 예측·클러스터링 같은 다운스트림 과제에 쓰게 한다.

## 2. 두 가지 패러다임

### ① 랜덤워크 기반 임베딩 (얕은, shallow)
그래프 위를 **랜덤워크** 로 걸으며 노드 시퀀스를 만들고, 이를 "문장"처럼 보아 NLP의 **SkipGram(word2vec)**
으로 임베딩을 학습한다.
- [DeepWalk](../papers/foundations/deepwalk.md) — 균일 랜덤워크.
- [node2vec](../papers/foundations/node2vec.md) — 편향(p,q) 랜덤워크로 BFS/DFS 보간.
- 특징: 노드별 임베딩을 **직접** 학습(룩업 테이블) → 단순하지만 **새 노드/노드 특징(feature)** 활용이 어렵다.

### ② 메시지 패싱 GNN (깊은, deep)
각 노드가 **이웃의 정보를 집계(aggregate)** 해 자신의 표현을 갱신한다. L번 반복하면 **L-홉 이웃** 의 구조·
특징이 한 노드에 응축된다.

> h_v^(l+1) = UPDATE( h_v^(l),  AGGREGATE( { h_u^(l) : u ∈ N(v) } ) )

- [GCN](../papers/foundations/gcn.md) — 차수 정규화 평균 집계(스펙트럼 1차 근사).
- [GraphSAGE](../papers/foundations/graphsage.md) — 이웃 샘플링 + 학습형 집계(mean/LSTM/pool).
- [GAT](../papers/foundations/gat.md) — 어텐션으로 이웃 가중 학습.
- 특징: **노드 특징** 을 함께 쓰고, end-to-end 학습이 가능.

## 3. 전이학습 vs 귀납학습 (Transductive vs Inductive)

| 구분 | 의미 | 예시 |
|------|------|------|
| **전이적(Transductive)** | 학습 시 본 그래프의 노드만 예측. 새 노드엔 임베딩이 없음 | [DeepWalk](../papers/foundations/deepwalk.md), [node2vec](../papers/foundations/node2vec.md), [GCN](../papers/foundations/gcn.md)(원형) |
| **귀납적(Inductive)** | 학습에 없던 새 노드·새 그래프에도 표현 생성 | [GraphSAGE](../papers/foundations/graphsage.md), [GAT](../papers/foundations/gat.md) |

실제 시스템(계속 새 사용자/상품이 추가)에는 **귀납적** 모델이 필요하다 → [GraphSAGE](../papers/foundations/graphsage.md)의 동기.

## 4. 현실 그래프로의 3대 확장

기초 모델은 대개 **단일 타입 노드 + 단일 타입 엣지(동질, homogeneous)** 를 가정한다. 현실은 더 복잡하다.

### ① 이종 그래프 (Heterogeneous)
노드·엣지가 **여러 타입**(저자–논문–학회 등). → [metapath2vec](../papers/heterogeneous/metapath2vec.md)(메타패스),
[HGT](../papers/heterogeneous/hgt.md)(메타관계 어텐션).

### ② 지식 그래프 (Knowledge Graph, 다관계)
**(head, relation, tail)** 삼중항 + **수백~수천 관계**. 관계의 기하(이동/회전)를 모델링하거나
([TransE](../papers/knowledge-graph/transe.md), [RotatE](../papers/knowledge-graph/rotate.md)), 메시지
패싱을 다관계로 확장한다([R-GCN](../papers/knowledge-graph/rgcn.md), [CompGCN](../papers/knowledge-graph/compgcn.md)).

### ③ 고차 관계 (Hypergraph / Hyper-relational)
엣지가 **두 노드를 넘어선다**. 하나의 하이퍼엣지가 여러 노드를 묶거나([HGNN](../papers/hypergraph/hgnn.md)),
삼중항에 **한정자(qualifier)** 가 붙는다([StarE](../papers/hypergraph/stare.md)).

## 5. 공통 다운스트림 과제

- **노드 분류(node classification)** — 노드 라벨 예측 (Cora/Reddit 등).
- **링크 예측(link prediction)** — 엣지/삼중항 존재 예측 (KG 완성 등).
- **그래프 분류(graph classification)** — 그래프 전체 라벨 (분자 등).
- **클러스터링·검색** — 임베딩 공간에서의 유사도.

자세한 용어는 [용어집](glossary.md), 연구 축은 [분류 체계](taxonomy.md) 참고.

---
[← 개념 목록](index.md) · [다음: 분류 체계 →](taxonomy.md)
