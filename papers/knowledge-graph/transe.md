---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Translating Embeddings for Modeling Multi-relational Data (TransE)"
description: 관계를 임베딩 공간의 평행이동(translation)으로 보는 KG 임베딩. h + r ≈ t. 단순·확장 가능해 지식그래프 임베딩의 사실상 출발점이 됨.
resource: https://papers.nips.cc/paper/5071-translating-embeddings-for-modeling-multi-relational-data
tags: [knowledge-graph, kg-embedding, translation, margin-loss, negative-sampling, link-prediction]
authors: Antoine Bordes, Nicolas Usunier, Alberto Garcia-Durán, Jason Weston, Oksana Yakhnenko
venue: NeurIPS 2013
year: 2013
timestamp: 2026-06-22T00:00:00Z
---

# ⭐ Translating Embeddings for Modeling Multi-relational Data (TransE)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **NeurIPS (NIPS) 2013**

[← 카테고리](index.md) · 원문: [NeurIPS 2013](https://papers.nips.cc/paper/5071-translating-embeddings-for-modeling-multi-relational-data)

- **저자**: Antoine Bordes, Nicolas Usunier, Alberto Garcia-Durán, Jason Weston, Oksana Yakhnenko
- **발표처/연도**: NeurIPS 2013

## 문제 (Problem)
지식그래프는 **(head, relation, tail)** 삼중항(triple)들의 집합이다. 기존 다관계 임베딩은 파라미터가
많고(관계마다 행렬 등) 학습이 무거워 **대규모 KG** 에 비현실적이었다.

## 방법 (Method)
관계를 임베딩 공간의 **평행이동(translation)** 으로 모델링한다: 참인 삼중항이면 **h + r ≈ t**.

## 핵심 메커니즘 — TransE가 *실제로* 하는 것

> **한 줄 요약**: $h+r=t$ 를 **정확히** 맞추는 게 아니라, 참 삼중항의 거리 $\lVert h+r-t\rVert$ 가
> 거짓보다 **마진만큼 작아지도록** 순위를 학습하는 **거리/에너지 모델** 이다.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| $h+r=t$ | 등식을 정확히 만족 | **근사** — 거리를 줄이는 랭킹 학습(에너지 기반) |
| 모든 관계 OK | 어떤 관계든 표현 | **대칭·1:N·N:1·N:N·재귀** 관계는 기하적으로 표현 불가 |
| 학습 신호 | 참 삼중항만 | **참 vs 손상(거짓)** 의 마진 랭킹(네거티브 샘플링) |
| 정규화 | 불필요 | **엔티티 임베딩을 단위 노름** 으로 강제(자명해 방지) |

### 점수·손실

$$f(h,r,t) = -\lVert h + r - t\rVert_{1/2}\qquad(\text{작은 거리 = 높은 점수})$$

$$\mathcal{L} = \sum_{(h,r,t)\in S}\ \sum_{(h',r,t')\in S'}\big[\gamma + d(h+r,\,t) - d(h'+r,\,t')\big]_{+}$$

- $S'$ 는 head 나 tail 을 무작위로 바꾼 **손상 삼중항**, $\gamma$ 는 마진, $[\cdot]_+=\max(0,\cdot)$.
- 매 배치마다 엔티티 벡터를 **L2 정규화**(노름=1)해 거리를 무한정 줄이는 자명해를 막는다.

### 왜 한계가 생기나 (후속 모델의 동기)
- **대칭 관계** $r$: $(h,r,t)$ 와 $(t,r,h)$ 가 동시에 참이면 $h+r=t$ 와 $t+r=h$ → $r=0,\ h=t$ 로 붕괴.
- **N:1** (여러 head 가 같은 $(r,t)$): 모든 head 가 같은 벡터로 수렴 → 구분 불가.
  → 복소 회전으로 대칭/역/합성을 다루는 [RotatE](rotate.md), 이웃 구조까지 쓰는 [CompGCN](compgcn.md) 으로 발전.

### 한 줄 비유
> 관계를 **"한 방향으로의 이동 벡터"** 로 본다: *서울 + (수도→나라) ≈ 한국*. 단, "이동"으로는
> 양방향(대칭) 관계를 표현할 수 없다.

## 핵심 기여 (Contributions)
- 극도로 **단순하고 확장 가능한** KG 임베딩 → 이후 수많은 Trans*/거리 기반 모델의 기초.
- 관계를 기하학적 **이동** 으로 해석하는 직관 제공.

## 결과·데이터셋 (Results)
[FB15k, WN18](../../datasets/fb15k-237-wn18rr.md) 등에서 **링크 예측(엔티티 랭킹)** 으로 평가
(지표: Mean Rank, **Hits@10**). 단순함에도 강한 성능.

## 관련 링크
- 개념: [KG 임베딩·관계 패턴·MRR/Hits@k·마진 랭킹 손실](../../concepts/glossary.md)
- 발전: [RotatE](rotate.md), [R-GCN](rgcn.md), [CompGCN](compgcn.md)

---
[← 카테고리](index.md)
