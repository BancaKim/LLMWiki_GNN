---
type: Concept
title: 데이터셋 개요 — 과제·평가지표·선택 가이드
description: 그래프 표현학습의 과제 유형(노드 분류·링크 예측)과 평가지표(F1·MRR·Hits@k), 그리고 연구 주제별 데이터셋 선택 가이드.
tags: [datasets, evaluation, metrics, benchmark, node-classification, link-prediction]
timestamp: 2026-06-19T00:00:00Z
---

# 데이터셋 개요 — 과제·평가지표·선택 가이드

[← 개념 목록](index.md) · [번들 루트](../index.md)

개별 벤치마크의 상세 정보는 **[데이터셋 카탈로그](../datasets/index.md)** 에 concept 으로 정리되어
있습니다. 이 문서는 그 **선택 기준과 평가지표** 를 설명합니다.

## 과제 유형과 대표 지표

| 과제 | 설명 | 주요 지표 | 대표 데이터셋 |
|------|------|-----------|---------------|
| **노드 분류** | 노드의 라벨 예측 | Accuracy, Micro/Macro-F1 | [Cora/Citeseer/Pubmed](../datasets/cora-citeseer-pubmed.md), [Reddit/PPI](../datasets/reddit-ppi.md) |
| **다중 라벨 분류** | 노드가 여러 라벨 | Micro/Macro-F1 | [BlogCatalog](../datasets/blogcatalog.md), [PPI](../datasets/reddit-ppi.md) |
| **링크 예측 / KG 완성** | (h,r,t) 삼중항 존재 예측 | **MRR, Hits@1/3/10** | [FB15k-237/WN18RR](../datasets/fb15k-237-wn18rr.md), [WD50K](../datasets/wd50k.md) |
| **그래프 분류** | 그래프 전체 라벨 | Accuracy, ROC-AUC | (분자 등, [OGB](../datasets/ogb.md)) |

## 연구 주제별 데이터셋 선택 가이드

| 연구 주제 | 권장 데이터셋 |
|-----------|---------------|
| 랜덤워크·노드 임베딩 | [BlogCatalog](../datasets/blogcatalog.md), [PPI](../datasets/reddit-ppi.md) (다중 라벨) |
| 전이적 노드 분류(GNN) | [Cora/Citeseer/Pubmed](../datasets/cora-citeseer-pubmed.md) (사실상 표준) |
| 귀납적·대규모 노드 분류 | [Reddit](../datasets/reddit-ppi.md), [PPI](../datasets/reddit-ppi.md), [OGB](../datasets/ogb.md) |
| 이종 그래프 | [DBLP/AMiner](../datasets/dblp-aminer.md), OAG |
| 지식그래프 완성 | [FB15k-237 / WN18RR](../datasets/fb15k-237-wn18rr.md) (FB15k/WN18은 누수 이슈) |
| 하이퍼관계 KG | [WD50K](../datasets/wd50k.md), JF17K, WikiPeople |

## 평가 시 주의점

- **FB15k / WN18 의 역관계 누수**: 학습/평가에 역관계(inverse)가 섞여 단순 규칙으로도 높은 점수가
  나오는 문제가 알려졌다. → **FB15k-237 / WN18RR** 가 이를 제거한 표준이 됨
  ([상세](../datasets/fb15k-237-wn18rr.md)).
- **filtered vs raw 랭킹**: 링크 예측에서 다른 정답 삼중항을 후보에서 제외하고 순위를 매기는
  **filtered** 설정이 표준이다.
- **데이터셋 분할·전처리 차이** 로 논문 간 수치 비교가 어려울 수 있다 → [OGB](../datasets/ogb.md) 같은
  표준화된 벤치마크가 등장한 배경.
- 노드 분류에서 **다중 라벨** 이면 Accuracy 대신 **Micro/Macro-F1** 을 쓴다.

---
[← 이전: 분류 체계](taxonomy.md) · [데이터셋 카탈로그 →](../datasets/index.md) · [다음: 용어집 →](glossary.md)
