---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Hypergraph Neural Networks (HGNN)"
description: 하이퍼엣지(3개 이상 노드를 동시에 잇는 엣지)로 고차(high-order) 상관을 표현하고, 하이퍼그래프 라플라시안 기반 스펙트럼 합성곱으로 학습. 다중 모달·복잡 관계를 자연스럽게 인코딩.
resource: https://arxiv.org/abs/1809.09401
tags: [hypergraph, high-order, spectral, hypergraph-laplacian, multi-modal]
authors: Yifan Feng, Haoxuan You, Zizhao Zhang, Rongrong Ji, Yue Gao
venue: AAAI 2019
year: 2019
timestamp: 2026-06-19T00:00:00Z
---

# ⭐ Hypergraph Neural Networks (HGNN)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **AAAI 2019**

[← 카테고리](index.md) · 원문: [arXiv:1809.09401](https://arxiv.org/abs/1809.09401)

- **저자**: Yifan Feng, Haoxuan You, Zizhao Zhang, Rongrong Ji, Yue Gao
- **발표처/연도**: AAAI 2019

## 문제 (Problem)
일반 그래프의 엣지는 **딱 두 노드** 만 잇는다(pairwise). 하지만 현실 데이터의 관계는 종종 **여러 객체가
동시에 묶이는 고차(high-order)** 관계다(예: 한 논문의 공저자 집합, 한 클래스의 유사 객체들). 또 여러
**모달(특징)** 을 한 구조로 통합하기 어렵다. [GCN](../foundations/gcn.md) 은 이런 고차 상관을 직접 담지 못한다.

## 방법 (Method)
**하이퍼그래프(hypergraph)** — 하나의 **하이퍼엣지(hyperedge)** 가 **임의 개수의 노드** 를 동시에 연결 —
위에서 합성곱을 정의한다.
- 데이터로부터 하이퍼엣지를 구성(예: 각 노드의 k-최근접 이웃을 하나의 하이퍼엣지로) → **여러 모달/특징을
  하이퍼엣지 그룹** 으로 통합 가능.
- **하이퍼그래프 라플라시안** 에 기반한 스펙트럼 **하이퍼그래프 합성곱(hyperedge convolution)** 층:
  노드→하이퍼엣지→노드 의 2단계 집계로 고차 상관을 전파.
- 가중 인접/차수 행렬로 정규화해 안정적 학습.

## 핵심 기여 (Contributions)
- 신경망을 **하이퍼그래프** 로 확장해 **고차·복잡 관계** 를 직접 인코딩.
- 하이퍼엣지 그룹으로 **다중 모달 특징 융합**.
- GCN을 하이퍼그래프의 특수 케이스로 포괄(엣지가 2-노드면 일반 그래프).

## 결과·데이터셋 (Results)
인용 네트워크 노드 분류([Cora 등](../../datasets/cora-citeseer-pubmed.md))와 **시각 객체 분류**
(ModelNet40, NTU 3D 형상)에서 GCN 등 대비 향상을 보고. 특히 다중 특징을 합칠 때 이득이 컸다.

## 관련 링크
- 개념: [하이퍼그래프·고차 관계](../../concepts/glossary.md), [분류 체계(그래프 구조 축)](../../concepts/taxonomy.md)
- 기반: [GCN](../foundations/gcn.md)(스펙트럼 합성곱)
- 인접 주제(하이퍼관계 KG): [StarE](stare.md)

---
[← 카테고리](index.md)
