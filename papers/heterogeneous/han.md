---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Heterogeneous Graph Attention Network (HAN)"
description: 메타패스 기반 이웃에 대한 노드 수준 어텐션과, 여러 메타패스(의미)를 융합하는 의미 수준 어텐션의 2단계 어텐션으로 이종 그래프를 학습. 이종 그래프에 어텐션을 도입한 대표 GNN.
resource: https://arxiv.org/abs/1903.07293
tags: [heterogeneous, attention, meta-path, two-level-attention, semantic-attention]
authors: Xiao Wang, Houye Ji, Chuan Shi, Bai Wang, Yanfang Ye, Peng Cui, Philip S. Yu
venue: WWW 2019
year: 2019
timestamp: 2026-09-28T00:00:00Z
---

# ⭐ Heterogeneous Graph Attention Network (HAN)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **WWW (TheWebConf) 2019**

[← 카테고리](index.md) · 원문: [arXiv:1903.07293](https://arxiv.org/abs/1903.07293)

- **저자**: Xiao Wang, Houye Ji, Chuan Shi, Bai Wang, Yanfang Ye, Peng Cui, Philip S. Yu
- **발표처/연도**: WWW 2019

## 문제 (Problem)
[GAT](../foundations/gat.md)의 어텐션은 **동질 그래프** 용이다. 이종 그래프는 **여러 타입 + 메타패스별 의미**
를 갖는데, ① 한 메타패스 안의 이웃 중요도와 ② **여러 메타패스(의미) 사이의 중요도** 를 함께 다뤄야 한다.
[metapath2vec](metapath2vec.md)는 얕고 보통 단일 메타패스에 의존한다.

## 방법 (Method)
**2단계 어텐션**: 노드 수준(node-level) + 의미 수준(semantic-level).

## 핵심 메커니즘 — HAN이 *실제로* 하는 것

> **한 줄 요약**: "**관점(메타패스)별로 이웃 중요도를 학습(노드 어텐션)** → 그 **관점들 자체의 중요도도 학습해
> 융합(의미 어텐션)**." 두 층의 어텐션으로 이종성을 담는다.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| GAT를 이종에 그대로 | 단순 적용 | **노드 + 의미** 2단계 어텐션 |
| metapath2vec와 차이 | 비슷 | 얕은 단일 워크 → **GNN·다중 메타패스 융합** |
| 메타패스 여러 개 융합 | 단순 평균 | **의미 수준 어텐션** 으로 가중 |
| 어텐션은 이웃만 | 노드 수준만 | **의미 수준** 까지(메타패스 중요도 학습) |

### 단계별 메커니즘
1. **노드 수준 어텐션**: 메타패스 $\Phi$ 마다, 그 메타패스로 연결된 이웃의 중요도 $\alpha^{\Phi}_{ij}$ 를
   학습해 집계 → 메타패스별(의미별) 임베딩 $Z_\Phi$.
2. **의미 수준 어텐션**: 각 메타패스의 중요도 $\beta_\Phi$ 를 학습해 융합:
$$Z = \sum_{\Phi} \beta_\Phi\, Z_\Phi$$

### 왜 작동하나
메타패스마다 **다른 의미**(예: APA=공저, APCPA=같은 학회)를 담으므로, 이웃 중요도와 **메타패스 중요도** 를
동시에 학습하면 이종 그래프의 풍부한 의미를 반영할 수 있다.

### 한 줄 비유
> 여러 "렌즈(메타패스)"로 각각 이웃을 보고(노드 어텐션), 그 **렌즈들 중 어떤 게 중요한지** 도 배워서 합친다(의미 어텐션).

## 핵심 기여 (Contributions)
- 이종 그래프에 **노드+의미 2단계 어텐션** 도입(대표 이종 GNN).
- 메타패스별 의미를 **학습형 가중치** 로 융합.

## 결과·데이터셋 (Results)
[DBLP / ACM / IMDB](../../datasets/dblp-aminer.md) 등에서 GCN·GAT·metapath2vec 대비 노드 분류·클러스터링
향상 *(구체 수치 원문 확인)*.

## 관련 링크
- 개념: [이종 그래프·메타패스·어텐션](../../concepts/glossary.md)
- 기반: [GAT](../foundations/gat.md)(어텐션)·[metapath2vec](metapath2vec.md)(메타패스) · 발전: [HGT](hgt.md)

---
[← 카테고리](index.md)
