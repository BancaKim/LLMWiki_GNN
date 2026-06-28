---
type: Changelog
title: Change Log
description: Chronological history of changes to this OKF bundle.
timestamp: 2026-06-19T00:00:00Z
---

# Change Log

OKF 예약 파일입니다. 번들의 변경 이력을 시간 순으로 기록합니다.

## 2026-06-22 — node2vec: α_pq 정규화(확률 아님) 주의 노트 추가

- [`papers/foundations/node2vec.md`](papers/foundations/node2vec.md) 에 주의 박스 추가:
  $\alpha_{pq}$ 는 **비정규화 가중치(점수)** 이며 이웃 합 $Z$ 로 나눠 확률이 됨($1/p+1+1/q$ 가 1을 넘어도 무방).
  정규화 식 + 숫자 예시($p{=}1,q{=}2$ → 0.4/0.4/0.2), $d{=}1$ 의 "1"은 기준값(비율만 의미)임을 명확화.

## 2026-06-22 — node2vec: "2차 = 마르코프 차수 ≠ 워크 길이" 주의 노트 추가

- [`papers/foundations/node2vec.md`](papers/foundations/node2vec.md) 단계별 메커니즘에 주의 박스 추가:
  "2nd-order"는 **다음 노드 선택 시 직전 노드까지 본다**(마르코프 차수)는 뜻이며 **워크 길이가 2가 아님**.
  워크 길이 $l$ · 마르코프 차수 2 · SkipGram 윈도우 $k$ 가 서로 별개임을 명확화.

## 2026-06-22 — node2vec: BFS/DFS ↔ 유사성 매핑 주의 노트 추가

- [`papers/foundations/node2vec.md`](papers/foundations/node2vec.md) 에 **"Figure 1 함정"** 주의 박스 추가:
  논문 Figure 1의 예시 노드 s1(동질성)·s6(구조적 동등성)은 **두 개념의 정의 예시일 뿐**, BFS/DFS 매핑이
  아님을 명확화. 실제 매핑은 **BFS=구조적 동등성(미시적), DFS=동질성(거시적)** 이며 본문·Figure 3
  (homophily `q=0.5`, structural equivalence `q=2`)으로 근거 제시. 원문 인용·출처 링크 포함.

## 2026-06-22 — 전 논문 concept 심화 (12편)

- DeepWalk와 동일한 **심화 템플릿** 을 나머지 **논문 12편 전체** 에 적용:
  각 문서에 **"핵심 메커니즘 — <X>가 실제로 하는 것"** 섹션 추가
  (① 한 줄 요약 ② 흔한 오해 vs 실제 표 ③ 단계별 메커니즘 ④ 수식/손실(LaTeX) ⑤ 왜 작동하나 ⑥ 한 줄 비유),
  필요한 경우 **한계·후속** 절 보강 + frontmatter 태그 확장.
- 대상:
  - 기초: [node2vec](papers/foundations/node2vec.md)(2차 편향워크 α_pq·BFS↔DFS),
    [GCN](papers/foundations/gcn.md)(스펙트럼 1차근사·저역통과·오버스무딩),
    [GraphSAGE](papers/foundations/graphsage.md)(aggregator 학습·SGNS 손실·미니배치),
    [GAT](papers/foundations/gat.md)(masked attention·멀티헤드 수식).
  - 이종: [metapath2vec](papers/heterogeneous/metapath2vec.md)(타입별 소프트맥스 ++),
    [HGT](papers/heterogeneous/hgt.md)(메타관계 상호 어텐션·RTE·HGSampling).
  - KG: [TransE](papers/knowledge-graph/transe.md)(마진 랭킹·대칭/N:N 한계 증명),
    [RotatE](papers/knowledge-graph/rotate.md)(복소 회전·패턴 표현·자기적대적 샘플링),
    [R-GCN](papers/knowledge-graph/rgcn.md)(관계별 W_r·베이시스 분해·DistMult 디코더),
    [CompGCN](papers/knowledge-graph/compgcn.md)(노드+관계 공동 임베딩·방향별 3가중치·합성 연산).
  - 하이퍼그래프: [HGNN](papers/hypergraph/hgnn.md)(인시던스 행렬·2단계 집계 수식),
    [StarE](papers/hypergraph/stare.md)(한정자 집계·statement 보존·트랜스포머 디코더).
- 정확성 원칙 유지: 구체 수치는 정성 기술 또는 `(미확인)`, 수식은 표준 정의 기준.

## 2026-06-22 — DeepWalk concept 강화 ("실제로 학습하는 것")

- [`papers/foundations/deepwalk.md`](papers/foundations/deepwalk.md) 에 **"DeepWalk가 실제로 학습하는
  것"** 섹션 추가: 흔한 오해 vs 실제 표, 메커니즘 4단계(워크 생성·γ 반복·윈도우 슬라이딩·임베딩 학습),
  SGNS 손실 함수, 작동 원리, 비유.
  - 핵심 정정: 랜덤워크의 학습 신호는 *(시작, 종착)* 이 아니라 **워크 시퀀스상 ±window 동시 등장
    (co-occurrence)** 쌍이다.
  - frontmatter 태그에 `sgns`, `co-occurrence`, `negative-sampling` 추가, timestamp 갱신.
  - [node2vec](papers/foundations/node2vec.md)·[metapath2vec](papers/heterogeneous/metapath2vec.md) 로의
    동시 등장 관점 연결 추가.

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
