---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "DeepWalk: Online Learning of Social Representations"
description: 절단된 랜덤워크(truncated random walk)로 노드 시퀀스를 생성하고 SkipGram(word2vec)을 적용해 노드 임베딩을 학습한 최초의 그래프 표현학습. NLP의 단어 임베딩을 그래프로 옮긴 출발점.
resource: https://arxiv.org/abs/1403.6652
tags: [random-walk, node-embedding, skipgram, sgns, co-occurrence, negative-sampling, unsupervised, transductive]
authors: Bryan Perozzi, Rami Al-Rfou, Steven Skiena
venue: KDD 2014
year: 2014
timestamp: 2026-06-22T00:00:00Z
---

# ⭐ DeepWalk: Online Learning of Social Representations

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **KDD 2014**

[← 카테고리](index.md) · 원문: [arXiv:1403.6652](https://arxiv.org/abs/1403.6652)

- **저자**: Bryan Perozzi, Rami Al-Rfou, Steven Skiena
- **발표처/연도**: KDD 2014

## 문제 (Problem)
소셜 네트워크 같은 그래프에서 노드를 **저차원 연속 벡터**로 표현하고 싶다. 기존 방법은 희소한 인접행렬을
그대로 쓰거나 비용이 큰 행렬 분해에 의존해 대규모·온라인 학습에 부적합했다.

## 방법 (Method)
**랜덤워크 = 문장, 노드 = 단어** 라는 관찰이 핵심이다.
- 각 노드에서 **절단된 랜덤워크(truncated random walk)** 를 여러 번 수행해 노드 시퀀스를 만든다.
- 이 시퀀스를 NLP의 **SkipGram(word2vec)** 에 그대로 입력해, 한 노드가 같은 워크에 등장한 이웃 노드들을
  예측하도록 학습 → 노드 임베딩을 얻는다 (계산은 Hierarchical Softmax 로 가속).
- 그래프의 **연결 빈도가 멱법칙(power-law)** 을 따른다는 점이 단어 빈도 분포와 유사해 NLP 기법이 잘 통한다.

## DeepWalk가 *실제로* 학습하는 것 (핵심)

> **한 줄 요약**: 각 노드를 시작점으로 만든 여러 워크(=문장)에서, **워크 시퀀스상 ±window 안에 "함께
> 등장(co-occurrence)"한 노드쌍의 유사도는 높이고, 무작위 노드쌍은 낮추도록** 임베딩을 학습한다.

흔히 "랜덤워크는 시작점에서 **종착지**를 찾는 것"으로 오해하지만, DeepWalk가 보는 것은 **종착지가 아니라
워크 시퀀스 전체의 동시 등장(co-occurrence)** 이다.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| 워크의 결과 | 시작점 → **종착지** 2개 | 거쳐 간 **모든 노드의 순서 있는 시퀀스**(문장) |
| 학습 단위 | **마지막 종착지** 집합 | 시퀀스의 **모든 위치**가 차례로 center |
| 유사하게 만드는 대상 | 시작 ↔ 종착 | center ↔ **같은 워크의 ±window 이웃** |
| `γ`(여러 번)의 목적 | 종착지 수집 | **문장(학습 데이터) 증강** |

### 메커니즘 4단계

1. **워크 생성** — 각 노드에서 길이 `t` 의 순서 있는 시퀀스 생성. 시작·종착 어느 쪽도 특별하지 않다.
2. **γ번 반복** — 노드마다 워크를 `γ` 번 만들어 문장을 늘림 → 데이터 증강 (총 `|V|×γ` 개 문장).
3. **윈도우 슬라이딩** — 시퀀스 위 **모든 위치를 차례로 center** 로 두고, context = 시퀀스상 **±w 이웃**.
4. **임베딩 학습** — 윈도우 안에서 **함께 등장한 쌍은 유사하게**, **무작위 쌍은 안 유사하게**.

### 손실 함수 (SkipGram + Negative Sampling, SGNS)

원논문은 Hierarchical Softmax 를 썼지만, 널리 쓰이는 등가 형태인 **SGNS** 로 보면 학습 목표가 분명하다:

$$\mathcal{L} = -\log\sigma\big(\underbrace{v_{center}\cdot u_{context}}_{\text{윈도우 co-occur(양성)}}\big)\;-\;\sum_{n}\log\sigma\big(-\,v_{center}\cdot u_{noise}\big)$$

- **양성쌍** = `(center, 같은 워크의 윈도우 이웃)` → 내적 ↑.
- **음성쌍** = `(center, 무작위로 뽑은 노드)` → 내적 ↓.
- ⚠️ 양성쌍은 **(시작, 종착)이 아니다** — 시퀀스상 가까이 동시 등장한 쌍이다.

### 왜 작동하나

랜덤워크는 **커뮤니티 안에 오래 머무는** 경향이 있다 → 같은 커뮤니티 노드끼리 같은 윈도우에 자주 동시
등장 → 임베딩이 서로 닮아진다. (Karate Club 그래프에서 두 파벌이 임베딩 공간에서 분리되는 원리.)

### 한 줄 비유

> *"누구에게 도착했나(시작↔종착)"* 가 아니라 *"산책 동선에서 누구와 자주 가까이 스쳤나(co-occurrence)"* 를 학습한다.

> 이 동시 등장 관점은 후속 연구로도 이어진다 — [node2vec](node2vec.md) 은 **워크의 편향(p, q)** 을
> 바꿔 *어떤* 동시 등장(BFS=구조적 동등성 / DFS=동질성)을 모을지 조절하고,
> [metapath2vec](../heterogeneous/metapath2vec.md) 은 **타입을 고려한 메타패스 워크** 로 동시 등장을 정의한다.

## 핵심 기여 (Contributions)
- **그래프 표현학습의 출발점**: 비지도·확장 가능한 노드 임베딩을 제안 (이후 [node2vec](node2vec.md) 등으로 발전).
- 랜덤워크로 **로컬 구조를 샘플링**해 SkipGram으로 학습하는 패러다임 정립.
- 온라인·병렬화가 쉬워 **대규모 그래프** 에 적용 가능.

## 결과·데이터셋 (Results)
다중 라벨 노드 분류 벤치마크 [BlogCatalog](../../datasets/blogcatalog.md), Flickr, YouTube 에서
기존 방법 대비 Macro/Micro-F1 개선을 보고. 특히 **라벨이 적을 때** 우위가 컸다.

## 관련 링크
- 개념: [노드 임베딩·랜덤워크](../../concepts/glossary.md), [전이학습 vs 귀납학습](../../concepts/overview.md)
- 발전: [node2vec](node2vec.md)(편향 랜덤워크), 이종 확장 [metapath2vec](../heterogeneous/metapath2vec.md)

---
[← 카테고리](index.md)
