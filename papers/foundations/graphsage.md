---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Inductive Representation Learning on Large Graphs (GraphSAGE)"
description: 이웃을 고정 크기로 샘플링하고 학습 가능한 집계 함수(mean/LSTM/pooling)로 표현을 생성하는 귀납적(inductive) GNN. 학습에 없던 새 노드·새 그래프에도 일반화.
resource: https://arxiv.org/abs/1706.02216
tags: [graphsage, inductive, neighbor-sampling, aggregator, message-passing, scalability]
authors: William L. Hamilton, Rex Ying, Jure Leskovec
venue: NeurIPS 2017
year: 2017
timestamp: 2026-06-19T00:00:00Z
---

# ⭐ Inductive Representation Learning on Large Graphs (GraphSAGE)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **NeurIPS 2017**

[← 카테고리](index.md) · 원문: [arXiv:1706.02216](https://arxiv.org/abs/1706.02216)

- **저자**: William L. Hamilton, Rex Ying, Jure Leskovec
- **발표처/연도**: NeurIPS 2017 (SAGE = **SA**mple and aggre**G**at**E**)

## 문제 (Problem)
[GCN](gcn.md) 등 기존 방법은 학습 시 **전체 그래프**가 필요하고 노드별 임베딩을 직접 학습해
(**전이적, transductive**), 학습 후 등장한 **새 노드/새 그래프** 에 임베딩을 줄 수 없다. 실제 시스템은
끊임없이 새 노드가 추가된다.

## 방법 (Method)
임베딩 자체가 아니라 **이웃을 집계하는 함수** 를 학습한다 (**귀납적, inductive**).
- 각 노드에서 **고정 크기로 이웃을 샘플링** → 미니배치로 대규모 그래프 학습 가능(전체 인접행렬 불필요).
- 학습 가능한 **집계 함수(aggregator)**: **Mean / LSTM / Pooling(max)**.
- 각 층에서 이웃 표현을 집계해 자신 표현과 결합(concat) → 비선형 변환. L층이면 L-홉 정보를 응축.
- 지도(분류) 손실 또는 **비지도 그래프 기반 손실**(이웃은 가깝게, 무작위 노드는 멀게)로 학습.

## 핵심 기여 (Contributions)
- **귀납적 표현학습**: 학습에 없던 노드/그래프에도 임베딩 생성.
- **이웃 샘플링 + 미니배치** 로 대규모 그래프 확장성 확보.
- 메시지 패싱을 "샘플 후 집계" 로 일반화한 프레임워크 (다양한 aggregator).

## 결과·데이터셋 (Results)
인용(Web of Science), [Reddit](../../datasets/reddit-ppi.md)(게시물-댓글), 단백질 상호작용
[PPI](../../datasets/reddit-ppi.md)(여러 그래프 간 일반화)에서 귀납 설정 SOTA급 성능.

## 관련 링크
- 개념: [귀납 vs 전이](../../concepts/overview.md), [이웃 샘플링·집계 함수](../../concepts/glossary.md)
- 비교: 균일 평균 GCN([GCN](gcn.md)) ↔ 어텐션 가중 [GAT](gat.md)
- 영향: 이종 그래프 샘플링 [HGT](../heterogeneous/hgt.md)(HGSampling)

---
[← 카테고리](index.md)
