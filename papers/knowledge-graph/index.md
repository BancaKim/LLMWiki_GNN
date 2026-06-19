---
type: Index
title: 🔗 지식 그래프 (Knowledge Graph)
description: (head, relation, tail) 삼중항으로 이루어진 지식그래프 표현학습 4편 — 얕은 KG 임베딩(TransE·RotatE)과 다관계 GNN 인코더(R-GCN·CompGCN). 3편 ⭐ 필독 + R-GCN 🏅.
tags: [knowledge-graph, kg-embedding, multi-relational, link-prediction, must-read]
timestamp: 2026-06-19T00:00:00Z
---

# 🔗 지식 그래프 (Knowledge Graph)

[← 논문 모음](../index.md) · [번들 루트](../../index.md)

지식그래프는 **(head, relation, tail)** 삼중항의 집합입니다. 관계 패턴을 임베딩하는 **얕은 KG 임베딩** 과,
[GCN](../foundations/gcn.md) 을 **다관계** 로 확장한 **관계형 GNN 인코더** 두 흐름을 다룹니다.

> **범례**: ⭐ = 탑티어 AI 학회 게재 **필독(MUST-READ)** · 🏅 = 영향력 크나 AI-탑티어 랭킹 아님(보조).

## 얕은 KG 임베딩 (관계 기하 모델링)
| ⭐ | 논문 | 연도/발표처 | 핵심 아이디어 | concept |
|:--:|------|------------|--------------|---------|
| ⭐ | TransE | **NeurIPS 2013** | 관계 = 평행이동 (h+r≈t) | [transe.md](transe.md) |
| ⭐ | RotatE | **ICLR 2019** | 관계 = 복소공간 회전 (대칭/역/합성) | [rotate.md](rotate.md) |

## 다관계 GNN 인코더 (구조 인코딩)
| ⭐ | 논문 | 연도/발표처 | 핵심 아이디어 | concept |
|:--:|------|------------|--------------|---------|
| 🏅 | R-GCN | ESWC 2018 | 관계별 가중치 + 베이시스 분해 | [rgcn.md](rgcn.md) |
| ⭐ | CompGCN | **ICLR 2020** | 노드+관계 공동 임베딩, 합성 연산 | [compgcn.md](compgcn.md) |

> **흐름**: [TransE](transe.md)(이동)→[RotatE](rotate.md)(회전)로 관계 패턴 표현력 확대,
> [R-GCN](rgcn.md)→[CompGCN](compgcn.md)으로 이웃 구조까지 인코딩. CompGCN은 [StarE](../hypergraph/stare.md)의 기반.
> 관련 데이터셋: [FB15k-237 / WN18RR](../../datasets/fb15k-237-wn18rr.md)

---
[← 이전: 이종 그래프](../heterogeneous/index.md) · [다음: 하이퍼그래프 →](../hypergraph/index.md)
