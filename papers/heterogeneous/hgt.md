---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Heterogeneous Graph Transformer (HGT)"
description: 메타관계(소스타입–엣지타입–타깃타입)별로 분리된 투영·어텐션 파라미터로 이종 그래프를 처리하는 트랜스포머형 GNN. 상대적 시간 인코딩(RTE)과 HGSampling으로 동적·대규모 그래프 지원.
resource: https://arxiv.org/abs/2003.01332
tags: [heterogeneous, graph-transformer, meta-relation, attention, parameter-sharing, temporal, sampling]
authors: Ziniu Hu, Yuxiao Dong, Kuansan Wang, Yizhou Sun
venue: WWW 2020
year: 2020
timestamp: 2026-06-22T00:00:00Z
---

# ⭐ Heterogeneous Graph Transformer (HGT)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **WWW (TheWebConf) 2020**

[← 카테고리](index.md) · 원문: [arXiv:2003.01332](https://arxiv.org/abs/2003.01332)

- **저자**: Ziniu Hu, Yuxiao Dong, Kuansan Wang, Yizhou Sun
- **발표처/연도**: WWW 2020

## 문제 (Problem)
이종 그래프 방법은 보통 ① **수작업 메타패스**([metapath2vec](metapath2vec.md))에 의존하거나, ② 모든 타입에
**같은 가중치를 공유** 해 타입별 이질성을 못 담거나, ③ **시간 동역학** 과 ④ **웹 스케일(수억 노드)**
확장을 다루지 못한다.

## 방법 (Method)
트랜스포머 어텐션을 **메타관계(meta-relation)** 단위로 분해한다. 메타관계 = ⟨소스 타입 $\tau(s)$,
엣지 타입 $\phi(e)$, 타깃 타입 $\tau(t)$⟩ 삼중쌍.
- **이종 상호 어텐션** + **이종 메시지 패싱** + **타깃 타입별 갱신**.
- **상대적 시간 인코딩(RTE)** 으로 동적 그래프, **HGSampling** 으로 대규모 미니배치.

## 핵심 메커니즘 — HGT가 *실제로* 하는 것

> **한 줄 요약**: 메타패스를 짜는 대신, **메타관계 ⟨소스타입–엣지타입–타깃타입⟩ 마다 별도의 투영·어텐션
> 파라미터** 를 두되 **같은 메타관계끼리는 공유** 해, 이질성과 파라미터 효율을 동시에 잡는다.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| 메타패스 | 여전히 수동 설계 필요 | **불필요** — 메타관계로 자동 학습, 다홉은 층을 쌓아 *암묵적 메타패스* 구성 |
| 파라미터 | 타입마다 완전 독립 / 전부 공유 | **메타관계 단위로 공유** — 타입 이질성 ↔ 효율의 절충 |
| GAT와 차이 | GAT를 이종에 그대로 | Q/K/V·엣지 행렬을 **타입/메타관계별로 분리** (타입 의존 어텐션) |
| 시간 | 무시 | **RTE** 로 엣지 시간차를 인코딩 → 동적 그래프 |

### 단계별 메커니즘 (한 층)

타깃 노드 $t$, 소스 이웃 $s$, 엣지 $e$ 에 대해:

1. **이종 상호 어텐션(Heterogeneous Mutual Attention)** — 타입 의존 Q/K 투영 + 엣지타입 행렬 $W^{ATT}_{\phi(e)}$:
$$\text{ATT}(s,e,t) = \underset{s\in N(t)}{\text{Softmax}}\Big( \big(K\text{-Linear}_{\tau(s)}\,h_s\big)\, W^{ATT}_{\phi(e)}\, \big(Q\text{-Linear}_{\tau(t)}\,h_t\big)^\top \cdot \tfrac{\mu_{\langle\tau(s),\phi(e),\tau(t)\rangle}}{\sqrt{d}}\Big)$$
   (헤드별로 계산해 concat; $\mu$ 는 메타관계별 중요도 스칼라.)
2. **이종 메시지(Message)** — 타입별 V 투영 + 엣지타입 행렬 $W^{MSG}_{\phi(e)}$ 로 메시지 생성.
3. **집계 & 타깃 타입별 갱신(Aggregate)** — 어텐션 가중합 후 **타깃 타입 $\tau(t)$ 전용** A-Linear + 잔차로 갱신.

### 상대적 시간 인코딩 (RTE)
소스와 타깃의 시간차 $\Delta t$ 를 사인/코사인 기반 인코딩으로 만들어 소스 표현에 더함 → **언제 일어난
상호작용인지** 를 어텐션이 반영(시간 불변이 아니라 시간 인지).

### 확장: HGSampling
[GraphSAGE](../foundations/graphsage.md) 샘플링의 이종 버전. **타입별로 균형 있게** 이웃을 샘플링해
이종 서브그래프를 만들어, 웹 스케일 그래프를 미니배치로 학습.

### 왜 작동하나
- 메타관계별 파라미터로 **"저자–쓴–논문" 과 "논문–게재–학회" 를 다르게** 처리 → 이질성 포착.
- 같은 메타관계는 공유해 **파라미터 폭발 방지**.
- 층을 쌓으면 다홉 타입 경로가 자동 형성 → **메타패스를 손으로 안 짜도 됨**.

### 한 줄 비유
> 모든 관계를 같은 규칙으로 보지 않고, **"관계의 종류(소스–엣지–타깃 조합)마다 다른 렌즈"** 로 보되,
> 같은 종류의 관계끼리는 같은 렌즈를 쓴다.

## 핵심 기여 (Contributions)
- **메타관계 기반 타입 의존 어텐션** 으로 수작업 메타패스 제거.
- **RTE** 로 동적(시간) 그래프 표현.
- **HGSampling** 으로 웹 스케일(OAG) 학습 실현.

## 결과·데이터셋 (Results)
대규모 학술 그래프 **[Open Academic Graph(OAG)](../../datasets/dblp-aminer.md)** 및 서브셋에서 논문 분야
분류·저자/학회 예측 등 기존 이종 GNN 대비 큰 개선.

## 관련 링크
- 개념: [이종 그래프·메타관계·Graph Transformer](../../concepts/glossary.md)
- 기반: [GAT](../foundations/gat.md)(어텐션)·[GraphSAGE](../foundations/graphsage.md)(샘플링)·
  [metapath2vec](metapath2vec.md)(이종 출발점)

---
[← 카테고리](index.md)
