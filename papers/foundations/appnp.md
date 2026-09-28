---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Predict then Propagate: Graph Neural Networks meet Personalized PageRank (APPNP)"
description: 예측(피처→MLP)과 전파(personalized PageRank)를 분리해, 파라미터 증가·오버스무딩 없이 큰 이웃 범위를 활용하는 GNN. teleport 확률 α로 자기 신호를 유지.
resource: https://arxiv.org/abs/1810.05997
tags: [appnp, ppnp, personalized-pagerank, propagation, oversmoothing, decoupling, node-classification]
authors: Johannes Gasteiger (Klicpera), Aleksandar Bojchevski, Stephan Günnemann
venue: ICLR 2019
year: 2019
timestamp: 2026-09-28T00:00:00Z
---

# ⭐ Predict then Propagate: GNNs meet Personalized PageRank (APPNP)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **ICLR 2019**

[← 카테고리](index.md) · 원문: [arXiv:1810.05997](https://arxiv.org/abs/1810.05997)

- **저자**: Johannes Gasteiger(Klicpera), Aleksandar Bojchevski, Stephan Günnemann
- **발표처/연도**: ICLR 2019 (모델: PPNP / 근사판 APPNP)

## 문제 (Problem)
[GCN](gcn.md)은 매 층에서 **전파(이웃 집계)와 변환(가중치)을 묶는다.** 그래서 더 넓은 이웃을 보려고 층을
늘리면 ① **파라미터가 늘고** ② **오버스무딩** 이 생긴다. 넓은 이웃과 깊이를 값싸게 얻고 싶다.

## 방법 (Method)
**예측과 전파를 분리(decouple)** 한다: 먼저 각 노드의 **자기 피처로 예측**, 그다음 **personalized PageRank**
로 그 예측을 이웃에 번지게 한다.

## 핵심 메커니즘 — APPNP가 *실제로* 하는 것

> **한 줄 요약**: "**먼저 예측(MLP), 나중에 전파(PageRank)**." 전파에는 **학습 파라미터가 없고**, teleport
> 확률 $\alpha$ 로 자기 예측을 계속 되섞어 **오버스무딩 없이** 큰 이웃을 활용한다.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| 깊게 = 오버스무딩 불가피 | 층↑ → 뭉개짐 | 전파/변환 분리 + **teleport $\alpha$** 로 완화 |
| 이웃 넓히면 파라미터↑ | 층마다 W | **전파엔 파라미터 없음**(K 자유롭게↑) |
| GCN과 같은 순서 | 섞어서 반복 | **예측 먼저 → 전파 나중**(분리) |
| 그냥 평균 전파 | 균일 | **personalized PageRank**(자기 노드로 재시작) |

### 수식
예측 $H = f_\theta(X)$ (MLP), 이후 $K$번 전파:
$$Z^{(0)} = H,\qquad Z^{(k+1)} = (1-\alpha)\,\hat{A}\,Z^{(k)} + \alpha\,H$$
$\hat A=\tilde D^{-1/2}\tilde A\tilde D^{-1/2}$, $\alpha$=teleport(재시작) 확률. **PPNP** 는 이를 닫힌형
$\alpha(I-(1-\alpha)\hat A)^{-1}H$ 로, **APPNP** 는 위 반복으로 근사.

### 왜 작동하나
- 매 스텝 $\alpha H$ 로 **자기 예측을 되섞어** 표현이 한 점으로 수렴(오버스무딩)하는 것을 막는다.
- 전파에 파라미터가 없어 $K$를 키워 **큰 수용영역(receptive field)** 을 값싸게 확보.

### 한 줄 비유
> 각자 먼저 답을 적고(MLP), 그 답을 이웃끼리 **PageRank처럼 번지게** 하되 계속 **자기 답($\alpha$)으로 되돌아와**
> 완전히 물들지는 않게 한다.

## 핵심 기여 (Contributions)
- 예측·전파 **분리** 로 오버스무딩 완화 + 큰 이웃 활용.
- **personalized PageRank** 전파(파라미터 없음) — 어떤 신경망과도 결합 가능.

## 결과·데이터셋 (Results)
[Cora / Citeseer / Pubmed](../../datasets/cora-citeseer-pubmed.md) 등에서 GCN 대비 향상·깊이 강건성
*(구체 수치 원문 확인)*.

## 관련 링크
- 개념: [오버스무딩·메시지 패싱](../../concepts/glossary.md)
- 기반/비교: [GCN](gcn.md)(전파+변환 결합)·[SGC](sgc.md)(다른 단순화)

---
[← 카테고리](index.md)
