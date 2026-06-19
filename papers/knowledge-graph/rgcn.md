---
type: Research Paper
title: "Modeling Relational Data with Graph Convolutional Networks (R-GCN)"
description: 관계별 가중치 행렬로 다관계(KG) 그래프에 메시지 패싱을 적용한 관계형 GCN. 베이시스/블록 분해로 관계 수 폭증에 따른 과적합·파라미터 폭발을 완화. 엔티티 분류와 링크 예측에 적용.
resource: https://arxiv.org/abs/1703.06103
tags: [knowledge-graph, relational-gcn, multi-relational, message-passing, basis-decomposition, link-prediction]
authors: Michael Schlichtkrull, Thomas N. Kipf, Peter Bloem, Rianne van den Berg, Ivan Titov, Max Welling
venue: ESWC 2018
year: 2018
timestamp: 2026-06-19T00:00:00Z
---

# R-GCN: Modeling Relational Data with Graph Convolutional Networks

> 🏅 **참고(영향력 큰 비-AI-탑티어 학회)**: 게재처 **ESWC 2018**. 관계형 GNN의 시초로 매우 영향력이
> 크지만, ESWC는 [CLAUDE.md](../../CLAUDE.md)의 AI-탑티어 랭킹 기준에는 포함되지 않아 ⭐ 대신 🏅로 표기합니다.

[← 카테고리](index.md) · 원문: [arXiv:1703.06103](https://arxiv.org/abs/1703.06103)

- **저자**: Michael Schlichtkrull, Thomas N. Kipf, Peter Bloem, Rianne van den Berg, Ivan Titov, Max Welling
- **발표처/연도**: ESWC 2018

## 문제 (Problem)
[GCN](../foundations/gcn.md) 은 **단일 관계(엣지 한 종류)** 그래프용이다. 그러나 지식그래프는 **수백~수천
종류의 관계(relation)** 를 갖는 다관계 그래프다. 관계마다 별도 가중치를 두면 **파라미터가 폭발** 하고 희소
관계에서 **과적합** 한다. 또 [TransE](transe.md)/[RotatE](rotate.md) 같은 얕은 임베딩은 노드 주변의
**그래프 구조(이웃)** 를 인코딩하지 못한다.

## 방법 (Method)
GCN을 **관계별(relation-specific)** 로 확장한 메시지 패싱.
- 각 노드는 **관계 r 마다 다른 가중치 행렬 W_r** 로 이웃 메시지를 변환·집계하고, 자기 루프를 더해 갱신.
- 관계 수 폭증 문제를 두 가지 **정규화/분해** 로 해결:
  - **베이시스 분해(basis decomposition)**: 모든 W_r 를 소수의 공유 베이시스 행렬의 선형결합으로 표현 → 관계 간 파라미터 공유.
  - **블록 대각 분해(block-diagonal decomposition)**: W_r 를 블록 희소 구조로 제한.
- 두 가지 과제에 적용:
  - **엔티티 분류**: R-GCN 인코더 + 소프트맥스.
  - **링크 예측**: R-GCN 인코더 + **DistMult** 디코더(오토인코더 형태).

## 핵심 기여 (Contributions)
- **다관계 그래프에 GCN/메시지 패싱을 도입** 한 관계형 GNN의 시초.
- **베이시스·블록 분해** 로 많은 관계에서도 파라미터 효율·일반화 확보.
- 얕은 KG 임베딩과 달리 **이웃 구조를 인코딩** → [CompGCN](compgcn.md) 등으로 발전.

## 결과·데이터셋 (Results)
엔티티 분류 AIFB·MUTAG·BGS·AM, 링크 예측 [FB15k-237 / WN18](../../datasets/fb15k-237-wn18rr.md) 등에서
평가. 링크 예측에서 구조 인코딩이 얕은 임베딩을 보완함을 보임.

## 관련 링크
- 개념: [다관계 그래프·관계형 GNN](../../concepts/glossary.md), [분류 체계](../../concepts/taxonomy.md)
- 기반: [GCN](../foundations/gcn.md) · 발전(노드+관계 동시 임베딩): [CompGCN](compgcn.md)

---
[← 카테고리](index.md)
