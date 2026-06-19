---
type: Knowledge Base
title: Graph Representation Learning — LLM Wiki
description: An Open Knowledge Format (OKF) bundle curating the foundational research of Graph Neural Networks and graph representation learning — from random-walk embeddings (DeepWalk, node2vec) and GNN backbones (GCN, GraphSAGE, GAT) to heterogeneous / knowledge-graph / hypergraph extensions (metapath2vec, HGT, TransE, RotatE, R-GCN, CompGCN, HGNN, StarE).
tags: [gnn, graph-representation-learning, node-embedding, knowledge-graph, heterogeneous-graph, hypergraph, llm-wiki, okf]
timestamp: 2026-06-19T00:00:00Z
---

# Graph Representation Learning — LLM Wiki (OKF Bundle)

> **그래프 표현학습(Graph Representation Learning) · 그래프 신경망(GNN)의 핵심 기반 논문 위키.**
> 본 번들은 [Open Knowledge Format (OKF) v0.1](https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing) 사양을 따릅니다.

이 위키는 그래프 위에서 노드·엣지·그래프의 표현(embedding)을 학습하는 **GNN / 표현학습의 기반(landmark) 논문 13편** 을
OKF **concept** 문서로 정리합니다. 랜덤워크 임베딩에서 시작해 메시지 패싱 GNN, 그리고 이종(heterogeneous)·
지식그래프(KG)·하이퍼그래프(hypergraph) 로의 확장까지 한 흐름으로 이어집니다.

## 이 번들의 구조 (OKF)

이 저장소는 OKF **bundle** 입니다. 각 markdown 파일은 하나의 **concept** 이며, YAML frontmatter
(필수 `type` 필드)와 markdown 본문으로 구성됩니다. 파일 간 markdown 링크가 **지식 그래프** 를 형성합니다.

```
.
├── index.md                 ← (현재 문서) 번들 루트 / progressive disclosure
├── log.md                   ← 변경 이력 (OKF 예약 파일)
├── concepts/                ← 배경 개념 (개요·분류·용어·동향)
├── datasets/                ← 표준 벤치마크 데이터셋 concept
└── papers/                  ← 논문 concept (4개 주제 디렉터리)
```

## 🧭 탐색 (Progressive Disclosure)

| 영역 | 설명 | 바로가기 |
|------|------|----------|
| 📚 배경 개념 | 그래프 표현학습 개요·분류·용어·동향 | [concepts/index.md](concepts/index.md) |
| 🧪 데이터셋 | 표준 벤치마크 데이터셋 | [datasets/index.md](datasets/index.md) |
| 📄 논문 | 13편 논문 (4개 주제) | [papers/index.md](papers/index.md) |
| 🧰 노트앱으로 보기 | Obsidian으로 iPad·iPhone·Mac 동기화 | [obsidian-setup.md](obsidian-setup.md) |
| 📊 대시보드 | Dataview 동적 목록(⭐/연도/태그별) | [dashboard.md](dashboard.md) |
| 🤖 주간 자동 업데이트 | Routine으로 매주 신규 논문 스캔→초안 PR | [automation-weekly-routine.md](automation-weekly-routine.md) |

### 주제별 논문 디렉터리

> **범례**: ⭐ = **탑티어 AI 학회 게재 필독(MUST-READ)** 논문 (NeurIPS · ICML · ICLR · KDD · WWW · AAAI · EMNLP 등).
> 🏅 = 영향력은 크지만 AI-탑티어 랭킹은 아닌 학회(보조 표기).

| 주제 | 논문 수 | ⭐ 필독 | 바로가기 |
|------|:------:|:------:|----------|
| 📐 기초 (랜덤워크·GNN 백본) | 5 | 5 | [papers/foundations/index.md](papers/foundations/index.md) |
| 🔀 이종 그래프 (Heterogeneous) | 2 | 2 | [papers/heterogeneous/index.md](papers/heterogeneous/index.md) |
| 🔗 지식 그래프 (Knowledge Graph) | 4 | 3 | [papers/knowledge-graph/index.md](papers/knowledge-graph/index.md) |
| 🕸️ 하이퍼그래프·하이퍼관계 | 2 | 2 | [papers/hypergraph/index.md](papers/hypergraph/index.md) |

