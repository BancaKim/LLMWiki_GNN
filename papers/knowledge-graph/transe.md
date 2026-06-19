---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Translating Embeddings for Modeling Multi-relational Data (TransE)"
description: 관계를 임베딩 공간의 평행이동(translation)으로 보는 KG 임베딩. h + r ≈ t. 단순·확장 가능해 지식그래프 임베딩의 사실상 출발점이 됨.
resource: https://papers.nips.cc/paper/5071-translating-embeddings-for-modeling-multi-relational-data
tags: [knowledge-graph, kg-embedding, translation, link-prediction, triple]
authors: Antoine Bordes, Nicolas Usunier, Alberto Garcia-Durán, Jason Weston, Oksana Yakhnenko
venue: NeurIPS 2013
year: 2013
timestamp: 2026-06-19T00:00:00Z
---

# ⭐ Translating Embeddings for Modeling Multi-relational Data (TransE)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **NeurIPS (NIPS) 2013**

[← 카테고리](index.md) · 원문: [NeurIPS 2013](https://papers.nips.cc/paper/5071-translating-embeddings-for-modeling-multi-relational-data)

- **저자**: Antoine Bordes, Nicolas Usunier, Alberto Garcia-Durán, Jason Weston, Oksana Yakhnenko
- **발표처/연도**: NeurIPS 2013

## 문제 (Problem)
지식그래프는 **(head, relation, tail)** 삼중항(triple)들의 집합이다. 다관계 데이터를 임베딩하는 기존
방법은 파라미터가 많고 학습이 무거워 **대규모 KG** 에 비현실적이었다.

## 방법 (Method)
관계를 임베딩 공간의 **평행이동(translation)** 으로 모델링한다.
- 핵심 식: **h + r ≈ t** (참인 삼중항이면 head 벡터에 relation 벡터를 더하면 tail 에 가까워야 함).
- 점수(거리) 함수: **d(h+r, t) = ‖h + r − t‖** (L1/L2). 작을수록 참에 가깝다.
- **마진 기반 랭킹 손실** 과 **네거티브 샘플링**(head/tail 손상)으로 참 삼중항이 거짓보다 낮은 거리를 갖도록 학습.

## 핵심 기여 (Contributions)
- 극도로 **단순하고 확장 가능한** KG 임베딩 → 이후 수많은 Trans* / 거리 기반 모델의 기초.
- 관계를 기하학적 **이동** 으로 해석하는 직관 제공.

## 결과·데이터셋 (Results)
[FB15k, WN18](../../datasets/fb15k-237-wn18rr.md) 등에서 **링크 예측(엔티티 랭킹)** 으로 평가
(지표: Mean Rank, **Hits@10**). 단순함에도 강한 성능을 보였다.

## 한계 (이후 모델의 동기)
- **1-to-N, N-to-1, N-to-N, 대칭(symmetric)** 관계를 잘 못 다룬다(h+r≈t 제약의 한계).
  → 복소 회전으로 대칭/역/합성을 다룬 [RotatE](rotate.md), 메시지 패싱으로 구조까지 쓰는
  [CompGCN](compgcn.md) 으로 발전.

## 관련 링크
- 개념: [지식그래프·KG 임베딩·링크 예측 지표](../../concepts/glossary.md)
- 발전: [RotatE](rotate.md), [R-GCN](rgcn.md), [CompGCN](compgcn.md)

---
[← 카테고리](index.md)
