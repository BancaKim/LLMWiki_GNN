---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Composition-based Multi-Relational Graph Convolutional Networks (CompGCN)"
description: 노드와 관계 임베딩을 함께 학습하고, 합성 연산(뺄셈=TransE·곱=DistMult·순환상관=HolE)으로 엔티티-관계를 결합해 메시지를 만드는 다관계 GCN. R-GCN의 파라미터 폭발을 관계 임베딩+방향별 가중치로 해결.
resource: https://arxiv.org/abs/1911.03082
tags: [knowledge-graph, multi-relational, gcn, composition, relation-embedding, direction-specific, link-prediction]
authors: Shikhar Vashishth, Soumya Sanyal, Vikram Nitin, Partha Talukdar
venue: ICLR 2020
year: 2020
timestamp: 2026-06-22T00:00:00Z
---

# ⭐ Composition-based Multi-Relational Graph Convolutional Networks (CompGCN)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **ICLR 2020**

[← 카테고리](index.md) · 원문: [arXiv:1911.03082](https://arxiv.org/abs/1911.03082)

- **저자**: Shikhar Vashishth, Soumya Sanyal, Vikram Nitin, Partha Talukdar
- **발표처/연도**: ICLR 2020

## 문제 (Problem)
[R-GCN](rgcn.md) 은 관계마다 가중치 행렬 $W_r$ 를 두어 **관계 수에 따라 파라미터가 폭발** 하고, **관계
자체의 임베딩** 을 학습하지 않는다. 노드와 관계를 **함께(jointly)** 임베딩하면서도 확장 가능한 다관계
GNN이 필요하다.

## 방법 (Method)
노드와 관계 임베딩을 **동시에 학습** 하고, 메시지를 **비파라미터 합성(composition) 연산** 으로 만든다.

## 핵심 메커니즘 — CompGCN이 *실제로* 하는 것

> **한 줄 요약**: 메시지를 "관계별 행렬 $W_r$"이 아니라 **합성 함수 $\phi(\text{노드},\text{관계})$ +
> 방향별 가중치($W_O,W_I,W_S$ 3개)** 로 만든다. 그래서 **파라미터가 관계 수에 비례하지 않는다.**

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| R-GCN과 차이 | 관계 임베딩만 추가 | **노드+관계 공동 임베딩** + 가중치를 **방향(in/out/self) 3개** 로 축소 |
| 파라미터 스케일 | 관계 수에 비례 | **관계 수와 무관**(관계는 임베딩, 가중치는 방향별) |
| 합성 연산 $\phi$ | 아무거나 무방 | **선택이 KG 임베딩 모델과 대응**(뺄셈=TransE, 곱=DistMult, 순환상관=HolE) → 성능에 영향 |
| 일반화 | 새 모델 | R-GCN·Directed-GCN·Weighted-GCN 등을 **특수 케이스로 포괄** |

### 전파 규칙

$$h_v = f\Big(\sum_{(u,r)\in\mathcal{N}(v)} W_{\lambda(r)}\,\phi(h_u,\, h_r)\Big),\qquad h_r' = W_{rel}\,h_r$$

- $\lambda(r)\in\{\text{out},\ \text{in},\ \text{self}\}$ → 가중치는 **단 3개** $W_O, W_I, W_S$
  (역방향 엣지·자기 루프 포함). **관계별 $W_r$ 없음.**
- 관계 임베딩 $h_r$ 도 **층마다 갱신**($W_{rel}$).
- 관계 파라미터는 **베이시스 벡터의 선형결합** 으로 표현해 더 절약 가능.

### 합성 연산 $\phi$ (엔티티 ⊕ 관계)
| $\phi(h_u,h_r)$ | 대응 KG 모델 |
|---|---|
| $h_u - h_r$ (뺄셈) | TransE |
| $h_u * h_r$ (원소곱) | DistMult |
| $h_u \star h_r$ (순환상관, circular-correlation) | HolE |

즉 **KG 임베딩의 스코어 구조를 메시지 패싱 안으로** 가져온 것.

### 왜 작동하나
- 관계를 **임베딩** 으로 두고 $\phi$ 로 결합하니, 관계가 수천 개여도 **가중치는 3개** 라 확장적.
- 노드·관계를 함께 갱신해, 링크 예측 디코더(TransE/DistMult/ConvE 등)와 자연스럽게 연결.

### 한 줄 비유
> 관계마다 번역기를 두는([R-GCN](rgcn.md)) 대신, **관계도 하나의 단어(임베딩)** 로 보고 노드와 **합성
> (빼기/곱하기)** 해 메시지를 만든다. 방향(들어옴/나감/자기)만 구분한다.

## 핵심 기여 (Contributions)
- **노드 + 관계 공동 임베딩** 다관계 GCN 프레임워크.
- KG 임베딩의 **합성 연산** 을 메시지 패싱에 통합.
- 방향별 3개 가중치 + 관계 임베딩으로 R-GCN의 **파라미터 폭발 해소**, 다수 기존 GCN을 일반화.

## 결과·데이터셋 (Results)
[FB15k-237, WN18RR](../../datasets/fb15k-237-wn18rr.md) 에서 링크 예측 SOTA급(MRR/Hits@k), 노드/그래프
분류에도 적용. 합성 연산 선택(특히 순환상관)이 성능에 영향을 줌을 분석.

## 관련 링크
- 개념: [다관계 그래프·합성 연산](../../concepts/glossary.md)
- 기반: [R-GCN](rgcn.md)·[GCN](../foundations/gcn.md), 합성연산 출처 [TransE](transe.md)
- 발전(하이퍼관계 인코더로 사용): [StarE](../hypergraph/stare.md)

---
[← 카테고리](index.md)