### ⭐ 필독 논문 (탑티어 학회) — 12편

처음 읽는다면 아래 순서를 권합니다. 전체 목록·범례는 [papers/index.md](papers/index.md).

| ⭐ | 논문 | 발표처 | concept |
|:--:|------|--------|---------|
| ⭐ | DeepWalk | **KDD 2014** | [papers/foundations/deepwalk.md](papers/foundations/deepwalk.md) |
| ⭐ | node2vec | **KDD 2016** | [papers/foundations/node2vec.md](papers/foundations/node2vec.md) |
| ⭐ | GCN | **ICLR 2017** | [papers/foundations/gcn.md](papers/foundations/gcn.md) |
| ⭐ | GraphSAGE | **NeurIPS 2017** | [papers/foundations/graphsage.md](papers/foundations/graphsage.md) |
| ⭐ | GAT | **ICLR 2018** | [papers/foundations/gat.md](papers/foundations/gat.md) |
| ⭐ | metapath2vec | **KDD 2017** | [papers/heterogeneous/metapath2vec.md](papers/heterogeneous/metapath2vec.md) |
| ⭐ | HGT | **WWW 2020** | [papers/heterogeneous/hgt.md](papers/heterogeneous/hgt.md) |
| ⭐ | TransE | **NeurIPS 2013** | [papers/knowledge-graph/transe.md](papers/knowledge-graph/transe.md) |
| ⭐ | RotatE | **ICLR 2019** | [papers/knowledge-graph/rotate.md](papers/knowledge-graph/rotate.md) |
| ⭐ | CompGCN | **ICLR 2020** | [papers/knowledge-graph/compgcn.md](papers/knowledge-graph/compgcn.md) |
| ⭐ | HGNN | **AAAI 2019** | [papers/hypergraph/hgnn.md](papers/hypergraph/hgnn.md) |
| ⭐ | StarE | **EMNLP 2020** | [papers/hypergraph/stare.md](papers/hypergraph/stare.md) |

> 🏅 **참고**: [R-GCN](papers/knowledge-graph/rgcn.md)(ESWC 2018) 은 관계형 GNN의 시초로 매우 영향력이 크지만
> 학회 랭킹상 ⭐(AI-탑티어) 대상은 아니어서 🏅 보조 표기합니다.

## 🔑 핵심 요약 (TL;DR)

- **하나의 흐름**: ① 랜덤워크로 노드를 "단어"처럼 임베딩([DeepWalk](papers/foundations/deepwalk.md) →
  [node2vec](papers/foundations/node2vec.md)) → ② 그래프 구조를 직접 신경망에 넣는 **메시지 패싱**
  ([GCN](papers/foundations/gcn.md) → [GraphSAGE](papers/foundations/graphsage.md) →
  [GAT](papers/foundations/gat.md)) → ③ 노드/엣지가 **여러 타입** 인 현실 그래프로 확장
  (이종·KG·하이퍼그래프).
- **3대 확장축**: **이질형 타입**(heterogeneous), **다관계·지식그래프**(multi-relational / KG),
  **고차 관계**(hyper-relational / hypergraph). → [분류 체계](concepts/taxonomy.md)
- **왜 중요한가**: 이 13편은 이후 거의 모든 그래프 응용(추천·사기탐지·분자·NLP·KG 추론)의
  **백본·인코더** 가 되었습니다. → [동향·과제](concepts/trends-and-challenges.md)

> ⚠️ **정확성 안내**: 본 위키는 LLM(Claude)이 정리했습니다. 저자·발표처·핵심 기법 등 핵심 사실은
> 교차 검증했으나 일부 세부 수치는 원문 확인이 필요할 수 있어 *(미확인)* 으로 표기했습니다.
> 인용 전 각 concept 문서의 `resource` 링크(원문)를 확인하세요.

*최종 갱신: 2026-06-19 · 변경 이력: [log.md](log.md)*
