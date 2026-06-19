---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "RotatE: Knowledge Graph Embedding by Relational Rotation in Complex Space"
description: 관계를 복소공간에서의 회전으로 모델링(t = h ∘ r, |r|=1)해 대칭/반대칭·역·합성 관계 패턴을 모두 표현. 자기적대적 네거티브 샘플링을 도입.
resource: https://arxiv.org/abs/1902.10197
tags: [knowledge-graph, kg-embedding, rotation, complex-space, relation-patterns, link-prediction]
authors: Zhiqing Sun, Zhi-Hong Deng, Jian-Yun Nie, Jian Tang
venue: ICLR 2019
year: 2019
timestamp: 2026-06-19T00:00:00Z
---

# ⭐ RotatE: Knowledge Graph Embedding by Relational Rotation in Complex Space

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **ICLR 2019**

[← 카테고리](index.md) · 원문: [arXiv:1902.10197](https://arxiv.org/abs/1902.10197)

- **저자**: Zhiqing Sun, Zhi-Hong Deng, Jian-Yun Nie, Jian Tang
- **발표처/연도**: ICLR 2019

## 문제 (Problem)
KG에는 **대칭(symmetry)·반대칭(antisymmetry)·역(inversion)·합성(composition)** 같은 관계 패턴이 흔하다.
[TransE](transe.md)(평행이동)는 대칭 관계를, DistMult(내적)는 반대칭을 표현하지 못하는 등, 한 모델이
이들 패턴을 **모두** 담기 어려웠다.

## 방법 (Method)
관계를 **복소공간에서의 회전(rotation)** 으로 본다.
- 핵심 식: **t = h ∘ r**, 여기서 ∘ 는 원소별(complex) 곱이고 각 관계 성분의 **모듈러스는 1**(|r_i| = 1)
  → 관계는 head 를 복소평면에서 **위상(phase)만큼 회전** 시키는 연산.
- 점수: ‖h ∘ r − t‖. 회전 각도로 다양한 패턴을 표현:
  - 대칭(r² = 1, 위상 0 또는 π), 반대칭, 역(역회전), **합성(위상의 덧셈)** 모두 자연스럽게 모델링.
- **자기적대적 네거티브 샘플링(self-adversarial negative sampling)**: 현재 모델 점수에 비례해
  네거티브 표본을 가중 → 학습 효율·성능 향상.

## 핵심 기여 (Contributions)
- 단일 모델로 **대칭/반대칭/역/합성** 관계 패턴을 모두 표현(이론적 근거 제시).
- **자기적대적 네거티브 샘플링** 기법 제안 (다른 KG 모델에도 널리 채택됨).

## 결과·데이터셋 (Results)
[FB15k-237, WN18RR](../../datasets/fb15k-237-wn18rr.md)(및 FB15k, WN18, Countries)에서 링크 예측
**MRR / Hits@1,3,10** 기준 당시 SOTA급.

## 관련 링크
- 개념: [KG 임베딩·관계 패턴·MRR/Hits@k](../../concepts/glossary.md)
- 비교/기반: [TransE](transe.md)(이동) · GNN 인코더 결합 [CompGCN](compgcn.md)

---
[← 카테고리](index.md)
