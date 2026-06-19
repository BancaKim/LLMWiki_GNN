---
type: Index
title: 벤치마크 데이터셋 카탈로그
description: 그래프 표현학습/GNN 연구에서 반복적으로 쓰이는 표준 벤치마크 데이터셋 concept 모음.
tags: [datasets, benchmark, catalog]
timestamp: 2026-06-19T00:00:00Z
---

# 벤치마크 데이터셋 카탈로그

[← 번들 루트](../index.md) · 과제·평가지표·선택 가이드는 [데이터셋 개요](../concepts/datasets-overview.md)

각 데이터셋은 하나의 concept 문서입니다. 논문 concept 들이 이 문서들로 링크됩니다.

## 노드 분류 (동질 그래프)
| 데이터셋 | 도메인 | 문서 |
|----------|--------|------|
| **Cora / Citeseer / Pubmed** | 인용 네트워크(전이적 표준) | [cora-citeseer-pubmed.md](cora-citeseer-pubmed.md) |
| **Reddit / PPI** | 게시물·단백질(귀납적 표준) | [reddit-ppi.md](reddit-ppi.md) |
| **BlogCatalog** | 소셜 다중 라벨(랜덤워크 임베딩) | [blogcatalog.md](blogcatalog.md) |

## 지식 그래프 (링크 예측 / KG 완성)
| 데이터셋 | 도메인 | 문서 |
|----------|--------|------|
| **FB15k-237 / WN18RR** | Freebase·WordNet(누수 제거 표준) | [fb15k-237-wn18rr.md](fb15k-237-wn18rr.md) |
| **WD50K** | Wikidata 하이퍼관계(한정자) | [wd50k.md](wd50k.md) |

## 이종 그래프
| 데이터셋 | 도메인 | 문서 |
|----------|--------|------|
| **DBLP / AMiner** | 학술 그래프(저자·논문·학회) | [dblp-aminer.md](dblp-aminer.md) |

## 표준화 벤치마크 (대규모)
| 데이터셋 | 도메인 | 문서 |
|----------|--------|------|
| **OGB (Open Graph Benchmark)** | 노드/링크/그래프 대규모 표준 | [ogb.md](ogb.md) |

---
[← 번들 루트](../index.md) · [데이터셋 개요(과제·지표) →](../concepts/datasets-overview.md)
