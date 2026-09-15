---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Recipe for a General, Powerful, Scalable Graph Transformer (GraphGPS)"
description: 국소 메시지 패싱(MPNN)과 전역 어텐션을 매 층에서 결합하는 모듈형 그래프 트랜스포머 레시피. 위치/구조 인코딩(PE/SE) + 선형 어텐션으로 O(N+E) 확장성 확보.
resource: https://arxiv.org/abs/2205.12454
tags: [graph-transformer, hybrid, message-passing, global-attention, positional-encoding, linear-attention, scalability]
authors: Ladislav Rampášek, Mikhail Galkin, Vijay Prakash Dwivedi, Anh Tuan Luu, Guy Wolf, Dominique Beaini
venue: NeurIPS 2022
year: 2022
timestamp: 2026-06-30T00:00:00Z
---

# ⭐ Recipe for a General, Powerful, Scalable Graph Transformer (GraphGPS)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **NeurIPS 2022**

[← 카테고리](index.md) · 원문: [arXiv:2205.12454](https://arxiv.org/abs/2205.12454)

- **저자**: Ladislav Rampášek, Mikhail Galkin, Vijay P. Dwivedi, Anh Tuan Luu, Guy Wolf, Dominique Beaini
- **발표처/연도**: NeurIPS 2022 (GPS = **G**eneral, **P**owerful, **S**calable)

## 문제 (Problem)
[Graphormer](graphormer.md) 등 그래프 트랜스포머는 강하지만 ① 완전연결 어텐션이 **$O(N^2)$** 라 대규모에
못 쓰고, ② 설계가 제각각(ad hoc)이라 일반 원리가 없었다. **일반적·확장 가능한 레시피** 가 필요하다.

## 방법 (Method)
**국소(MPNN) + 전역(어텐션)** 을 매 층에서 **함께** 쓰고, 위치/구조 인코딩(PE/SE)을 얹는 **모듈형 레시피**.

## 핵심 메커니즘 — GraphGPS가 *실제로* 하는 것

> **한 줄 요약**: 그래프 트랜스포머 = "전역 어텐션만"이 아니다. **매 층에서 국소 MPNN(이웃 정밀)과 전역
> 어텐션(먼 노드 연결)을 병렬로 돌려 합친다.** 어텐션을 선형화하면 **$O(N+E)$**.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| 그래프 트랜스포머 = 전역 어텐션만 | 어텐션이 전부 | **MPNN(국소) + 어텐션(전역) 하이브리드** — 매 층 결합 |
| $O(N^2)$ 는 불가피 | 대규모 불가 | **선형 어텐션(Performer 등)** 으로 **$O(N+E)$** |
| 위치 인코딩은 옵션 | 없어도 됨 | **PE/SE 가 핵심** — 없으면 구조 신호↓·성능↓ |
| 고정 아키텍처 | 하나의 모델 | **모듈형 레시피** — 구성요소를 갈아끼움 |

### 레시피 3요소 (갈아끼우는 부품)
1. **PE/SE (위치·구조 인코딩)**: 라플라시안 고유벡터(LapPE), 랜덤워크 SE(RWSE) 등으로 노드에 위상 신호 주입.
2. **국소 MPNN**: GINE·GatedGCN 등 — **실제 엣지** 를 따라 이웃 집계.
3. **전역 어텐션**: Transformer 또는 **선형 어텐션(Performer)** — 모든 노드 간 장거리 연결.

한 층(요지):
$$X^{(l+1)} = \text{Combine}\big(\ \underbrace{\text{MPNN}(X^{(l)}, E, A)}_{\text{국소·실제 엣지}},\ \ \underbrace{\text{GlobalAttn}(X^{(l)})}_{\text{전역·완전연결}}\ \big)$$
국소(실제 엣지)와 전역(완전연결) 경로를 **분리** 했기에 선형 어텐션으로 전체를 **$O(N+E)$** 로 낮출 수 있다.

### 왜 작동하나
- MPNN이 **국소 구조·엣지 특징** 을 정밀히, 어텐션이 **장거리 의존성** 을 담당 → 상보적.
- PE/SE가 트랜스포머에 부족한 **위상 정보** 를 보충 → 표현력↑.
- 선형 어텐션으로 **대규모·롱레인지** 그래프까지 확장.

### 한 줄 비유
> 매 층에서 **국소 전문가(MPNN, 이웃을 꼼꼼히)** 와 **전역 조망가(어텐션, 먼 곳까지)** 를 **한 팀** 으로
> 쓰는 조립 레시피. 부품(PE·MPNN·어텐션)은 상황에 맞게 교체.

## 핵심 기여 (Contributions)
- **국소+전역 하이브리드** 그래프 트랜스포머의 일반 레시피(GPS) 정식화.
- **선형 어텐션** 으로 $O(N+E)$ 확장성 확보.
- PE/SE·MPNN·어텐션을 **모듈** 로 분리해 다양한 조합을 포괄.

## 결과·데이터셋 (Results)
ZINC, [OGB](../../datasets/ogb.md) 계열, 롱레인지 벤치마크(LRGB) 등 16개 벤치마크에서 경쟁력 있는 성능
*(구체 수치 원문 확인)*.

## 관련 링크
- 개념: [Graph Transformer·위치 인코딩](../../concepts/glossary.md), [동향(그래프 트랜스포머)](../../concepts/trends-and-challenges.md)
- 기반: [Graphormer](graphormer.md)(선구) · 국소 재료 [GAT](../foundations/gat.md)/[GIN](../foundations/gin.md)

---
[← 카테고리](index.md)
