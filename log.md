---
type: Changelog
title: Change Log
description: Chronological history of changes to this OKF bundle.
timestamp: 2026-06-19T00:00:00Z
---

# Change Log

OKF 예약 파일입니다. 번들의 변경 이력을 시간 순으로 기록합니다.

## 2026-06-19 — 초기 번들 생성 (v0.1)

- OKF v0.1 사양에 따라 **Graph Representation Learning (GNN) LLM Wiki** 번들 초기 구성.
- 진입점 [`index.md`](index.md), 구조 설명 [`README.md`](README.md), 큐레이션 기준 [`CLAUDE.md`](CLAUDE.md) 작성.
- 배경 개념 5종 추가: [overview](concepts/overview.md), [taxonomy](concepts/taxonomy.md),
  [datasets 개요](concepts/datasets-overview.md), [glossary](concepts/glossary.md),
  [trends-and-challenges](concepts/trends-and-challenges.md).
- 벤치마크 데이터셋 concept 7종 추가 ([datasets/index.md](datasets/index.md)):
  Cora/Citeseer/Pubmed, Reddit/PPI, BlogCatalog, FB15k-237/WN18RR, WD50K, DBLP/AMiner, OGB.
- 논문 concept **13편** 추가 (4개 주제):
  - 📐 기초 5편 ([papers/foundations](papers/foundations/index.md)):
    DeepWalk(KDD'14), node2vec(KDD'16), GCN(ICLR'17), GraphSAGE(NeurIPS'17), GAT(ICLR'18).
  - 🔀 이종 그래프 2편 ([papers/heterogeneous](papers/heterogeneous/index.md)):
    metapath2vec(KDD'17), HGT(WWW'20).
  - 🔗 지식 그래프 4편 ([papers/knowledge-graph](papers/knowledge-graph/index.md)):
    TransE(NeurIPS'13), RotatE(ICLR'19), R-GCN(ESWC'18, 🏅), CompGCN(ICLR'20).
  - 🕸️ 하이퍼그래프·하이퍼관계 2편 ([papers/hypergraph](papers/hypergraph/index.md)):
    HGNN(AAAI'19), StarE(EMNLP'20).
- ⭐ 필독(탑티어 AI 학회) 표시: 12편(R-GCN 제외) — H1 ⭐, 본문 콜아웃, frontmatter `must_read`/`venue_tier`.
- 🏅 보조 표기: R-GCN(ESWC'18) — 영향력은 크나 AI-탑티어 랭킹 아님.
- 노트앱 보기 지원: [`obsidian-setup.md`](obsidian-setup.md), [`dashboard.md`](dashboard.md),
  [`.gitignore`](.gitignore), [`.obsidian/`](.obsidian) 초기 설정.
- 주간 자동 업데이트: [`automation-weekly-routine.md`](automation-weekly-routine.md),
  [`scripts/weekly-paper-scan-prompt.md`](scripts/weekly-paper-scan-prompt.md),
  [`scripts/setup-mac.command`](scripts/setup-mac.command).
- 큐레이션 방향: 본 번들은 **방법·표현학습 기반(landmark) 논문** 에 집중(응용 도메인은 별도 번들).

### 알려진 미확인 항목 (후속 검증 필요)
- 각 논문의 **구체 성능 수치(정확도/MRR/Hits@k)** 는 본문에서 정성적으로만 기술 — 인용 시 원문 확인 필요.
- 데이터셋 규모(노드·엣지 수)는 가장 널리 쓰이는 표준 분할 기준의 **근사값** — 분할/전처리에 따라 상이.
- metapath2vec resource 는 ACM DL DOI 링크 사용(별도 표준 arXiv 미확인).
