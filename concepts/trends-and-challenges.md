---
type: Concept
title: 동향·과제 (Trends & Challenges)
description: 이 13편의 기반 논문이 연 흐름과, 그 이후의 발전 방향 및 남은 미해결 과제(open problems).
tags: [trends, challenges, open-problems, future-work, gnn]
timestamp: 2026-06-19T00:00:00Z
---

# 동향·과제 (Trends & Challenges)

[← 개념 목록](index.md) · [번들 루트](../index.md)

이 번들의 13편은 그래프 표현학습의 **기반(landmark)** 입니다. 여기서 출발해 어떤 흐름이 이어졌는지,
그리고 무엇이 여전히 어려운지 정리합니다.

## 📈 기반 논문이 연 흐름

### 1. 얕은 임베딩 → 메시지 패싱 GNN
[DeepWalk](../papers/foundations/deepwalk.md)/[node2vec](../papers/foundations/node2vec.md) 의 룩업형
임베딩은 노드 특징을 못 쓰고 귀납이 안 된다는 한계가 있었고, 이를
[GCN](../papers/foundations/gcn.md)→[GraphSAGE](../papers/foundations/graphsage.md)→[GAT](../papers/foundations/gat.md)
의 메시지 패싱이 해결했다. 이후 **MPNN/GIN** 등으로 표현력 이론(WL-test)이 정리됨.

### 2. 동질 → 이종/다관계로 확장
단일 타입 가정을 벗고 [metapath2vec](../papers/heterogeneous/metapath2vec.md)→[HGT](../papers/heterogeneous/hgt.md)
(이종), [TransE](../papers/knowledge-graph/transe.md)→[RotatE](../papers/knowledge-graph/rotate.md)와
[R-GCN](../papers/knowledge-graph/rgcn.md)→[CompGCN](../papers/knowledge-graph/compgcn.md)(다관계/KG)로
현실 그래프를 담게 됨.

### 3. 고차 관계 (hypergraph / hyper-relational)
2-노드 엣지의 한계를 넘어 [HGNN](../papers/hypergraph/hgnn.md)(하이퍼엣지)·
[StarE](../papers/hypergraph/stare.md)(한정자 포함 KG)로 확장.

### 4. (이후) Graph Transformer·확장성·자기지도·파운데이션
- **Graph Transformer**: 메시지 패싱의 장거리·오버스무딩 한계를 (준)전역 어텐션으로 극복 →
  [Graphormer](../papers/graph-transformer/graphormer.md)(구조 인코딩) →
  [GraphGPS](../papers/graph-transformer/graphgps.md)(국소+전역 하이브리드·선형 확장). 이종판은
  [HGT](../papers/heterogeneous/hgt.md).
- **표현력 이론**: 메시지 패싱 = 1-WL 상한([GIN](../papers/foundations/gin.md)) → 이를 넘으려는 고차·부분구조 GNN.
- **확장성**: 이웃 샘플링([GraphSAGE](../papers/foundations/graphsage.md))·그래프 샘플링·서브그래프 학습.
- **자기지도(SSL)**: DGI, GRACE 등 대조학습으로 라벨 없이 강한 임베딩.
- **그래프 파운데이션 모델 / LLM × Graph**: 사전학습·전이, 텍스트-속성 그래프(TAG) 활용.

## 🧩 남은 미해결 과제 (Open Problems)

| 과제 | 설명 |
|------|------|
| **오버스무딩·깊이** | 층을 깊게 쌓으면 노드 표현이 비슷해져 성능 저하 (잔차·정규화로 완화 중) |
| **확장성** | 수십억 노드 그래프의 학습·실시간 추론, 메모리·통신 비용 |
| **이질성(heterophily)** | "연결=유사" 가정이 깨지는 그래프에서 일반 GNN 성능 저하 |
| **표현력의 한계** | 메시지 패싱은 1-WL 한계 — 일부 구조를 구분 못 함 |
| **귀납·도메인 일반화** | 새 그래프·새 분포로의 전이, 분포 변화 강건성 |
| **KG 완성의 한계** | 관계 패턴·다홉 추론·하이퍼관계까지 포괄하는 통합 모델 |
| **동적 그래프** | 시간에 따라 변하는 구조·특징의 효율적 모델링 |
| **평가 표준화** | 데이터 분할·전처리 차이로 공정 비교 어려움 → [OGB](../datasets/ogb.md) 등 |
| **해석가능성** | 어텐션·중요도 기반 설명의 신뢰성 |

## 🔭 유망한 방향

- **그래프 파운데이션 모델** — 사전학습 후 zero/few-shot 전이.
- **LLM × Graph** — 텍스트 의미(LLM) + 구조(GNN) 융합, 그래프 추론.
- **확장 가능한 자기지도** — 라벨 비용 없이 대규모 사전학습.
- **고차·하이퍼관계 통합** — 하이퍼그래프와 하이퍼관계 KG의 일반 프레임워크.
- **이론(표현력·일반화)** — 메시지 패싱의 한계를 넘는 아키텍처.

---
[← 이전: 용어집](glossary.md) · [개념 목록](index.md) · [논문 모음 →](../papers/index.md)
