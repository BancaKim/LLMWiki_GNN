---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Semi-Supervised Classification with Graph Convolutional Networks (GCN)"
description: 스펙트럼 그래프 합성곱의 1차 근사로 유도한 단순·확장 가능한 층별 전파 규칙. 재정규화(renormalization) 트릭으로 준지도 노드 분류의 표준 베이스라인이 됨.
resource: https://arxiv.org/abs/1609.02907
tags: [gcn, spectral, message-passing, low-pass-filter, oversmoothing, semi-supervised, node-classification, transductive]
authors: Thomas N. Kipf, Max Welling
venue: ICLR 2017
year: 2017
timestamp: 2026-06-22T00:00:00Z
---

# ⭐ Semi-Supervised Classification with Graph Convolutional Networks (GCN)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **ICLR 2017**

[← 카테고리](index.md) · 원문: [arXiv:1609.02907](https://arxiv.org/abs/1609.02907)

- **저자**: Thomas N. Kipf, Max Welling
- **발표처/연도**: ICLR 2017

## 문제 (Problem)
그래프에서 **일부 노드만 라벨이 있을 때(준지도)** 나머지를 분류하고 싶다. 기존 스펙트럼 그래프 합성곱은
라플라시안 **고유분해(eigendecomposition)** 비용이 크고($O(n^3)$), 필터가 **비국소적(non-localized)** 이라
대규모·실용 적용이 어려웠다.

## 방법 (Method)
스펙트럼 합성곱을 **체비셰프 다항식의 1차(K=1) 근사** 로 단순화해, 다음의 가벼운 **층별 전파 규칙** 을 얻는다:

$$H^{(l+1)} = \sigma\!\left(\tilde{D}^{-1/2}\,\tilde{A}\,\tilde{D}^{-1/2}\,H^{(l)}\,W^{(l)}\right)$$

- **재정규화(renormalization) 트릭**: $\tilde{A} = A + I$ (자기 루프 추가), $\tilde{D}$ 는 그 차수 행렬.
- 2층 GCN + 교차엔트로피로 준지도 노드 분류를 end-to-end 학습.

## 핵심 메커니즘 — GCN이 *실제로* 하는 것

> **한 줄 요약**: 추론 시 고유분해는 **전혀 필요 없다.** 각 층은 **대칭 정규화된 이웃 평균(저역통과
> 필터/라플라시안 스무딩) + 선형변환 + 비선형** 일 뿐이다.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| "스펙트럼" | 매번 라플라시안 **고유분해 필요** | 1차 근사로 **고유분해 제거** → 희소 행렬곱만 |
| 한 층의 정체 | 복잡한 주파수 필터 | **이웃 평균(저역통과)** + $W$ + $\sigma$ |
| 깊을수록 좋다 | 층 많이 쌓기 | **2~3층이 최적** — 더 쌓으면 **오버스무딩** |
| self-loop | 장식 | **자기 정보 보존**(없으면 자신을 못 봄)을 위한 핵심 |

### 유도 한눈에 보기
스펙트럼 필터 $g_\theta \star x \approx \sum_k \theta_k T_k(\tilde{L})x$ (체비셰프)에서 **K=1**,
$\lambda_{max}\approx 2$, $\theta_0=-\theta_1=\theta$ 로 두면
$\theta\big(I + D^{-1/2}AD^{-1/2}\big)x$ 가 된다. 고윳값 범위가 $[0,2]$ 라 깊게 쌓으면 수치 불안정 →
**재정규화** $I + D^{-1/2}AD^{-1/2}\;\rightarrow\;\tilde{D}^{-1/2}\tilde{A}\tilde{D}^{-1/2}$ ($\tilde A=A+I$).

### 왜 작동하나 (그리고 왜 한계가 있나)
- **동질성(homophily)** 그래프에서는 이웃 평균이 **특징 잡음을 제거(denoising)** 해 같은 클래스가 뭉친다.
- 그러나 이웃 평균을 **반복** 하면 모든 노드 표현이 서로 닮아간다 → **오버스무딩(over-smoothing)**,
  깊은 GCN의 성능 저하 원인.
- 가중치가 차수로 **고정**($1/\sqrt{d_i d_j}$)되어 이웃별 중요도를 학습하지 못함 → [GAT](gat.md) 가 어텐션으로 해결.

### 한 줄 비유
> 각 노드가 **"자신과 이웃의 의견을 (정해진 비율로) 평균 내어 갱신"** 하는 합의 과정. 너무 여러 번
> 평균 내면 모두가 똑같은 말을 하게 된다(오버스무딩).

## 핵심 기여 (Contributions)
- 스펙트럼 이론에서 **실용적이고 확장 가능한 GNN 층** 을 유도 — 이후 GNN의 사실상 표준 베이스라인.
- **재정규화 트릭** 으로 안정적 학습.
- 준지도 노드 분류에서 단순한 구조로 강한 성능.

## 한계·후속
- 학습에 전체 인접행렬이 필요한 **전이적(transductive)** 설정, **미관측 노드(귀납)** 에 약함 →
  [GraphSAGE](graphsage.md) 가 샘플+집계로 해결.
- 고정 가중 평균 → 이웃 중요도 학습은 [GAT](gat.md).
- 단일 관계 가정 → 다관계 KG는 [R-GCN](../knowledge-graph/rgcn.md)·[CompGCN](../knowledge-graph/compgcn.md),
  고차 관계는 [HGNN](../hypergraph/hgnn.md).

## 결과·데이터셋 (Results)
인용 네트워크 [Cora / Citeseer / Pubmed](../../datasets/cora-citeseer-pubmed.md) 와 NELL 에서 당시 SOTA급
정확도.

## 관련 링크
- 개념: [메시지 패싱·스펙트럼 합성곱·오버스무딩](../../concepts/glossary.md), [전이 vs 귀납](../../concepts/overview.md)

---
[← 카테고리](index.md)
