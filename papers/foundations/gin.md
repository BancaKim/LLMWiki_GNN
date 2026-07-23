---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "How Powerful are Graph Neural Networks? (GIN)"
description: 메시지 패싱 GNN의 표현력이 1-Weisfeiler-Lehman 검정과 같은 상한을 가짐을 증명하고, 이웃 집계를 단사(injective)로 만드는 sum+MLP 구조(GIN)로 그 상한에 도달. mean·max 집계가 왜 약한지 규명.
resource: https://arxiv.org/abs/1810.00826
tags: [gin, expressiveness, weisfeiler-lehman, injective-aggregation, sum-aggregator, graph-classification]
authors: Keyulu Xu, Weihua Hu, Jure Leskovec, Stefanie Jegelka
venue: ICLR 2019
year: 2019
timestamp: 2026-06-30T00:00:00Z
---

# ⭐ How Powerful are Graph Neural Networks? (GIN)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **ICLR 2019**

[← 카테고리](index.md) · 원문: [arXiv:1810.00826](https://arxiv.org/abs/1810.00826)

- **저자**: Keyulu Xu, Weihua Hu, Jure Leskovec, Stefanie Jegelka
- **발표처/연도**: ICLR 2019 (GIN = **G**raph **I**somorphism **N**etwork)

## 문제 (Problem)
[GCN](gcn.md)·[GraphSAGE](graphsage.md) 같은 메시지 패싱 GNN은 **얼마나 표현력이 강한가?** 서로 다른(비동형,
non-isomorphic) 그래프를 얼마나 구분할 수 있나? 이론적 한계가 불명확했다.

## 방법 (Method)
**그래프 동형성 검정(Weisfeiler-Lehman, WL)** 과 연결해 표현력을 분석하고, 그 상한에 도달하는 구조를 설계한다.

## 핵심 메커니즘 — GIN이 *실제로* 밝힌 것

> **한 줄 요약**: 메시지 패싱 GNN은 **아무리 잘 만들어도 1-WL 검정보다 강할 수 없다.** 그 상한에 도달하려면
> 이웃 집계가 **단사(injective)** 여야 하고, 그건 **sum + MLP** 로 된다(mean·max는 안 됨).

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| GNN 표현력 | 어떤 그래프든 구분 | **최대 1-WL** — WL이 못 가르는 그래프쌍(일부 정규 그래프 등)은 어떤 MPNN도 못 가름 |
| 집계 함수 | mean/max/sum 다 비슷 | **표현력: sum ≻ mean ≈ max** (sum만 단사) |
| GIN 구조 | 복잡할 것 | **sum + MLP** 로 오히려 단순 |
| 표현력 = 성능 | 강하면 무조건 우수 | 표현력은 **구분 능력의 상한**; 일반화는 별개 문제 |

### 왜 mean·max는 약한가 (핵심 직관)
집계는 **이웃 특징들의 "다중집합(multiset)"** 을 하나의 벡터로 요약한다. 서로 다른 다중집합을 다른 값으로
보내야(=**단사**) 구조를 구분할 수 있다.
- **mean(평균)**: 개수(다중도)를 잃음 → `{a}` 와 `{a,a}` 를 **같게** 봄.
- **max**: 개수·종류를 잃음 → `{a,b}` 와 `{a,a,b}` 를 같게 봄.
- **sum(합)**: 개수까지 보존 → 다중집합을 구분 가능(단사).

### GIN 업데이트 식
$$h_v^{(k)} = \text{MLP}^{(k)}\!\Big( \big(1+\epsilon^{(k)}\big)\cdot h_v^{(k-1)} \;+\; \sum_{u\in\mathcal{N}(v)} h_u^{(k-1)} \Big)$$
- **sum** 이 다중집합을 보존하고, **MLP** 가 그 위에서 단사 함수를 학습(만능근사) → 이론상 **1-WL 만큼** 강함.
- 그래프 분류는 층별 **sum-readout** 을 concat 해 표현력·정보 손실을 줄인다.

### 왜 작동하나
sum+MLP 조합이 "이웃 다중집합 → 표현" 을 단사로 만들어, **WL이 구분하는 만큼의 구조** 를 구분한다.
(단, WL의 한계 이상은 불가 — 예: 정규 그래프.)

### 한 줄 비유
> 이웃을 요약할 때 **평균 키만 기억(mean)** 하거나 **제일 큰 사람만 기억(max)** 하면 "몇 명인지"를 잊는다.
> **다 더하면(sum)** 인원·구성까지 남아 가장 정보가 많다.

## 핵심 기여 (Contributions)
- 메시지 패싱 GNN의 **표현력 상한 = 1-WL** 을 이론적으로 규명.
- **단사 집계(sum+MLP)** 로 그 상한에 도달하는 **GIN** 제안.
- mean/max 집계([GCN](gcn.md)/[GraphSAGE](graphsage.md))가 **왜 약한지** 를 다중집합 관점으로 설명.

## 결과·데이터셋 (Results)
그래프 분류 벤치마크(생물정보 MUTAG·PROTEINS·NCI1, 소셜 IMDB·REDDIT·COLLAB 등)에서 당시 SOTA급
*(구체 수치는 원문 확인)*.

## 관련 링크
- 개념: [메시지 패싱·표현력(WL)](../../concepts/glossary.md), [분류 체계(핵심 기법)](../../concepts/taxonomy.md)
- 비교/기반: [GCN](gcn.md)·[GraphSAGE](graphsage.md)(표현력 한계를 규명당한 대상)
- 후속: 메시지 패싱의 한계를 어텐션으로 넘는 [그래프 트랜스포머](../graph-transformer/index.md)
  ([Graphormer](../graph-transformer/graphormer.md)는 GIN 등을 특수 케이스로 포괄)

---
[← 카테고리](index.md)
