---
type: Dataset
title: BlogCatalog
description: 블로거 소셜 네트워크의 다중 라벨 노드 분류 데이터셋. 노드 특징 없이 그래프 구조만으로 임베딩 품질을 보는 랜덤워크 임베딩(DeepWalk·node2vec)의 대표 벤치마크.
resource: https://snap.stanford.edu/node2vec/
tags: [dataset, social-network, multi-label, node-embedding, random-walk, benchmark]
timestamp: 2026-06-19T00:00:00Z
---

# BlogCatalog

[← 데이터셋 카탈로그](index.md)

## 개요
블로그 작성자(블로거)들의 **소셜 네트워크**. 노드 = 사용자, 엣지 = 친구/팔로우 관계, 라벨 = 사용자가
등록한 **관심 주제(여러 개, 다중 라벨)**. 노드 특징(feature)이 없어 **순수하게 그래프 구조** 로부터
임베딩 품질을 평가하기에 적합하다.

## 특징
- **다중 라벨 노드 분류**: 한 노드가 여러 라벨을 가질 수 있음 → **Micro/Macro-F1** 로 평가.
- 특징이 없으므로 **랜덤워크 임베딩**([DeepWalk](../papers/foundations/deepwalk.md),
  [node2vec](../papers/foundations/node2vec.md))의 강점(구조만으로 임베딩)을 보여주는 표준 벤치마크.
- 라벨 비율을 바꿔가며 **소량 라벨에서의 성능** 을 비교하는 데 자주 쓰임.

## 이 데이터셋을 쓰는 논문
- [DeepWalk](../papers/foundations/deepwalk.md), [node2vec](../papers/foundations/node2vec.md)
  (함께 Flickr·YouTube·Wikipedia 등도 사용)

> 관련 개념: [랜덤워크·노드 임베딩](../concepts/glossary.md) · [평가지표(F1)](../concepts/datasets-overview.md)

---
[← 데이터셋 카탈로그](index.md) · [KG 벤치마크: FB15k-237/WN18RR →](fb15k-237-wn18rr.md)
