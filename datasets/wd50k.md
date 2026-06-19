---
type: Dataset
title: WD50K
description: Wikidata 기반 하이퍼관계(hyper-relational) 지식그래프 벤치마크. 삼중항에 한정자(qualifier)가 붙은 문장으로 구성되어, StarE 등 한정자 활용 모델 평가에 사용.
resource: https://github.com/migalkin/StarE
tags: [dataset, knowledge-graph, hyper-relational, qualifiers, wikidata, link-prediction]
timestamp: 2026-06-19T00:00:00Z
---

# WD50K

[← 데이터셋 카탈로그](index.md)

## 개요
**Wikidata** 에서 추출한 **하이퍼관계(hyper-relational)** 지식그래프 벤치마크로,
[StarE](../papers/hypergraph/stare.md) 논문에서 제안되었다. 단순 삼중항이 아니라 **(주 삼중항 + 한정자
쌍들)** 로 이루어진 **문장(statement)** 단위 데이터를 담는다.

## 하이퍼관계 문장이란
- 주 삼중항: *(아인슈타인, 수상, 노벨물리학상)*
- 한정자(qualifier): *(연도: 1921)*, *(분야: 물리학)* …
- 즉 하나의 사실이 **가변 개수의 (속성, 값) 한정자** 를 가질 수 있다.

## 특징·구성
- 한정자 비율이 다른 여러 변형(예: 한정자가 있는 문장 비율이 다른 서브셋, WD50K(33/66/100) 등)으로
  제공되어 **한정자 정보의 기여도** 를 통제 실험할 수 있다.
- 과제: **링크 예측** — 주 삼중항의 head/tail 또는 한정자 값을 예측. 지표는 **MRR, Hits@k**.
- 한정자를 쓸수록 성능이 오르는지를 보여 **하이퍼관계 모델링의 가치** 를 입증하는 데 사용.

## 이 데이터셋을 쓰는 논문
- [StarE](../papers/hypergraph/stare.md) (함께 JF17K, WikiPeople 등 기존 하이퍼관계 데이터셋과 비교)

> 관련 개념: [하이퍼관계·한정자](../concepts/glossary.md) · 기반 인코더 [CompGCN](../papers/knowledge-graph/compgcn.md)

---
[← 데이터셋 카탈로그](index.md) · [이종 그래프: DBLP/AMiner →](dblp-aminer.md)
