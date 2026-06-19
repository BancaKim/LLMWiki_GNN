---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "DeepWalk: Online Learning of Social Representations"
description: 절단된 랜덤워크(truncated random walk)로 노드 시퀀스를 생성하고 SkipGram(word2vec)을 적용해 노드 임베딩을 학습한 최초의 그래프 표현학습. NLP의 단어 임베딩을 그래프로 옮긴 출발점.
resource: https://arxiv.org/abs/1403.6652
tags: [random-walk, node-embedding, skipgram, unsupervised, transductive]
authors: Bryan Perozzi, Rami Al-Rfou, Steven Skiena
venue: KDD 2014
year: 2014
timestamp: 2026-06-19T00:00:00Z
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
