---
type: Research Paper
title: "Modeling Relational Data with Graph Convolutional Networks (R-GCN)"
description: 관계별 가중치 행렬로 다관계(KG) 그래프에 메시지 패싱을 적용한 관계형 GCN. 베이시스/블록 분해로 관계 수 폭증에 따른 과적합·파라미터 폭발을 완화. 엔티티 분류와 링크 예측에 적용.
resource: https://arxiv.org/abs/1703.06103
tags: [knowledge-graph, relational-gcn, multi-relational, message-passing, basis-decomposition, distmult, link-prediction]
authors: Michael Schlichtkrull, Thomas N. Kipf, Peter Bloem, Rianne van den Berg, Ivan Titov, Max Welling
venue: ESWC 2018
year: 2018
timestamp: 2026-06-22T00:00:00Z
---

# R-GCN: Modeling Relational Data with Graph Convolutional Networks

> 🏅 **참고(영향력 큰 비-AI-탑티어 학회)**: 게재처 **ESWC 2018**. 관계형 GNN의 시초로 매우 영향력이
> 크지만, ESWC는 [CLAUDE.md](../../CLAUDE.md)의 AI-탑티어 랭킹 기준에는 포함되지 않아 ⭐ 대신 🏅로 표기합니다.

[← 카테고리](index.md) · 원문: [arXiv:1703.06103](https://arxiv.org/abs/1703.06103)

- **저자**: Michael Schlichtkrull, Thomas N. Kipf, Peter Bloem, Rianne van den Berg, Ivan Titov, Max Welling
- **발표처/연도**: ESWC 2018

## 문제 (Problem)
[GCN](../foundations/gcn.md) 은 **단일 관계(엣지 한 종류)** 그래프용이다. 그러나 지식그래프는 **수백~수천
종류의 관계** 를 갖는다. 관계마다 별도 가중치를 두면 **파라미터가 폭발** 하고 희소 관계에서 **과적합** 한다.
또 [TransE](transe.md)/[RotatE](rotate.md) 같은 얕은 임베딩은 노드 주변의 **그래프 구조(이웃)** 를
인코딩하지 못한다.

## 방법 (Method)
GCN을 **관계별(relation-specific)** 로 확장한 메시지 패싱 + **분해** 정규화.

## 핵심 메커니즘 — R-GCN이 *실제로* 하는 것

> **한 줄 요약**: 관계마다 다른 변환 $W_r$ 로 이웃을 집계하되, **베이시스 분해로 $W_r$ 들을 공유** 해
> 관계 수 폭발과 희소 관계 과적합을 막는다. (분해는 단순 압축이 아니라 **정규화·일반화** 장치다.)

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| GCN과 차이 | 관계 타입을 입력에 concat | **관계별 변환 $W_r$** 로 따로 집계 후 합산 |
| 베이시스 분해 | 단순 압축(메모리) | **관계 간 파라미터 공유 = 정규화** → 희소 관계 일반화 |
| 무엇을 푸나 | 한 가지 과제 | **엔티티 분류**(인코더+softmax)와 **링크 예측**(인코더+DistMult 디코더) |
| 관계 임베딩 | 학습함 | **학습하지 않음**(관계는 $W_r$ 로만 존재) → [CompGCN](compgcn.md)이 보완 |

### 전파 규칙

$$h_i^{(l+1)} = \sigma\Big(\sum_{r\in\mathcal{R}}\sum_{j\in\mathcal{N}_i^{r}} \tfrac{1}{c_{i,r}}\,W_r^{(l)} h_j^{(l)} \;+\; W_0^{(l)} h_i^{(l)}\Big)$$

- $\mathcal{N}_i^r$: 관계 $r$ 로 $i$ 에 연결된 이웃, $c_{i,r}$: 정규화 상수(예: $|\mathcal{N}_i^r|$),
  $W_0$: 자기 루프.

### 관계 수 폭발 해결: 두 가지 분해
- **베이시스 분해(basis)**: $W_r = \sum_{b=1}^{B} a_{rb}\, V_b$ — 모든 관계가 **공유 베이시스 $V_b$** 의
  선형결합. 관계별로는 계수 $a_{rb}$ 만 학습 → 파라미터·과적합 급감, **관계 간 지식 공유**.
- **블록 대각 분해(block-diagonal)**: $W_r$ 를 블록 희소 구조로 제한 → 차원 그룹 내 상호작용만 허용.

### 링크 예측: 인코더–디코더(오토인코더)
- **인코더**: R-GCN 으로 엔티티 표현 $e_i$ 생성.
- **디코더**: **DistMult** 점수 $f(s,r,o) = e_s^\top R_r\, e_o$ ($R_r$ 대각행렬), 손상 삼중항과
  교차엔트로피로 학습.

### 왜 작동하나
- 얕은 KG 임베딩과 달리 **이웃 구조를 인코딩** → 엔티티 분류·콜드 엔티티에 강함.
- 베이시스 공유가 **희소 관계** 에서도 통계력을 빌려와 일반화.

### 한 줄 비유
> 관계마다 다른 **"번역기($W_r$)"** 로 이웃 메시지를 번역해 모은다. 단, 번역기들이 **공통 부품(베이시스)**
> 을 나눠 써서 종류가 많아도 감당된다.

## 핵심 기여 (Contributions)
- **다관계 그래프에 GCN/메시지 패싱** 을 도입한 관계형 GNN의 시초.
- **베이시스·블록 분해** 로 많은 관계에서도 파라미터 효율·일반화.
- 엔티티 분류 + 링크 예측(인코더+DistMult)을 통합.

## 한계·후속
- 관계 자체의 임베딩을 학습하지 않고 $W_r$ 가 여전히 무거움 →
  노드·관계를 공동 임베딩하는 [CompGCN](compgcn.md) 으로 발전.

## 결과·데이터셋 (Results)
엔티티 분류 AIFB·MUTAG·BGS·AM, 링크 예측 [FB15k-237 / WN18](../../datasets/fb15k-237-wn18rr.md) 등에서 평가.

## 관련 링크
- 개념: [다관계 그래프·관계형 GNN·베이시스 분해](../../concepts/glossary.md), [분류 체계](../../concepts/taxonomy.md)
- 기반: [GCN](../foundations/gcn.md) · 발전: [CompGCN](compgcn.md)

---
[← 카테고리](index.md)
