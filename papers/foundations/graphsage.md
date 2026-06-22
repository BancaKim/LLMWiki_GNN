---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Inductive Representation Learning on Large Graphs (GraphSAGE)"
description: 이웃을 고정 크기로 샘플링하고 학습 가능한 집계 함수(mean/LSTM/pooling)로 표현을 생성하는 귀납적(inductive) GNN. 학습에 없던 새 노드·새 그래프에도 일반화.
resource: https://arxiv.org/abs/1706.02216
tags: [graphsage, inductive, neighbor-sampling, aggregator, message-passing, minibatch, scalability]
authors: William L. Hamilton, Rex Ying, Jure Leskovec
venue: NeurIPS 2017
year: 2017
timestamp: 2026-06-22T00:00:00Z
---

# ⭐ Inductive Representation Learning on Large Graphs (GraphSAGE)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **NeurIPS 2017**

[← 카테고리](index.md) · 원문: [arXiv:1706.02216](https://arxiv.org/abs/1706.02216)

- **저자**: William L. Hamilton, Rex Ying, Jure Leskovec
- **발표처/연도**: NeurIPS 2017 (SAGE = **SA**mple and aggre**G**at**E**)

## 문제 (Problem)
[DeepWalk](deepwalk.md)/[GCN](gcn.md) 등은 학습 시 **전체 그래프**가 필요하고 노드별 임베딩을 **직접**
학습한다(**전이적, transductive**). 따라서 학습 후 등장한 **새 노드/새 그래프** 에는 임베딩을 줄 수 없고,
전체 인접행렬을 메모리에 올려야 해 대규모에 부적합하다.

## 방법 (Method)
임베딩 값 자체가 아니라 **이웃을 집계하는 함수** 를 학습한다(**귀납적, inductive**).
- 각 노드에서 **고정 크기로 이웃을 샘플링** → 미니배치로 대규모 그래프 학습(전체 인접행렬 불필요).
- 학습 가능한 **집계 함수(aggregator)**: **Mean / GCN / LSTM / Pooling(max)**.
- 지도(분류) 손실 또는 **비지도 그래프 기반 손실** 로 학습.

## 핵심 메커니즘 — GraphSAGE가 *실제로* 하는 것

> **한 줄 요약**: "노드 임베딩"이 아니라 **"이웃을 모아 표현을 만드는 함수(aggregator + $W$)"** 를
> 학습한다. 함수만 있으면 **학습 때 못 본 노드/그래프** 에도 즉석에서 임베딩을 계산할 수 있다.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| 무엇을 학습? | 노드별 **임베딩 벡터** | 이웃 **집계 함수(파라미터)** — 임베딩은 그 결과물 |
| 전이/귀납 | GCN처럼 전이적 | **귀납적** — 새 노드/그래프에 일반화 |
| 샘플링의 목적 | 정확도 향상 | **계산·메모리 상한**(미니배치, 고정 연산량) |
| GCN과 관계 | 무관 | **mean aggregator + 정규화** 는 GCN의 귀납·샘플링 버전에 가까움 |

### 단계별 메커니즘 (k = 1..K 홉)

$$
h_{\mathcal{N}(v)}^{k} = \text{AGG}_k\big(\{\,h_u^{k-1} : u \in \mathcal{N}_{\text{sampled}}(v)\,\}\big),\qquad
h_v^{k} = \sigma\Big(W^{k}\cdot \text{CONCAT}\big(h_v^{k-1},\, h_{\mathcal{N}(v)}^{k}\big)\Big)
$$

이후 $h_v^k \leftarrow h_v^k / \lVert h_v^k\rVert_2$ (정규화). 핵심은 **CONCAT** — 자기 표현과 이웃 표현을
분리해 결합한다(GCN의 단순 평균과 차이).

- **집계 함수 종류**: **Mean**(평균), **Pooling**(이웃을 MLP 후 원소별 max — 순열불변·표현력↑),
  **LSTM**(표현력 크나 순서 의존 → 이웃을 무작위 순열).
- **미니배치 샘플링**: 깊이별 표본 수 $S_1, S_2, \dots$ 를 정해 각 배치의 연산량을 **상수로 고정**.

### 비지도 손실 (그래프 기반, SGNS 계열)

$$
J(z_u) = -\log \sigma\big(z_u^\top z_v\big) \;-\; Q\cdot \mathbb{E}_{v_n \sim P_n}\big[\log \sigma(-\,z_u^\top z_{v_n})\big]
$$

여기서 `v` 는 `u` 와 **고정 길이 랜덤워크에서 함께 등장** 한 노드 — 즉 [DeepWalk](deepwalk.md)의 동시
등장 아이디어를 **집계 함수 학습** 에 그대로 가져온 것. (지도 학습이면 분류 교차엔트로피로 대체.)

### 왜 작동하나
- 집계 **함수** 는 그래프가 달라져도 재사용 가능 → 새 노드의 이웃만 있으면 임베딩 즉시 생성.
- 고정 표본 수 덕분에 노드 수·차수와 무관하게 **연산량이 제어** 되어 수억 규모로 확장.

### 한 줄 비유
> 사람마다 사진(임베딩)을 외워두는 게 아니라, **"주변을 보고 특징을 요약하는 방법(레시피)"** 을 배운다.
> 처음 보는 사람도 주변만 보면 바로 요약할 수 있다.

## 핵심 기여 (Contributions)
- **귀납적 표현학습**: 학습에 없던 노드/그래프에도 임베딩 생성.
- **이웃 샘플링 + 미니배치** 로 대규모 확장성.
- 메시지 패싱을 "샘플 후 집계(aggregator 일반화)" 프레임워크로 정식화.

## 결과·데이터셋 (Results)
인용(Web of Science), [Reddit](../../datasets/reddit-ppi.md), 단백질 상호작용
[PPI](../../datasets/reddit-ppi.md)(그래프 간 일반화)에서 귀납 설정 SOTA급. Pooling/LSTM aggregator가
Mean/GCN보다 대체로 우수.

## 관련 링크
- 개념: [귀납 vs 전이](../../concepts/overview.md), [이웃 샘플링·집계 함수](../../concepts/glossary.md)
- 비교: 고정 평균 [GCN](gcn.md) ↔ 어텐션 가중 [GAT](gat.md)
- 영향: 이종 샘플링 [HGT](../heterogeneous/hgt.md)(HGSampling)

---
[← 카테고리](index.md)
