---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Graph Attention Networks (GAT)"
description: 마스크드 셀프 어텐션으로 이웃마다 다른 가중치를 학습하는 GNN. 다중 헤드 어텐션을 사용하고 라플라시안 등 전역 그래프 연산 없이 귀납적으로도 동작.
resource: https://arxiv.org/abs/1710.10903
tags: [gat, attention, multi-head, message-passing, node-classification, inductive]
authors: Petar Veličković, Guillem Cucurull, Arantxa Casanova, Adriana Romero, Pietro Liò, Yoshua Bengio
venue: ICLR 2018
year: 2018
timestamp: 2026-06-19T00:00:00Z
---

# ⭐ Graph Attention Networks (GAT)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **ICLR 2018**

[← 카테고리](index.md) · 원문: [arXiv:1710.10903](https://arxiv.org/abs/1710.10903)

- **저자**: Petar Veličković, Guillem Cucurull, Arantxa Casanova, Adriana Romero, Pietro Liò, Yoshua Bengio
- **발표처/연도**: ICLR 2018

## 문제 (Problem)
[GCN](gcn.md) 은 이웃을 **고정된 가중치(차수 정규화 평균)** 로 집계해, 이웃마다 다른 중요도를 반영하지
못한다. 또 스펙트럼 기반 방법은 라플라시안 등 **전체 그래프 구조에 의존**해 귀납적 적용이 까다롭다.

## 방법 (Method)
**셀프 어텐션** 으로 이웃별 가중치를 데이터로부터 학습한다.
- 각 엣지에 대해 attention 계수 e_ij 를 계산하고, 이웃에 대해 **소프트맥스 정규화**(masked attention,
  실제 이웃에만 적용)해 가중치 α_ij 를 얻는다.
- 이웃 표현을 α 가중합 → 비선형. **다중 헤드(multi-head) 어텐션** 으로 안정성과 표현력 향상
  (중간 층은 concat, 출력 층은 평균).
- 행렬 고유분해·라플라시안이 필요 없고 이웃만 보면 되므로 **귀납적(inductive)** 으로도 동작.

## 핵심 기여 (Contributions)
- 그래프에 **어텐션 메커니즘** 을 도입해 이웃 중요도를 학습.
- 전역 그래프 연산 없이 **국소 연산** 만으로 동작 → 병렬화·귀납 적용 용이.
- 어텐션 가중치가 **해석 가능성** 의 단서를 제공.

## 결과·데이터셋 (Results)
전이 설정 [Cora / Citeseer / Pubmed](../../datasets/cora-citeseer-pubmed.md) 와 귀납 설정
[PPI](../../datasets/reddit-ppi.md) 모두에서 SOTA급. GCN 대비 이웃 가중을 학습해 성능·유연성 향상.

## 관련 링크
- 개념: [어텐션·메시지 패싱](../../concepts/glossary.md), [귀납 vs 전이](../../concepts/overview.md)
- 비교: [GCN](gcn.md)(고정 가중) · [GraphSAGE](graphsage.md)(샘플+집계)
- 영향: 이종 그래프 타입별 어텐션 [HGT](../heterogeneous/hgt.md)

---
[← 카테고리](index.md)
