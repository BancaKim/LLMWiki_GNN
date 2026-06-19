---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Semi-Supervised Classification with Graph Convolutional Networks (GCN)"
description: 스펙트럼 그래프 합성곱의 1차 근사로 유도한 단순·확장 가능한 층별 전파 규칙. 재정규화(renormalization) 트릭으로 준지도 노드 분류의 표준 베이스라인이 됨.
resource: https://arxiv.org/abs/1609.02907
tags: [gcn, spectral, message-passing, semi-supervised, node-classification, transductive]
authors: Thomas N. Kipf, Max Welling
venue: ICLR 2017
year: 2017
timestamp: 2026-06-19T00:00:00Z
---

# ⭐ Semi-Supervised Classification with Graph Convolutional Networks (GCN)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **ICLR 2017**

[← 카테고리](index.md) · 원문: [arXiv:1609.02907](https://arxiv.org/abs/1609.02907)

- **저자**: Thomas N. Kipf, Max Welling
- **발표처/연도**: ICLR 2017

## 문제 (Problem)
그래프에서 **일부 노드만 라벨이 있을 때(준지도)** 나머지를 분류하고 싶다. 기존 스펙트럼 그래프 합성곱은
라플라시안 고유분해 비용이 크고 필터가 비국소적이라 대규모·실용 적용이 어려웠다.

## 방법 (Method)
스펙트럼 합성곱을 **체비셰프 다항식의 1차 근사** 로 단순화해, 다음의 가벼운 **층별 전파 규칙** 을 얻는다:

> H^(l+1) = σ( **D̃^(−1/2) Ã D̃^(−1/2)** · H^(l) · W^(l) )

- **재정규화(renormalization) 트릭**: Ã = A + I (자기 루프 추가), D̃ 는 그 차수 행렬. 수치 안정성과
  과한 스케일을 막는다.
- 결과적으로 각 층은 **1-홉 이웃의 특징을 평균적으로 집계** 하는 메시지 패싱과 동치 → 단순·효율적.
- 2층 GCN + 교차엔트로피로 준지도 노드 분류를 end-to-end 학습.

## 핵심 기여 (Contributions)
- 스펙트럼 이론에서 **실용적이고 확장 가능한 GNN 층** 을 유도 — 이후 GNN의 사실상 표준 베이스라인.
- **재정규화 트릭** 으로 안정적 학습.
- 준지도 노드 분류에서 단순한 구조로 강한 성능.

## 결과·데이터셋 (Results)
인용 네트워크 [Cora / Citeseer / Pubmed](../../datasets/cora-citeseer-pubmed.md) 와 NELL 에서 당시 SOTA급
정확도. 단, 학습 시 전체 그래프(인접행렬)가 필요한 **전이적(transductive)** 설정이다.

## 한계·후속
- 그래프 전체를 메모리에 올려야 하고 **미관측 노드(귀납)** 에 약함 → [GraphSAGE](graphsage.md) 가 해결.
- 이웃을 균일 가중 평균 → 이웃별 중요도 학습은 [GAT](gat.md) 로 발전.

## 관련 링크
- 개념: [메시지 패싱·스펙트럼 합성곱](../../concepts/glossary.md), [전이 vs 귀납](../../concepts/overview.md)
- 확장: 다관계 KG로 [R-GCN](../knowledge-graph/rgcn.md)·[CompGCN](../knowledge-graph/compgcn.md),
  하이퍼그래프로 [HGNN](../hypergraph/hgnn.md)

---
[← 카테고리](index.md)
