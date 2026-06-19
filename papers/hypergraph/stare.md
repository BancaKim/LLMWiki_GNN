---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "StarE: Message Passing for Hyper-Relational Knowledge Graphs"
description: 한정자(qualifier)가 붙은 하이퍼관계(hyper-relational) KG 문장을 인코딩하는 GNN. CompGCN을 확장해 주 삼중항에 한정자 쌍을 결합하고, 트랜스포머 디코더로 링크 예측. 하이퍼관계 벤치마크 WD50K 제안.
resource: https://arxiv.org/abs/2009.10847
tags: [knowledge-graph, hyper-relational, qualifiers, message-passing, transformer, link-prediction]
authors: Mikhail Galkin, Priyansh Trivedi, Gaurav Maheshwari, Ricardo Usbeck, Jens Lehmann
venue: EMNLP 2020
year: 2020
timestamp: 2026-06-19T00:00:00Z
---

# ⭐ StarE: Message Passing for Hyper-Relational Knowledge Graphs

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **EMNLP 2020**

[← 카테고리](index.md) · 원문: [arXiv:2009.10847](https://arxiv.org/abs/2009.10847)

- **저자**: Mikhail Galkin, Priyansh Trivedi, Gaurav Maheshwari, Ricardo Usbeck, Jens Lehmann
- **발표처/연도**: EMNLP 2020

## 문제 (Problem)
실제 KG(예: Wikidata)의 사실은 단순 삼중항을 넘어 **한정자(qualifier)** 를 가진 **하이퍼관계
(hyper-relational)** 문장이다. 예: *(아인슈타인, 수상, 노벨물리학상)* + **한정자** *(연도: 1921)*,
*(분야: 물리)*. [TransE](../knowledge-graph/transe.md)·[CompGCN](../knowledge-graph/compgcn.md) 같은
삼중항 모델은 이 부가 정보를 버려 정보 손실이 크다.

## 방법 (Method)
[CompGCN](../knowledge-graph/compgcn.md) 의 메시지 패싱을 **하이퍼관계 문장** 으로 확장.
- 각 엣지에서 **주 관계(main relation) 임베딩에 한정자(qualifier) 쌍들을 합성·집계** 해 한정자 정보를
  주입한 메시지를 만든다(한정자 표현을 별도 집계 후 주 관계와 결합).
- 노드·관계·한정자를 함께 인코딩하는 **StarE 인코더** + **트랜스포머 기반 디코더** 로 링크 예측.
- 한정자 개수가 가변이어도 처리 가능(순열 불변 집계).

## 핵심 기여 (Contributions)
- **하이퍼관계 KG(한정자 포함)** 를 위한 GNN 인코더를 최초 수준으로 제시.
- CompGCN 합성 메시지 패싱을 **주 삼중항 + 한정자** 구조로 일반화.
- 대규모 **하이퍼관계 벤치마크 [WD50K](../../datasets/wd50k.md)** (Wikidata 기반) 공개.

## 결과·데이터셋 (Results)
[WD50K](../../datasets/wd50k.md)(및 변형)와 JF17K, WikiPeople 등에서 한정자를 활용할수록 링크 예측
(MRR/Hits@k)이 향상됨을 보임 — 한정자 정보가 실제로 유용함을 입증.

## 관련 링크
- 개념: [하이퍼관계·한정자·KG 임베딩](../../concepts/glossary.md)
- 기반: [CompGCN](../knowledge-graph/compgcn.md)(합성 메시지 패싱) · 인접(하이퍼그래프) [HGNN](hgnn.md)

---
[← 카테고리](index.md)
