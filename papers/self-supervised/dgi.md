---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Deep Graph Infomax (DGI)"
description: 노드(패치) 표현과 그래프 전역 요약 사이의 상호정보(mutual information)를 최대화해, 랜덤워크 없이 비지도로 노드 표현을 학습. 그래프 손상(feature shuffle)으로 네거티브를 만든다.
resource: https://arxiv.org/abs/1809.10341
tags: [self-supervised, unsupervised, mutual-information, infomax, contrastive, inductive]
authors: Petar Veličković, William Fedus, William L. Hamilton, Pietro Liò, Yoshua Bengio, R Devon Hjelm
venue: ICLR 2019
year: 2019
timestamp: 2026-09-28T00:00:00Z
---

# ⭐ Deep Graph Infomax (DGI)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **ICLR 2019**

[← 카테고리](index.md) · 원문: [arXiv:1809.10341](https://arxiv.org/abs/1809.10341)

- **저자**: Petar Veličković, William Fedus, William L. Hamilton, Pietro Liò, Yoshua Bengio, R Devon Hjelm
- **발표처/연도**: ICLR 2019

## 문제 (Problem)
[DeepWalk](../foundations/deepwalk.md)/[node2vec](../foundations/node2vec.md) 같은 비지도 임베딩은 **랜덤워크**
에 의존해 근접성만 강조하고 얕다. 랜덤워크 없이 **구조·의미를 담은 비지도 노드 표현** 을 학습하고 싶다.

## 방법 (Method)
**노드(패치) 표현과 그래프 전역 요약(summary) 사이의 상호정보(MI)를 최대화** 한다(InfoMax).

## 핵심 메커니즘 — DGI가 *실제로* 하는 것

> **한 줄 요약**: 각 노드 표현이 **"이 그래프 전체 요약과 잘 맞아떨어지는가"** 를 맞히도록 학습.
> 네거티브는 **그래프를 손상(feature shuffle)** 시켜 만든다. 랜덤워크 불필요.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| 비지도 = 랜덤워크 | 워크 기반 | **워크 없이** MI 최대화 |
| MI를 어떻게? | 직접 추정 | patch(노드) ↔ global summary **판별** 로 하한 최대화 |
| 네거티브 출처 | 무작위 노드 | **그래프 손상**(행 셔플 등)한 가짜 노드 표현 |
| 얕은 임베딩 | 룩업 | **GNN 인코더** → 귀납(inductive) 가능 |

### 수식 (요지)
인코더가 노드 표현 $h_i$ 를, readout $R$ 이 요약 $s=R(\{h_i\})$ 을 만들고, 판별기 $D(h_i,s)$ 가 진짜/가짜를 구분:
$$\mathcal{L} = \sum_i \mathbb{E}\big[\log D(h_i, s)\big] \;+\; \sum_j \mathbb{E}\big[\log\big(1 - D(\tilde h_j, s)\big)\big]$$
여기서 $\tilde h_j$ 는 **손상된 그래프**(예: 노드 피처 행 셔플)에서 나온 표현. 이 이진 분류가 **MI 하한** 을 최대화한다.

### 왜 작동하나
"패치가 전역 요약과 부합하는가"를 맞히려면 노드 표현이 **전역 구조 정보** 를 담아야 한다 → 다운스트림에
유용한 표현. 전이·귀납 모두에서 지도 학습에 필적.

### 한 줄 비유
> 각 노드에게 **"너 이 그래프 소속 맞아?"** 를 묻고, 가짜(뒤섞은) 그래프의 노드와 구별하게 만든다 → 소속을
> 증명하려면 그래프의 특징을 표현에 담게 된다.

## 핵심 기여 (Contributions)
- 랜덤워크 없는 **MI 기반 비지도/자기지도** 그래프 표현학습(InfoMax).
- **그래프 손상** 으로 네거티브를 만드는 간단·효과적 전략.
- 전이·귀납 모두에서 강한 성능.

## 결과·데이터셋 (Results)
[Cora / Citeseer / Pubmed](../../datasets/cora-citeseer-pubmed.md)(전이), [Reddit / PPI](../../datasets/reddit-ppi.md)(귀납)
등에서 비지도 SOTA급, 지도 학습에 필적 *(구체 수치 원문 확인)*.

## 관련 링크
- 개념: [자기지도·상호정보·대조학습](../../concepts/glossary.md)
- 대조: [DeepWalk](../foundations/deepwalk.md)/[node2vec](../foundations/node2vec.md)(워크 기반) · 인코더 [GCN](../foundations/gcn.md)/[GAT](../foundations/gat.md)
- 발전: [GraphCL](graphcl.md)(증강 기반 대조학습)

---
[← 카테고리](index.md)
