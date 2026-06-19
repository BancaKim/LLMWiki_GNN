---
type: Dataset
title: OGB (Open Graph Benchmark)
description: 대규모·표준화된 그래프 ML 벤치마크 모음. 노드/링크/그래프 예측 과제를 통일된 분할·평가 프로토콜로 제공해 GNN 모델 비교의 공정성을 높임.
resource: https://ogb.stanford.edu/
tags: [dataset, benchmark, large-scale, ogb, standardized-evaluation]
timestamp: 2026-06-19T00:00:00Z
---

# OGB (Open Graph Benchmark)

[← 데이터셋 카탈로그](index.md)

## 개요
**Open Graph Benchmark(OGB)** 는 Stanford 등에서 만든 **대규모·표준화** 그래프 머신러닝 벤치마크 모음이다.
Cora/Citeseer 같은 소규모 데이터셋의 한계(작은 규모, 비표준 분할, 재현성 문제)를 보완해, **통일된 데이터
분할과 평가 프로토콜** 로 모델을 공정하게 비교하도록 설계되었다.

## 과제 트랙
- **노드 속성 예측(node)** — 예: `ogbn-arxiv`, `ogbn-products`, `ogbn-papers100M`(1억+ 노드).
- **링크 속성 예측(link)** — 예: `ogbl-ppa`, `ogbl-collab`, `ogbl-citation2`.
- **그래프 속성 예측(graph)** — 예: `ogbg-molhiv`, `ogbg-molpcba`(분자 그래프).

## 특징
- **표준 분할·평가기(Evaluator)** 제공 → 논문 간 수치 비교의 신뢰성↑ (
  [평가 표준화 문제](../concepts/datasets-overview.md) 의 대응).
- **현실적 분할**: 예컨대 시간 기준 분할로 일반화를 엄격히 평가.
- 대규모(`papers100M` 등)로 **확장성** 을 직접 시험.

## 위치
이 번들의 기반 논문(대부분 2013–2020)은 주로 Cora/FB15k 등을 썼지만, 그 이후 GNN 비교의 사실상 표준이
OGB로 옮겨갔다. → [동향·과제](../concepts/trends-and-challenges.md) 참고.

> 관련 개념: [확장성·평가 표준화](../concepts/trends-and-challenges.md) · [과제 유형](../concepts/datasets-overview.md)

---
[← 데이터셋 카탈로그](index.md)
