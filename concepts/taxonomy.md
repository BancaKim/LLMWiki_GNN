---
type: Concept
title: 분류 체계 (Taxonomy)
description: 그래프 표현학습 연구를 나누는 축 — 주제 카테고리, 학습 패러다임, 그래프 구조, 핵심 기법, 다운스트림 과제.
tags: [taxonomy, classification, gnn, graph-representation-learning]
timestamp: 2026-06-19T00:00:00Z
---

# 분류 체계 (Taxonomy)

[← 개념 목록](index.md) · [번들 루트](../index.md)

## 1차 축 — 주제별 카테고리 (이 번들의 디렉터리 구조)

```
Graph Representation Learning
├── 📐 기초                   랜덤워크 임베딩 + 메시지 패싱 GNN 백본 + 표현력(GIN)
├── 🔀 이종 그래프            여러 타입 노드·엣지 (type-aware)
├── 🔗 지식 그래프            (h, r, t) 삼중항 + 다관계
├── 🕸️ 하이퍼그래프·하이퍼관계  2-노드 엣지를 넘어선 고차 관계
└── 🌀 그래프 트랜스포머        메시지 패싱을 넘는 (준)전역 어텐션
```
→ [papers/index.md](../papers/index.md) 에서 각 카테고리로 이동.

## 보조 축 1 — 학습 패러다임

| 패러다임 | 설명 | 예시 |
|----------|------|------|
| 얕은 임베딩(shallow) | 노드별 임베딩을 룩업 테이블로 직접 학습 | [DeepWalk](../papers/foundations/deepwalk.md), [node2vec](../papers/foundations/node2vec.md), [TransE](../papers/knowledge-graph/transe.md), [RotatE](../papers/knowledge-graph/rotate.md) |
| 메시지 패싱 GNN(deep) | 이웃 집계로 표현 생성, 노드 특징 활용 | [GCN](../papers/foundations/gcn.md), [GraphSAGE](../papers/foundations/graphsage.md), [GAT](../papers/foundations/gat.md), [R-GCN](../papers/knowledge-graph/rgcn.md), [CompGCN](../papers/knowledge-graph/compgcn.md) |
| 전이적(transductive) | 학습 그래프 노드만 예측 | DeepWalk, node2vec, GCN(원형) |
| 귀납적(inductive) | 새 노드/그래프에 일반화 | [GraphSAGE](../papers/foundations/graphsage.md), [GAT](../papers/foundations/gat.md) |
| 비지도/자기지도 | 라벨 없이 임베딩 학습 | DeepWalk, node2vec, GraphSAGE(비지도 손실) |

## 보조 축 2 — 그래프 구조

| 구조 | 설명 | 예시 |
|------|------|------|
| 동질 (Homogeneous) | 단일 노드·엣지 타입 | [GCN](../papers/foundations/gcn.md), [GAT](../papers/foundations/gat.md) |
| 이종 (Heterogeneous) | 다중 노드·엣지 타입 | [metapath2vec](../papers/heterogeneous/metapath2vec.md), [HGT](../papers/heterogeneous/hgt.md) |
| 다관계 (Multi-relational) | 여러 관계 유형(KG) | [R-GCN](../papers/knowledge-graph/rgcn.md), [CompGCN](../papers/knowledge-graph/compgcn.md) |
| 하이퍼그래프 (Hypergraph) | 하이퍼엣지가 ≥3 노드 연결 | [HGNN](../papers/hypergraph/hgnn.md) |
| 하이퍼관계 (Hyper-relational) | 삼중항 + 한정자(qualifier) | [StarE](../papers/hypergraph/stare.md) |
| 동적/시간 (Dynamic/Temporal) | 시간에 따라 변함 | [HGT](../papers/heterogeneous/hgt.md)(RTE) |

## 보조 축 3 — 핵심 기법

