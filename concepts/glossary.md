---
type: Concept
title: 용어집 (Glossary)
description: 그래프 표현학습/GNN 논문에 반복 등장하는 핵심 개념과 약어 사전 — 그래프 기본, 임베딩 방법, GNN 연산, 이종/KG/하이퍼그래프, 평가지표.
tags: [glossary, terminology, gnn, embedding, knowledge-graph]
timestamp: 2026-06-19T00:00:00Z
---

# 용어집 (Glossary)

[← 개념 목록](index.md) · [번들 루트](../index.md)

## 그래프·표현학습 기본

| 용어 | 설명 |
|------|------|
| **노드/엣지 (Node/Edge)** | 그래프의 정점과 연결. 노드=객체, 엣지=관계 |
| **임베딩 (Embedding)** | 노드/엣지/그래프를 표현하는 저차원 벡터 |
| **표현학습 (Representation Learning)** | 다운스트림에 유용한 임베딩을 데이터로부터 학습 |
| **홉 (Hop)** | 그래프상 거리. L-홉 이웃 = L번 엣지로 도달 |
| **동질성 (Homophily)** | 연결된 노드가 비슷한 클래스 (기본 GNN 가정) |
| **구조적 동등성 (Structural Equivalence)** | 그래프 내 역할(예: 허브)이 비슷한 노드 |

## 임베딩 방법 (얕은)

| 용어 | 설명 |
|------|------|
| **랜덤워크 (Random Walk)** | 그래프를 무작위로 걸으며 노드 시퀀스 생성 |
| **SkipGram / word2vec** | 중심 단어로 주변을 예측하는 임베딩 학습(NLP 기원) |
| **절단 랜덤워크 (Truncated)** | 고정 길이로 끊은 워크 ([DeepWalk](../papers/foundations/deepwalk.md)) |
| **편향 랜덤워크 (Biased)** | 복귀 p·인아웃 q 로 BFS/DFS 보간 ([node2vec](../papers/foundations/node2vec.md)) |
| **Hierarchical Softmax / Negative Sampling** | 대규모 어휘(노드)에서 SkipGram을 가속하는 근사 |

## GNN 연산

| 용어 | 설명 |
|------|------|
| **메시지 패싱 (Message Passing)** | 이웃 메시지를 집계해 표현을 갱신하는 GNN 핵심 연산 |
| **집계 함수 (Aggregator)** | mean/LSTM/pooling 등 이웃 결합 함수 ([GraphSAGE](../papers/foundations/graphsage.md)) |
| **스펙트럼 합성곱 (Spectral Conv.)** | 그래프 라플라시안 고유공간에서의 필터링 ([GCN](../papers/foundations/gcn.md)) |
| **재정규화 트릭 (Renormalization)** | Ã = A + I 로 자기루프 추가·정규화 (GCN) |
| **어텐션 (Attention)** | 이웃마다 가중치를 학습 ([GAT](../papers/foundations/gat.md)) |
| **멀티헤드 (Multi-head)** | 여러 어텐션을 병렬로 두어 안정·표현력 향상 |
| **오버스무딩 (Over-smoothing)** | 층이 깊어질수록 노드 표현이 비슷해져 변별력 상실 |
| **전이적/귀납적 (Transductive/Inductive)** | 학습 노드만 / 새 노드까지 → [개요](overview.md) |

## 이종 그래프 / KG / 하이퍼그래프

| 용어 | 설명 |
|------|------|
| **이종 그래프 (Heterogeneous)** | 여러 타입의 노드·엣지를 가진 그래프 |
| **메타패스 (Meta-path)** | 노드 타입 시퀀스 스키마 (예: APA) ([metapath2vec](../papers/heterogeneous/metapath2vec.md)) |
| **메타관계 (Meta-relation)** | ⟨소스타입, 엣지타입, 타깃타입⟩ 삼중쌍 ([HGT](../papers/heterogeneous/hgt.md)) |
| **Graph Transformer** | 트랜스포머 어텐션을 그래프에 적용 (HGT) |
| **지식그래프 (KG)** | (head, relation, tail) 삼중항의 집합 |
| **다관계 (Multi-relational)** | 여러 관계 유형을 가진 그래프 |
| **KG 임베딩 (KG Embedding)** | 엔티티·관계를 벡터로 (TransE/RotatE) |
| **합성 연산 (Composition)** | 뺄셈/곱/순환상관으로 노드·관계 결합 ([CompGCN](../papers/knowledge-graph/compgcn.md)) |
| **하이퍼그래프 (Hypergraph)** | 하이퍼엣지가 ≥3 노드를 동시에 연결 ([HGNN](../papers/hypergraph/hgnn.md)) |
| **하이퍼관계 (Hyper-relational)** | 삼중항 + 한정자(qualifier) 문장 ([StarE](../papers/hypergraph/stare.md)) |
| **한정자 (Qualifier)** | 삼중항에 부가되는 (속성, 값) 쌍 (예: 연도=1921) |

## 학습·관계 패턴

| 용어 | 설명 |
|------|------|
| **마진 기반 랭킹 손실** | 참 삼중항이 거짓보다 낮은 거리를 갖도록 (TransE) |
| **네거티브 샘플링** | head/tail을 손상시켜 거짓 삼중항 생성 |
| **자기적대적 네거티브 샘플링** | 모델 점수 비례 가중 ([RotatE](../papers/knowledge-graph/rotate.md)) |
| **관계 패턴** | 대칭/반대칭/역/합성 — KG 임베딩의 표현력 척도 |
| **베이시스 분해 (Basis Decomp.)** | 관계 가중치를 공유 베이시스로 표현 ([R-GCN](../papers/knowledge-graph/rgcn.md)) |

## 평가지표

| 지표 | 의미 |
|------|------|
| **Accuracy / F1** | 노드 분류 (Micro/Macro-F1은 다중 라벨) |
| **MRR (Mean Reciprocal Rank)** | 링크 예측 — 정답 순위의 역수 평균 |
| **Hits@k** | 정답이 상위 k 안에 든 비율 (Hits@1/3/10) |
| **Mean Rank** | 정답의 평균 순위 (낮을수록 좋음) |
| **AUC / AP** | 링크 예측의 이진 분류 품질 |

자세한 평가·데이터셋 선택은 [데이터셋 개요](datasets-overview.md) 참고.

---
[← 이전: 데이터셋 개요](datasets-overview.md) · [다음: 동향·과제 →](trends-and-challenges.md)
