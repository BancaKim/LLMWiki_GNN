---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Hypergraph Neural Networks (HGNN)"
description: 하이퍼엣지(3개 이상 노드를 동시에 잇는 엣지)로 고차(high-order) 상관을 표현하고, 하이퍼그래프 라플라시안 기반 스펙트럼 합성곱으로 학습. 다중 모달·복잡 관계를 자연스럽게 인코딩.
resource: https://arxiv.org/abs/1809.09401
tags: [hypergraph, high-order, spectral, hypergraph-laplacian, incidence-matrix, multi-modal]
authors: Yifan Feng, Haoxuan You, Zizhao Zhang, Rongrong Ji, Yue Gao
venue: AAAI 2019
year: 2019
timestamp: 2026-06-22T00:00:00Z
---

# ⭐ Hypergraph Neural Networks (HGNN)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **AAAI 2019**

[← 카테고리](index.md) · 원문: [arXiv:1809.09401](https://arxiv.org/abs/1809.09401)

- **저자**: Yifan Feng, Haoxuan You, Zizhao Zhang, Rongrong Ji, Yue Gao
- **발표처/연도**: AAAI 2019

## 문제 (Problem)
일반 그래프의 엣지는 **딱 두 노드** 만 잇는다(pairwise). 하지만 현실 관계는 종종 **여러 객체가 동시에
묶이는 고차(high-order)** 관계다(예: 한 논문의 공저자 집합, 유사한 객체들의 그룹). [GCN](../foundations/gcn.md)
은 이런 고차 상관과 **다중 모달(여러 특징)** 융합을 직접 담지 못한다.

## 방법 (Method)
**하이퍼그래프** — 하나의 **하이퍼엣지(hyperedge)** 가 **임의 개수의 노드** 를 동시에 연결 — 위에서
스펙트럼 합성곱을 정의한다.

## 핵심 메커니즘 — HGNN이 *실제로* 하는 것

> **한 줄 요약**: 하이퍼엣지를 **클릭(clique)으로 펼치지 않고**, 인시던스 행렬 $H$ 로 **노드→하이퍼엣지→
> 노드 2단계 집계** 를 수행한다 — 하이퍼그래프 라플라시안에서 유도된 합성곱.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| 하이퍼그래프 = 클릭 | 하이퍼엣지를 완전그래프로 펼침 | 펼치면 **고차 정보 손실** — HGNN은 $H$ 로 직접 처리 |
| 합성곱 정의 | 임의 휴리스틱 | **하이퍼그래프 정규화 라플라시안** 에서 유도 |
| 집계 | 1단계 이웃 평균 | **2단계**(노드→하이퍼엣지→노드) |
| 하이퍼엣지 구성 | 주어짐 | 보통 **데이터로 구성**(kNN/특징/멀티모달 그룹) |

### 구성 요소
- **인시던스 행렬 $H\in\{0,1\}^{|V|\times|E|}$**: $H_{ve}=1$ ⟺ 노드 $v$ 가 하이퍼엣지 $e$ 에 속함.
- $W$: 하이퍼엣지 가중치(대각), $D_v$: 노드 차수, $D_e$: 하이퍼엣지 차수(대각).

### 하이퍼엣지 합성곱 (전파 규칙)

$$X^{(l+1)} = \sigma\Big(D_v^{-1/2}\,H\,W\,D_e^{-1}\,H^\top\,D_v^{-1/2}\,X^{(l)}\,\Theta^{(l)}\Big)$$

읽는 순서가 곧 **2단계 집계**:
1. $H^\top X$ → 각 **하이퍼엣지** 가 속한 노드들의 특징을 모음(노드→하이퍼엣지).
2. $H(\cdots)$ → 그 하이퍼엣지 특징을 다시 노드로 분배(하이퍼엣지→노드).
3. $D_v,D_e,W$ 로 정규화, $\Theta$ 로 선형변환.

### 멀티모달 융합
서로 다른 모달(특징)에서 만든 하이퍼엣지 그룹을 **이어 붙여(concatenate)** 하나의 $H$ 로 합치면,
여러 모달의 고차 관계를 **한 구조** 에서 학습할 수 있다.

### 왜 작동하나
- 하이퍼엣지가 "함께 속한 객체"를 한꺼번에 연결 → **고차 상관** 을 한 번에 전파(쌍별 근사보다 정확).
- 일반 그래프(엣지가 2-노드)는 HGNN의 **특수 케이스** → GCN을 포괄.

### 한 줄 비유
> 친구를 **1:1 관계** 로만 잇는 대신, **"같은 동아리(하이퍼엣지)에 속한 사람들"** 을 통째로 묶어 정보를
> 주고받는다.

## 핵심 기여 (Contributions)
- 신경망을 **하이퍼그래프** 로 확장해 **고차·복잡 관계** 를 직접 인코딩.
- 하이퍼엣지 그룹으로 **다중 모달 특징 융합**.
- GCN을 특수 케이스로 포괄.

## 결과·데이터셋 (Results)
인용 네트워크 노드 분류([Cora 등](../../datasets/cora-citeseer-pubmed.md))와 **시각 객체 분류**
(ModelNet40, NTU 3D 형상)에서 GCN 등 대비 향상. 특히 다중 특징 결합 시 이득이 컸다.

## 관련 링크
- 개념: [하이퍼그래프·고차 관계](../../concepts/glossary.md), [분류 체계(그래프 구조 축)](../../concepts/taxonomy.md)
- 기반: [GCN](../foundations/gcn.md)(스펙트럼 합성곱)
- 인접 주제(하이퍼관계 KG): [StarE](stare.md)

---
[← 카테고리](index.md)