| 기법 | 핵심 아이디어 | 예시 |
|------|---------------|------|
| 랜덤워크 + SkipGram | 워크=문장, word2vec 적용 | [DeepWalk](../papers/foundations/deepwalk.md), [node2vec](../papers/foundations/node2vec.md), [metapath2vec](../papers/heterogeneous/metapath2vec.md) |
| 스펙트럼 합성곱 | 그래프 라플라시안 필터 | [GCN](../papers/foundations/gcn.md), [HGNN](../papers/hypergraph/hgnn.md) |
| 샘플 + 집계 | 이웃 샘플링·집계 함수 | [GraphSAGE](../papers/foundations/graphsage.md), [HGT](../papers/heterogeneous/hgt.md)(HGSampling) |
| 어텐션 | 이웃·타입별 가중 학습 | [GAT](../papers/foundations/gat.md), [HGT](../papers/heterogeneous/hgt.md) |
| 관계 기하 모델링 | 이동/회전 등 거리 스코어 | [TransE](../papers/knowledge-graph/transe.md), [RotatE](../papers/knowledge-graph/rotate.md) |
| 합성(composition) | 노드·관계 결합 메시지 | [CompGCN](../papers/knowledge-graph/compgcn.md), [StarE](../papers/hypergraph/stare.md) |
| 단사 집계(표현력) | sum+MLP로 1-WL 도달 | [GIN](../papers/foundations/gin.md) |
| (준)전역 어텐션 | 구조 인코딩·국소+전역 하이브리드 | [Graphormer](../papers/graph-transformer/graphormer.md), [GraphGPS](../papers/graph-transformer/graphgps.md) |

## 보조 축 4 — 다운스트림 과제

노드 분류 · 링크 예측(KG 완성) · 그래프 분류 · 클러스터링 · 추천 · 검색.

## 카테고리 vs. 보조축 매핑 (대표 논문)

| 논문 | 주제 | 학습 | 구조 | 핵심기법 |
|------|------|------|------|----------|
| [DeepWalk](../papers/foundations/deepwalk.md) | 기초 | 얕은·전이 | 동질 | 랜덤워크+SkipGram |
| [node2vec](../papers/foundations/node2vec.md) | 기초 | 얕은·전이 | 동질 | 편향 랜덤워크 |
| [GCN](../papers/foundations/gcn.md) | 기초 | GNN·전이 | 동질 | 스펙트럼 합성곱 |
| [GraphSAGE](../papers/foundations/graphsage.md) | 기초 | GNN·귀납 | 동질 | 샘플+집계 |
| [GAT](../papers/foundations/gat.md) | 기초 | GNN·귀납 | 동질 | 어텐션 |
| [GIN](../papers/foundations/gin.md) | 기초 | GNN | 동질 | 단사 집계(sum+MLP) |
| [metapath2vec](../papers/heterogeneous/metapath2vec.md) | 이종 | 얕은 | 이종 | 메타패스 워크 |
| [HGT](../papers/heterogeneous/hgt.md) | 이종 | GNN·귀납 | 이종·시간 | 메타관계 어텐션 |
| [TransE](../papers/knowledge-graph/transe.md) | KG | 얕은 | 다관계 | 평행이동 |
| [RotatE](../papers/knowledge-graph/rotate.md) | KG | 얕은 | 다관계 | 복소 회전 |
| [R-GCN](../papers/knowledge-graph/rgcn.md) | KG | GNN | 다관계 | 관계별 가중치+분해 |
| [CompGCN](../papers/knowledge-graph/compgcn.md) | KG | GNN | 다관계 | 합성 메시지 |
| [HGNN](../papers/hypergraph/hgnn.md) | 하이퍼그래프 | GNN | 하이퍼그래프 | 하이퍼엣지 합성곱 |
| [StarE](../papers/hypergraph/stare.md) | 하이퍼관계 | GNN | 하이퍼관계 | 한정자 합성 메시지 |
| [Graphormer](../papers/graph-transformer/graphormer.md) | 그래프 트랜스포머 | GNN·귀납 | 동질 | 구조 인코딩 어텐션 |
| [GraphGPS](../papers/graph-transformer/graphgps.md) | 그래프 트랜스포머 | GNN·귀납 | 동질 | 국소+전역 하이브리드 |

---
[← 이전: 개요](overview.md) · [다음: 데이터셋 개요 →](datasets-overview.md)
