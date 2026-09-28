---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Simplifying Graph Convolutional Networks (SGC)"
description: GCN에서 층 사이 비선형을 제거하고 가중치를 합쳐, K-홉 전파를 하나의 고정 저역통과 필터 S^K로 만든 선형 모델. 정확도는 유지하며 수십~수백 배 빠름.
resource: https://arxiv.org/abs/1902.07153
tags: [sgc, gcn, low-pass-filter, linear-model, simplification, scalability, node-classification]
authors: Felix Wu, Amauri Souza, Tianyi Zhang, Christopher Fifty, Tao Yu, Kilian Q. Weinberger
venue: ICML 2019
year: 2019
timestamp: 2026-09-28T00:00:00Z
---

# ⭐ Simplifying Graph Convolutional Networks (SGC)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **ICML 2019**

[← 카테고리](index.md) · 원문: [arXiv:1902.07153](https://arxiv.org/abs/1902.07153)

- **저자**: Felix Wu, Amauri Souza, Tianyi Zhang, Christopher Fifty, Tao Yu, Kilian Q. Weinberger
- **발표처/연도**: ICML 2019

## 문제 (Problem)
[GCN](gcn.md)은 매 층에 **비선형 + 가중치** 를 쌓는다. 그런데 노드 분류에서 이 **비선형이 정말 필요한가?**
불필요하다면 학습·추론 비용을 크게 줄일 수 있다.

## 방법 (Method)
GCN에서 **층 사이 비선형(ReLU)을 제거** 하고 연속된 가중치 행렬을 하나로 합친다.

## 핵심 메커니즘 — SGC가 *실제로* 하는 것

> **한 줄 요약**: K층 GCN에서 비선형을 빼면 **"고정 저역통과 필터 $S^K$ 한 번 + 로지스틱 회귀"** 로 붕괴한다.
> $S^K X$ 는 **한 번만 미리 계산**, 이후 학습은 선형 분류기뿐 → 매우 빠름.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| GCN 비선형 | 필수 | 많은 노드 분류에선 **거의 불필요** |
| SGC = 새 아키텍처 | 복잡한 신모델 | GCN에서 **비선형 제거 = 선형화** |
| 선형이면 느릴 것 | 반복 전파 | $S^K X$ **사전계산** → LR만 학습, 수십~수백 배↑ |
| 성능 손해 | 크게 하락 | 표준 벤치마크서 **GCN과 대등** |

### 수식
$$\hat{Y} = \text{softmax}\big( S^{K}\,X\,\Theta \big),\qquad S = \tilde{D}^{-1/2}\tilde{A}\tilde{D}^{-1/2}\ (\tilde A=A+I)$$
$S^K$ 는 학습 파라미터가 없는 **고정** 연산자(K-홉 저역통과 필터). $\Theta$ 만 학습(사실상 로지스틱 회귀).

### 왜 작동하나
**동질성(homophily)** 그래프에서는 저역통과 스무딩($S^K$)이 성능의 대부분을 담당하고, 층간 비선형의 기여는
작다. → GCN을 "펴서" 보면 정체가 드러난다([GCN이 저역통과 필터](gcn.md)라는 관점의 극단).

### 한 줄 비유
> GCN을 쭉 **펴면(비선형 제거)** 결국 "이웃 평균을 K번 미리 해두고(고정 필터) → 로지스틱 회귀" 다.

## 핵심 기여 (Contributions)
- GCN의 **비선형이 노드 분류에 거의 불필요** 함을 실증.
- **선형·사전계산** 으로 수십~수백 배 속도·확장성, 해석 용이.
- GCN을 **고정 저역통과 필터** 로 보는 관점을 명확화.

## 결과·데이터셋 (Results)
[Cora / Citeseer / Pubmed](../../datasets/cora-citeseer-pubmed.md) 등에서 GCN급 정확도 + 큰 속도 이득
*(구체 수치 원문 확인)*.

## 관련 링크
- 개념: [스펙트럼·저역통과 필터](../../concepts/glossary.md)
- 기반/비교: [GCN](gcn.md)(단순화 대상)·[APPNP](appnp.md)(다른 방향의 단순화·전파)·[GIN](gin.md)(표현력 관점)

---
[← 카테고리](index.md)
