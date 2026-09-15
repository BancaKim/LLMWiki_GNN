---
type: Index
title: 📐 기초 (Foundations)
description: 그래프 표현학습의 기반 6편 — 랜덤워크 임베딩(DeepWalk·node2vec), 메시지 패싱 GNN 백본(GCN·GraphSAGE·GAT), 표현력 이론(GIN). 6편 모두 탑티어 학회 필독.
tags: [foundations, random-walk, gnn-backbone, gcn, graphsage, gat, gin, must-read]
timestamp: 2026-06-30T00:00:00Z
---

# 📐 기초 (Foundations) — 랜덤워크 + GNN 백본

[← 논문 모음](../index.md) · [번들 루트](../../index.md)

그래프 표현학습의 **출발점**. 노드를 "단어"처럼 임베딩하는 랜덤워크 계열에서 시작해, 그래프 구조를
직접 신경망에 넣는 **메시지 패싱 GNN** 백본, 그리고 그 **표현력의 한계(GIN)** 까지 이어집니다.
**이 카테고리는 6편 모두 ⭐ 필독입니다.**

> **범례**: ⭐ = 탑티어 AI 학회 게재 **필독(MUST-READ)**.

## 추천 학습 순서

1. **[DeepWalk](deepwalk.md)** — 랜덤워크 + SkipGram (개념의 출발)
2. **[node2vec](node2vec.md)** — 편향(p,q) 랜덤워크로 일반화
3. **[GCN](gcn.md)** — 스펙트럼에서 유도한 메시지 패싱 백본
4. **[GraphSAGE](graphsage.md)** — 샘플+집계로 귀납·확장
5. **[GAT](gat.md)** — 어텐션으로 이웃 가중 학습
6. **[GIN](gin.md)** — 메시지 패싱의 표현력 한계(1-WL)와 sum+MLP

| ⭐ | 논문 | 연도/발표처 | 핵심 아이디어 | concept |
|:--:|------|------------|--------------|---------|
| ⭐ | DeepWalk | **KDD 2014** | 랜덤워크 = 문장, SkipGram | [deepwalk.md](deepwalk.md) |
| ⭐ | node2vec | **KDD 2016** | 편향 랜덤워크(p,q): BFS↔DFS | [node2vec.md](node2vec.md) |
| ⭐ | GCN | **ICLR 2017** | 스펙트럼 1차 근사 + 재정규화 | [gcn.md](gcn.md) |
| ⭐ | GraphSAGE | **NeurIPS 2017** | 이웃 샘플링 + 집계(귀납적) | [graphsage.md](graphsage.md) |
| ⭐ | GAT | **ICLR 2018** | 멀티헤드 셀프 어텐션 | [gat.md](gat.md) |
| ⭐ | GIN | **ICLR 2019** | 표현력=1-WL, 단사 집계(sum+MLP) | [gin.md](gin.md) |

> 관련 데이터셋: [Cora/Citeseer/Pubmed](../../datasets/cora-citeseer-pubmed.md),
> [Reddit/PPI](../../datasets/reddit-ppi.md), [BlogCatalog](../../datasets/blogcatalog.md)

---
[← 논문 모음](../index.md) · [다음: 이종 그래프 →](../heterogeneous/index.md)
