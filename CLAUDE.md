# CLAUDE.md — 프로젝트 가이드 / 큐레이션 기준

이 저장소는 **Graph Representation Learning (GNN) LLM Wiki** ([Open Knowledge Format(OKF) v0.1](https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing) 번들)입니다.
진입점은 [`index.md`](index.md), 구조 설명은 [`README.md`](README.md) 참고.

---

## ⭐ 논문 등급(필독) 판단 기준 — **AI 분야 기준 (사용자 지정, 기억할 것)**

> **사용자 선호(고정 규칙):** 학회·논문의 "탑티어(필독, ⭐)" 여부는 **AI 분야(AI/ML/DM/NLP/CV/멀티미디어)
> 의 학회·저널 랭킹**으로 판단한다. 응용·도메인 전용 학회/저널은 탑티어로 보지 않는다.

### ⭐ = 탑티어 AI 학회·저널 (필독)
- **일반 AI/ML**: NeurIPS, ICML, ICLR, AAAI, IJCAI, AISTATS, UAI, COLT
- **데이터마이닝·웹·IR**: KDD, WWW(TheWebConf), CIKM, WSDM, ICDM, SIGIR
- **NLP**: ACL, EMNLP, NAACL
- **비전**: CVPR, ICCV, ECCV
- **멀티미디어**: ACM MM
- **탑 AI 저널**: TPAMI, JMLR, AIJ, TKDE, TNNLS, TMLR

### 🏅 = 준-탑티어 / 영향력 큰 비-AI-탑티어 학회 (⭐ 아님, 보조 표기)
- 시맨틱 웹·도메인 학회: **ESWC**, ISWC 등 (R-GCN 게재처)
- 강한 응용 저널: IEEE TII, IEEE TIFS 등
- 분야 저널/리뷰: Frontiers of Computer Science(FCS), WIREs 등

### 표기에서 제외(일반)
- arXiv 프리프린트(정식 게재처 미확인) — 게재 확정 시 위 기준으로 재평가

### 현재 ⭐ 필독 15편 (AI 탑티어)
DeepWalk(KDD'14) · node2vec(KDD'16) · GCN(ICLR'17) · GraphSAGE(NeurIPS'17) · GAT(ICLR'18) ·
GIN(ICLR'19) · metapath2vec(KDD'17) · HGT(WWW'20) · TransE(NeurIPS'13) · RotatE(ICLR'19) ·
CompGCN(ICLR'20) · HGNN(AAAI'19) · StarE(EMNLP'20) · Graphormer(NeurIPS'21) · GraphGPS(NeurIPS'22).

### 🏅 보조 표기
R-GCN(ESWC'18) — 관계형 GNN의 시초로 영향력은 크나 ESWC는 AI-탑티어 랭킹이 아님.

> 위 venue 목록은 사용자가 언제든 조정할 수 있다. 새 논문 추가/등급 변경 시 **반드시 이 기준**을 적용할 것.

---

## ⭐ 표시 규칙 (적용 방법)

탑티어 AI 논문 concept 파일에는 다음 3가지를 모두 적용한다.
1. H1 제목 앞에 `⭐` (예: `# ⭐ GCN: ...`)
2. 본문 상단 콜아웃: `> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **<VENUE>**`
3. frontmatter: `must_read: true`, `venue_tier: top-tier conference`

목록(index) 파일에는 ⭐ 컬럼/범례와 필독 shortlist를 유지한다.
(🏅는 보조 표기로만 사용, ⭐ 카운트에는 넣지 않는다.)

---

## OKF 번들 작성 규칙

- 각 파일 = 하나의 concept. frontmatter 필수 필드 `type`, 권장 `title/description/resource/tags/venue/year/timestamp`.
- 디렉터리마다 `index.md`(progressive disclosure), 변경 이력은 [`log.md`](log.md).
- 파일 간 **상대경로 markdown 링크**로 지식 그래프를 구성 (절대 `/path` 금지 — GitHub 렌더링 호환).
- 논문 본문 양식: **문제 → 방법 → 핵심 기여 → 결과·데이터셋 → 관련 링크**.
- 확인 안 된 사실은 날조하지 말고 `(미확인)`으로 표기하고 [`log.md`](log.md)에 정리.
- 본 번들의 범위: **방법·표현학습 기반(landmark)** 논문. 특정 응용 도메인(예: 사기탐지)은
  별도 번들([LLMWiki_FDS] 등)로 분리.

## 작업 후 점검
- 내부 링크 무결성(모든 상대 링크 resolve) + frontmatter `type` 존재 + YAML 유효성 확인.
- 변경 시 [`log.md`](log.md)에 기록.
