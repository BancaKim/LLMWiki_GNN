---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Composition-based Multi-Relational Graph Convolutional Networks (CompGCN)"
description: 노드와 관계 임베딩을 함께 학습하고, 합성 연산(뺄셈=TransE·곱=DistMult·순환상관=HolE)으로 엔티티-관계를 결합해 메시지를 만드는 다관계 GCN. R-GCN의 파라미터 폭발을 관계 임베딩+베이시스로 해결.
resource: https://arxiv.org/abs/1911.03082
tags: [knowledge-graph, multi-relational, gcn, composition, relation-embedding, link-prediction]
authors: Shikhar Vashishth, Soumya Sanyal, Vikram Nitin, Partha Talukdar
venue: ICLR 2020
year: 2020
timestamp: 2026-06-19T00:00:00Z
---

# ⭐ Composition-based Multi-Relational Graph Convolutional Networks (CompGCN)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **ICLR 2020**

[← 카테고리](index.md) · 원문: [arXiv:1911.03082](https://arxiv.org/abs/1911.03082)

- **저자**: Shikhar Vashishth, Soumya Sanyal, Vikram Nitin, Partha Talukdar
- **발표처/연도**: ICLR 2020

## 문제 (Problem)
[R-GCN](rgcn.md) 은 관계마다 가중치 행렬 W_r 를 두어 **관계 수에 따라 파라미터가 폭발** 하고, **관계
자체의 임베딩** 을 학습하지 않는다. 노드와 관계를 **함께(jointly)** 임베딩하면서도 확장 가능한 다관계
GNN이 필요하다.

## 방법 (Method)
노드와 관계 임베딩을 **동시에 학습** 하고, 메시지를 **합성(composition) 연산** 으로 만든다.
- 이웃 메시지 = **합성 함수 φ(노드 임베딩, 관계 임베딩)**. 합성 연산은 KG 임베딩에서 차용:
  - **뺄셈(subtraction)** → TransE 식, **곱(multiplication)** → DistMult 식, **순환상관(circular-correlation)** → HolE 식.
- 방향성(정방향/역방향/자기루프)별로 가중치를 두고 집계하며, **관계 임베딩도 층마다 갱신**.
- 관계 파라미터는 **베이시스 벡터의 선형결합** 으로 표현해 많은 관계에서도 효율적.
- 여러 기존 GCN(R-GCN, Directed-GCN, Weighted-GCN 등)을 특수 케이스로 **일반화**.

## 핵심 기여 (Contributions)
- **노드 + 관계 공동 임베딩** 을 하는 다관계 GCN 프레임워크.
- KG 임베딩의 **합성 연산** 을 메시지 패싱에 통합.
- 관계 임베딩+베이시스로 R-GCN의 **파라미터 폭발 완화**.

## 결과·데이터셋 (Results)
[FB15k-237, WN18RR](../../datasets/fb15k-237-wn18rr.md) 에서 링크 예측 SOTA급(MRR/Hits@k), 노드/그래프
분류에도 적용. 합성 연산 선택이 성능에 영향을 줌을 분석.

## 관련 링크
- 개념: [다관계 그래프·합성 연산](../../concepts/glossary.md)
- 기반: [R-GCN](rgcn.md)·[GCN](../foundations/gcn.md), 합성연산 출처 [TransE](transe.md)
- 발전(하이퍼관계 인코더로 사용): [StarE](../hypergraph/stare.md)

---
[← 카테고리](index.md)
