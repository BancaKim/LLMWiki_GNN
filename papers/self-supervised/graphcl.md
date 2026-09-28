---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Graph Contrastive Learning with Augmentations (GraphCL)"
description: 4가지 그래프 증강(노드 드롭·엣지 변형·속성 마스킹·서브그래프)으로 두 뷰를 만들고 InfoNCE로 일치를 최대화하는 대조학습 프레임워크. SimCLR의 그래프판.
resource: https://arxiv.org/abs/2010.13902
tags: [self-supervised, contrastive-learning, augmentation, infonce, graph-classification]
authors: Yuning You, Tianlong Chen, Yongduo Sui, Ting Chen, Zhangyang Wang, Yang Shen
venue: NeurIPS 2020
year: 2020
timestamp: 2026-09-28T00:00:00Z
---

# ⭐ Graph Contrastive Learning with Augmentations (GraphCL)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **NeurIPS 2020**

[← 카테고리](index.md) · 원문: [arXiv:2010.13902](https://arxiv.org/abs/2010.13902)

- **저자**: Yuning You, Tianlong Chen, Yongduo Sui, Ting Chen, Zhangyang Wang, Yang Shen
- **발표처/연도**: NeurIPS 2020

## 문제 (Problem)
이미지 대조학습(SimCLR)은 증강(augmentation)에 대한 불변성으로 강한 표현을 배운다. **그래프에 맞는 증강** 은
무엇이고, 어떤 조합이 유용한가? 그래프용 대조 SSL 프레임워크가 필요하다.

## 방법 (Method)
**4가지 그래프 증강** 으로 두 뷰를 만들고, 같은 그래프의 두 뷰는 가깝게·다른 그래프는 멀게(InfoNCE) 학습.

## 핵심 메커니즘 — GraphCL이 *실제로* 하는 것

> **한 줄 요약**: 한 그래프를 **조금씩 다르게 변형한 두 버전을 "같다"**, 배치 내 다른 그래프는 "다르다"고
> 학습(그래프판 SimCLR). 핵심 기여는 **어떤 증강이 어떤 도메인에 유효한지** 를 규명한 것.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| 이미지 증강 그대로 | crop/flip | **그래프 전용 4종** (노드 드롭·엣지 변형·속성 마스킹·서브그래프) |
| 아무 증강이나 OK | 무관 | **도메인마다 유효 증강이 다름**(핵심 실험적 기여) |
| 노드 단위 | 노드만 | 주로 **그래프 수준** 대조(그래프 분류) |
| 네거티브 출처 | 별도 샘플 | **배치 내 다른 그래프**(InfoNCE/NT-Xent) |

### 4가지 증강
**노드 드롭(node dropping)** · **엣지 변형(edge perturbation)** · **속성 마스킹(attribute masking)** ·
**서브그래프 샘플링(subgraph)**. 두 증강으로 만든 뷰 $g_i, g_j$ 를 인코더+프로젝션 후 대조:
$$\mathcal{L} = -\log\frac{\exp(\text{sim}(z_i,z_j)/\tau)}{\sum_{k\neq i}\exp(\text{sim}(z_i,z_k)/\tau)}\quad(\text{InfoNCE})$$

### 왜 작동하나
"의미를 보존하는 증강에 불변" 하도록 학습하면, 라벨 없이도 **일반화·전이·강건성** 이 좋은 표현을 얻는다.
어떤 증강이 의미를 보존하는지는 데이터 특성(분자·소셜 등)에 따라 다르다.

### 한 줄 비유
> 같은 그래프의 "살짝 다른 사진 두 장"을 같다고, 남의 그래프와는 다르다고 가르친다(SimCLR의 그래프 버전).

## 핵심 기여 (Contributions)
- 그래프 대조학습 프레임워크 + **4가지 그래프 증강** 체계화.
- 증강 조합이 성능에 미치는 영향을 **도메인별로 분석**.

## 결과·데이터셋 (Results)
반지도·비지도·전이 설정의 그래프 분류 벤치마크(생물정보·소셜, [OGB](../../datasets/ogb.md) 계열 포함)에서
경쟁력 있는 성능 *(구체 수치 원문 확인)*.

## 관련 링크
- 개념: [자기지도·대조학습·InfoNCE](../../concepts/glossary.md)
- 계열: [DGI](dgi.md)(MI 기반 SSL) · 인코더 [GCN](../foundations/gcn.md)/[GIN](../foundations/gin.md)

---
[← 카테고리](index.md)
