---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Heterogeneous Graph Transformer (HGT)"
description: 메타관계(소스타입–엣지타입–타깃타입)별로 분리된 투영·어텐션 파라미터로 이종 그래프를 처리하는 트랜스포머형 GNN. 상대적 시간 인코딩(RTE)과 HGSampling으로 동적·대규모 그래프 지원.
resource: https://arxiv.org/abs/2003.01332
tags: [heterogeneous, graph-transformer, meta-relation, attention, temporal, sampling]
authors: Ziniu Hu, Yuxiao Dong, Kuansan Wang, Yizhou Sun
venue: WWW 2020
year: 2020
timestamp: 2026-06-19T00:00:00Z
---

# ⭐ Heterogeneous Graph Transformer (HGT)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **WWW (TheWebConf) 2020**

[← 카테고리](index.md) · 원문: [arXiv:2003.01332](https://arxiv.org/abs/2003.01332)

- **저자**: Ziniu Hu, Yuxiao Dong, Kuansan Wang, Yizhou Sun
- **발표처/연도**: WWW 2020

## 문제 (Problem)
이종 그래프 방법은 보통 **수작업 메타패스**([metapath2vec](metapath2vec.md))에 의존하거나, 모든 타입에
같은 가중치를 공유해 **타입별 이질성** 과 **시간 동역학(dynamics)** 을 충분히 못 담는다. 또 대규모
웹 그래프(수억 노드)로의 확장이 어렵다.

## 방법 (Method)
트랜스포머 어텐션을 **메타관계(meta-relation)** 단위로 분해한다. 메타관계 = ⟨소스 노드 타입, 엣지 타입,
타깃 노드 타입⟩ 삼중쌍.
- **이종 상호 어텐션(Heterogeneous Mutual Attention)**: 타입별로 다른 Q/K 투영 행렬을 써서
  메타관계마다 어텐션을 별도 파라미터화 → 메타패스를 직접 설계하지 않아도 됨.
- **이종 메시지 패싱**: 타입별 Value 투영으로 메시지를 만들고, 타깃 타입별로 집계·갱신.
- **상대적 시간 인코딩(RTE, Relative Temporal Encoding)**: 엣지의 시간차를 인코딩해 **동적 그래프** 처리.
- **HGSampling**: 타입 균형을 맞춘 이웃 샘플링으로 **대규모 그래프 미니배치 학습**
  ([GraphSAGE](../foundations/graphsage.md) 샘플링의 이종 버전).

## 핵심 기여 (Contributions)
- **메타관계 기반 타입 의존 어텐션** 으로 수작업 메타패스 없이 이종성 학습.
- **RTE** 로 시간에 따라 변하는 그래프를 자연스럽게 표현.
- **HGSampling** 으로 웹 스케일(OAG) 학습 실현.

## 결과·데이터셋 (Results)
대규모 학술 그래프 **Open Academic Graph(OAG)** 및 그 서브셋에서 논문 분야 분류·저자/학회 예측 등에서
기존 이종 GNN 대비 큰 개선을 보고.

## 관련 링크
- 개념: [이종 그래프·메타관계](../../concepts/glossary.md), [Graph Transformer](../../concepts/glossary.md)
- 기반: [GAT](../foundations/gat.md)(어텐션)·[GraphSAGE](../foundations/graphsage.md)(샘플링)·
  [metapath2vec](metapath2vec.md)(이종 출발점)

---
[← 카테고리](index.md)
