---
type: Index
title: 논문 모음 (Papers)
description: 그래프 표현학습/GNN의 기반 논문 16편을 5개 주제로 분류한 concept 모음. ⭐ = 탑티어 AI 학회 필독.
tags: [papers, index, gnn, graph-representation-learning, graph-transformer, must-read]
timestamp: 2026-06-30T00:00:00Z
---

# 논문 모음 (Papers)

[← 번들 루트](../index.md) · 배경은 [개념 목록](../concepts/index.md)

그래프 표현학습·GNN의 **기반(landmark) 논문 16편** 입니다. 각 논문은 `문제 → 방법 → 기여 → 결과 → 링크`
양식의 concept 문서입니다.

> **범례**: ⭐ = **탑티어 AI 학회 게재 필독(MUST-READ)** (NeurIPS · ICML · ICLR · KDD · WWW · AAAI · EMNLP 등).
> 🏅 = 영향력 크나 AI-탑티어 랭킹은 아님(보조 표기). 처음 읽는다면 [기초](foundations/index.md)부터 순서대로.

## ⭐ 필독 논문 (탑티어 학회) — 빠른 시작

| ⭐ | 논문 | 발표처 | 주제 | concept |
|:--:|------|--------|------|---------|
| ⭐ | DeepWalk | **KDD 2014** | 기초 | [link](foundations/deepwalk.md) |
| ⭐ | node2vec | **KDD 2016** | 기초 | [link](foundations/node2vec.md) |
| ⭐ | GCN | **ICLR 2017** | 기초 | [link](foundations/gcn.md) |
| ⭐ | GraphSAGE | **NeurIPS 2017** | 기초 | [link](foundations/graphsage.md) |
| ⭐ | GAT | **ICLR 2018** | 기초 | [link](foundations/gat.md) |
| ⭐ | GIN | **ICLR 2019** | 기초 | [link](foundations/gin.md) |
| ⭐ | metapath2vec | **KDD 2017** | 이종 | [link](heterogeneous/metapath2vec.md) |
| ⭐ | HGT | **WWW 2020** | 이종 | [link](heterogeneous/hgt.md) |
| ⭐ | TransE | **NeurIPS 2013** | KG | [link](knowledge-graph/transe.md) |
| ⭐ | RotatE | **ICLR 2019** | KG | [link](knowledge-graph/rotate.md) |
| ⭐ | CompGCN | **ICLR 2020** | KG | [link](knowledge-graph/compgcn.md) |
| ⭐ | HGNN | **AAAI 2019** | 하이퍼그래프 | [link](hypergraph/hgnn.md) |
| ⭐ | StarE | **EMNLP 2020** | 하이퍼관계 | [link](hypergraph/stare.md) |
| ⭐ | Graphormer | **NeurIPS 2021** | 그래프 트랜스포머 | [link](graph-transformer/graphormer.md) |
| ⭐ | GraphGPS | **NeurIPS 2022** | 그래프 트랜스포머 | [link](graph-transformer/graphgps.md) |

> 🏅 **참고**: [R-GCN](knowledge-graph/rgcn.md)(ESWC 2018)은 관계형 GNN의 시초로 영향력이 크지만 학회
> 랭킹상 ⭐ 대상은 아닙니다.

## 주제별 디렉터리
| 주제 | 논문 수 | ⭐ 필독 | 바로가기 |
|------|:------:|:------:|----------|
| 📐 기초 (랜덤워크·GNN 백본·표현력) | 6 | 6 | [foundations/index.md](foundations/index.md) |
| 🔀 이종 그래프 (Heterogeneous) | 2 | 2 | [heterogeneous/index.md](heterogeneous/index.md) |
| 🔗 지식 그래프 (Knowledge Graph) | 4 | 3 | [knowledge-graph/index.md](knowledge-graph/index.md) |
| 🕸️ 하이퍼그래프·하이퍼관계 | 2 | 2 | [hypergraph/index.md](hypergraph/index.md) |
| 🌀 그래프 트랜스포머 (Graph Transformer) | 2 | 2 | [graph-transformer/index.md](graph-transformer/index.md) |

## 전체 논문 색인 (연도순)

| 연도 | 논문 | 발표처 | 주제 | concept |
|:----:|------|--------|------|---------|
| 2013 | ⭐ TransE | **NeurIPS 2013** | KG | [link](knowledge-graph/transe.md) |
| 2014 | ⭐ DeepWalk | **KDD 2014** | 기초 | [link](foundations/deepwalk.md) |
| 2016 | ⭐ node2vec | **KDD 2016** | 기초 | [link](foundations/node2vec.md) |
| 2017 | ⭐ GCN | **ICLR 2017** | 기초 | [link](foundations/gcn.md) |
| 2017 | ⭐ GraphSAGE | **NeurIPS 2017** | 기초 | [link](foundations/graphsage.md) |
| 2017 | ⭐ metapath2vec | **KDD 2017** | 이종 | [link](heterogeneous/metapath2vec.md) |
| 2018 | ⭐ GAT | **ICLR 2018** | 기초 | [link](foundations/gat.md) |
| 2018 | 🏅 R-GCN | ESWC 2018 | KG | [link](knowledge-graph/rgcn.md) |
| 2019 | ⭐ GIN | **ICLR 2019** | 기초 | [link](foundations/gin.md) |
| 2019 | ⭐ RotatE | **ICLR 2019** | KG | [link](knowledge-graph/rotate.md) |
| 2019 | ⭐ HGNN | **AAAI 2019** | 하이퍼그래프 | [link](hypergraph/hgnn.md) |
| 2020 | ⭐ HGT | **WWW 2020** | 이종 | [link](heterogeneous/hgt.md) |
| 2020 | ⭐ CompGCN | **ICLR 2020** | KG | [link](knowledge-graph/compgcn.md) |
| 2020 | ⭐ StarE | **EMNLP 2020** | 하이퍼관계 | [link](hypergraph/stare.md) |
| 2021 | ⭐ Graphormer | **NeurIPS 2021** | 그래프 트랜스포머 | [link](graph-transformer/graphormer.md) |
| 2022 | ⭐ GraphGPS | **NeurIPS 2022** | 그래프 트랜스포머 | [link](graph-transformer/graphgps.md) |

## 🧭 추천 독해 경로

**표현학습의 진화** 를 따라가는 순서:
1. 랜덤워크 임베딩: [DeepWalk](foundations/deepwalk.md) → [node2vec](foundations/node2vec.md)
2. 메시지 패싱 GNN: [GCN](foundations/gcn.md) → [GraphSAGE](foundations/graphsage.md) → [GAT](foundations/gat.md)
   → [GIN](foundations/gin.md)(표현력 한계)
3. 이종 확장: [metapath2vec](heterogeneous/metapath2vec.md) → [HGT](heterogeneous/hgt.md)
4. 지식그래프: [TransE](knowledge-graph/transe.md) → [RotatE](knowledge-graph/rotate.md) →
   [R-GCN](knowledge-graph/rgcn.md) → [CompGCN](knowledge-graph/compgcn.md)
5. 고차 관계: [HGNN](hypergraph/hgnn.md) → [StarE](hypergraph/stare.md)
6. 메시지 패싱을 넘어: [Graphormer](graph-transformer/graphormer.md) → [GraphGPS](graph-transformer/graphgps.md)

> ⚠️ 일부 세부 수치는 *(미확인)* 으로 표기했습니다. 인용 전 각 concept 의 `resource` 원문을 확인하세요.

---
[← 번들 루트](../index.md) · [개념 목록 →](../concepts/index.md)
