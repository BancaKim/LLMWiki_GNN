---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Do Transformers Really Perform Badly for Graph Representation? (Graphormer)"
description: 표준 트랜스포머에 그래프 구조를 3가지 인코딩(centrality·spatial·edge)으로 주입해 그래프에서 SOTA를 달성한 그래프 트랜스포머. 어텐션 bias로 위상을 표현하고 OGB-LSC를 석권.
resource: https://arxiv.org/abs/2106.05234
tags: [graph-transformer, attention, spatial-encoding, centrality-encoding, structural-encoding, molecular]
authors: Chengxuan Ying, Tianle Cai, Shengjie Luo, Shuxin Zheng, Guolin Ke, Di He, Yanming Shen, Tie-Yan Liu
venue: NeurIPS 2021
year: 2021
timestamp: 2026-06-30T00:00:00Z
---

# ⭐ Do Transformers Really Perform Badly for Graph Representation? (Graphormer)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **NeurIPS 2021**

[← 카테고리](index.md) · 원문: [arXiv:2106.05234](https://arxiv.org/abs/2106.05234)

- **저자**: Chengxuan Ying, Tianle Cai, Shengjie Luo, Shuxin Zheng, Guolin Ke, Di He, Yanming Shen, Tie-Yan Liu
- **발표처/연도**: NeurIPS 2021

## 문제 (Problem)
트랜스포머는 NLP·비전을 석권했지만 그래프에선 성능이 나빴다. 원인: 표준 셀프 어텐션은 **모든 노드가 모든
노드를 보되 그래프 구조(위상)를 전혀 모른다** — "누가 누구와 연결됐는지, 얼마나 가까운지"가 사라진다.

## 방법 (Method)
표준 트랜스포머에 **그래프 구조를 3가지 인코딩** 으로 주입한다.

## 핵심 메커니즘 — Graphormer가 *실제로* 하는 것

> **한 줄 요약**: 어텐션을 버리지 않고, **각 어텐션 점수에 "두 노드의 거리·상대 인기·엣지 정보"를 bias로
> 더해** 위상을 잊지 않게 한다. → 제목의 답은 **"아니요, 구조만 넣으면 오히려 SOTA"**.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| 그래프엔 트랜스포머 부적합 | 성능 나쁨 | **구조 인코딩만 넣으면** SOTA(OGB-LSC 우승) |
| 어텐션은 구조를 못 씀 | 위상 소실 | **spatial/centrality/edge bias** 로 위상 주입 |
| 메시지 패싱이 있어야 국소성 | 국소 상실 | **최단경로 거리 bias** 가 국소·전역을 함께 반영 |
| 표현력 한계 | MPNN과 동급 | 적절한 인코딩 시 [GCN](../foundations/gcn.md)/[GIN](../foundations/gin.md) 을 **특수 케이스로 포괄** |

### 세 가지 구조 인코딩
1. **Centrality encoding(중심성)**: 노드 **차수(degree)** 로 학습형 임베딩을 입력에 더함 → 노드 중요도.
2. **Spatial encoding(공간)**: 두 노드 $i,j$ 의 **최단경로 거리 $\phi(i,j)$** 마다 학습형 스칼라 bias
   $b_{\phi(i,j)}$ 를 어텐션에 더함 → 구조적 관계.
3. **Edge encoding(엣지)**: $i{\to}j$ 최단경로 위 **엣지 특징** 을 bias로 반영.

어텐션 점수(요지):
$$A_{ij} = \frac{(h_i W_Q)(h_j W_K)^\top}{\sqrt{d}} \;+\; \underbrace{b_{\phi(i,j)}}_{\text{거리 bias}} \;+\; \underbrace{c_{ij}}_{\text{엣지 bias}}$$
그래프 수준 예측을 위해 모든 노드와 연결된 **가상 노드([VNode])** 를 두어 readout.

### 왜 작동하나
- **전역 어텐션** 이라 먼 노드도 직접 연결 → 메시지 패싱의 오버스무딩·장거리 한계를 완화.
- **거리 bias** 가 "가까운 이웃은 크게, 먼 노드는 작게" 자연히 반영해 구조를 유지.

### 한 줄 비유
> 일반 트랜스포머 = "모두가 모두에게 귓속말(위치 감각 없음)". Graphormer = 그 귓속말마다 **"둘 사이 거리와
> 상대 인기"** 를 덧붙여 지도(구조)를 잊지 않게 함.

## 핵심 기여 (Contributions)
- 표준 트랜스포머 + **구조 인코딩 3종** 으로 그래프에서 트랜스포머가 **SOTA** 임을 입증.
- 어텐션 **bias 로 위상(거리·중심성·엣지)** 을 주입하는 일반적 방법.
- 이론적으로 여러 MPNN을 **특수 케이스로 포괄**.

## 결과·데이터셋 (Results)
분자 물성 대회 **OGB-LSC (PCQM4M)** 우승 및 MolHIV 등에서 SOTA *(구체 수치 원문 확인)*.
→ [OGB](../../datasets/ogb.md).

## 한계·후속
- 완전연결 어텐션이라 **$O(N^2)$** — 대규모 그래프에 부담. → [GraphGPS](graphgps.md) 가 국소 MPNN+선형
  어텐션 하이브리드로 확장성 해결.

## 관련 링크
- 개념: [Graph Transformer·어텐션](../../concepts/glossary.md), [동향(그래프 트랜스포머)](../../concepts/trends-and-challenges.md)
- 기반/비교: [GAT](../foundations/gat.md)(어텐션)·[GIN](../foundations/gin.md)(표현력) · 이종판 [HGT](../heterogeneous/hgt.md)
- 발전: [GraphGPS](graphgps.md)

---
[← 카테고리](index.md)
