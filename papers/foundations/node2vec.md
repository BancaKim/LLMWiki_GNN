---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "node2vec: Scalable Feature Learning for Networks"
description: 복귀(p)·인아웃(q) 파라미터로 제어되는 2차(biased) 랜덤워크로 BFS(구조적 동등성)와 DFS(동질성) 탐색을 보간하는 노드 임베딩. DeepWalk의 일반화.
resource: https://arxiv.org/abs/1607.00653
tags: [random-walk, node-embedding, skipgram, biased-walk, link-prediction]
authors: Aditya Grover, Jure Leskovec
venue: KDD 2016
year: 2016
timestamp: 2026-06-19T00:00:00Z
---

# ⭐ node2vec: Scalable Feature Learning for Networks

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **KDD 2016**

[← 카테고리](index.md) · 원문: [arXiv:1607.00653](https://arxiv.org/abs/1607.00653)

- **저자**: Aditya Grover, Jure Leskovec
- **발표처/연도**: KDD 2016

## 문제 (Problem)
[DeepWalk](deepwalk.md) 의 단순(균일) 랜덤워크는 탐색 전략이 고정되어, 그래프의 **두 가지 상보적 유사성**
— 같은 커뮤니티(동질성, homophily)와 같은 구조적 역할(structural equivalence) — 을 동시에 잡기 어렵다.

## 방법 (Method)
**유연한 2차(biased) 랜덤워크** 로 이웃 표본을 다양화한다.
- 워크의 다음 스텝을 두 파라미터로 제어:
  - **복귀 파라미터 p (return)**: 직전 노드로 되돌아갈 경향.
  - **인아웃 파라미터 q (in-out)**: 가까이 머물지(BFS), 멀리 나아갈지(DFS) 결정.
- p·q 조절로 **BFS(구조적 동등성)** ↔ **DFS(동질성)** 사이를 매끄럽게 **보간(interpolate)**.
- 생성된 워크에 **SkipGram** 을 적용해 임베딩 학습 (DeepWalk와 동일한 골격, 워크 샘플링만 일반화).

## 핵심 기여 (Contributions)
- 검색 편향을 조절하는 **편향 랜덤워크** 로 DeepWalk를 일반화.
- 하나의 임베딩으로 **노드 분류와 링크 예측** 을 모두 강하게 수행.
- 엣지 임베딩을 위한 이항 연산자(Hadamard 등) 제시.

## 결과·데이터셋 (Results)
[BlogCatalog](../../datasets/blogcatalog.md), [PPI](../../datasets/reddit-ppi.md), Wikipedia 등에서
다중 라벨 분류·링크 예측 성능 향상을 보고. p·q 탐색으로 데이터셋별 최적 편향을 찾을 수 있음을 보임.

## 관련 링크
- 개념: [노드 임베딩·랜덤워크](../../concepts/glossary.md), [동질성·구조적 동등성](../../concepts/overview.md)
- 기반: [DeepWalk](deepwalk.md) · 이종 확장: [metapath2vec](../heterogeneous/metapath2vec.md)

---
[← 카테고리](index.md)
