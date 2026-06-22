---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "RotatE: Knowledge Graph Embedding by Relational Rotation in Complex Space"
description: 관계를 복소공간에서의 회전으로 모델링(t = h ∘ r, |r|=1)해 대칭/반대칭·역·합성 관계 패턴을 모두 표현. 자기적대적 네거티브 샘플링을 도입.
resource: https://arxiv.org/abs/1902.10197
tags: [knowledge-graph, kg-embedding, rotation, complex-space, relation-patterns, self-adversarial, link-prediction]
authors: Zhiqing Sun, Zhi-Hong Deng, Jian-Yun Nie, Jian Tang
venue: ICLR 2019
year: 2019
timestamp: 2026-06-22T00:00:00Z
---

# ⭐ RotatE: Knowledge Graph Embedding by Relational Rotation in Complex Space

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **ICLR 2019**

[← 카테고리](index.md) · 원문: [arXiv:1902.10197](https://arxiv.org/abs/1902.10197)

- **저자**: Zhiqing Sun, Zhi-Hong Deng, Jian-Yun Nie, Jian Tang
- **발표처/연도**: ICLR 2019

## 문제 (Problem)
KG에는 **대칭(symmetry)·반대칭(antisymmetry)·역(inversion)·합성(composition)** 같은 관계 패턴이 흔하다.
[TransE](transe.md)(이동)는 대칭을, DistMult(내적)는 반대칭을 표현하지 못하는 등, 한 모델이 이들을 **모두**
담기 어려웠다.

## 방법 (Method)
관계를 **복소공간에서의 회전(rotation)** 으로 본다: **t = h ∘ r**, 각 관계 성분의 **모듈러스는 1**.

## 핵심 메커니즘 — RotatE가 *실제로* 하는 것

> **한 줄 요약**: 관계를 복소평면에서의 **위상 회전** 으로 두면, 회전의 대수적 성질 덕분에 **대칭·반대칭·
> 역·합성** 을 한 모델에서 표현할 수 있다.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| TransE와 본질 | 또 다른 거리 모델일 뿐 | **이동(덧셈) → 회전(곱셈)** — 표현 가능한 패턴 집합이 근본적으로 넓어짐 |
| 복소공간 | 임의 선택 | 회전 = $e^{i\theta}$, **위상의 덧셈/반전** 으로 합성/역을 자연스럽게 표현 |
| 대칭 관계 | 여전히 불가 | $\theta_i\in\{0,\pi\}$ ($r_i^2=1$)로 **대칭 표현 가능** |
| 네거티브 샘플링 | 균일 무작위 | **자기적대적(self-adversarial)** — 어려운 음성에 가중 |

### 점수 함수 (복소 회전)
각 관계 성분 $r_i = e^{i\theta_{r,i}}$ ($|r_i|=1$), 원소별 복소곱 $\circ$:
$$f(h,r,t) = -\lVert h \circ r - t\rVert$$

**패턴 표현 방식**
- **대칭**: $r\circ r = \mathbf{1}$ → 위상 $0$ 또는 $\pi$.
- **반대칭**: $r\circ r \neq \mathbf{1}$.
- **역(inverse)**: $r_2 = \bar{r_1}$ (켤레, 위상 부호 반전).
- **합성(composition)**: $r_3 = r_1\circ r_2$ → **위상의 덧셈** $\theta_3=\theta_1+\theta_2$.

### 자기적대적 네거티브 샘플링
음성 삼중항을 **현재 모델 점수에 비례한 확률** 로 가중해 학습:
$$\mathcal{L} = -\log\sigma(\gamma - d(h,r,t)) - \sum_i p(h_i',r,t_i')\,\log\sigma(d(h_i',r,t_i') - \gamma)$$
$$p(h_j',r,t_j') = \frac{\exp \alpha\, f(h_j',r,t_j')}{\sum_i \exp \alpha\, f(h_i',r,t_i')}$$
즉 "그럴듯한(어려운) 음성"에 큰 가중 → 학습 효율·성능 향상(다른 KG 모델에도 널리 채택).

### 왜 작동하나
회전은 **거리(노름)를 보존** 하면서 위상만 바꾸므로, 위상의 덧셈·반전으로 관계 패턴을 **대수적으로**
인코딩한다 → 단일 모델이 여러 패턴을 동시에 만족 가능.

### 한 줄 비유
> 관계가 엔티티를 **"복소평면에서 정해진 각도만큼 돌린다"**. 두 번 돌려 제자리(=대칭), 반대로 돌리기
> (=역), 각도를 더하기(=합성)가 모두 자연스럽다.

## 핵심 기여 (Contributions)
- 단일 모델로 **대칭/반대칭/역/합성** 패턴을 모두 표현(이론적 근거 제시).
- **자기적대적 네거티브 샘플링** 제안.

## 결과·데이터셋 (Results)
[FB15k-237, WN18RR](../../datasets/fb15k-237-wn18rr.md)(및 FB15k, WN18, Countries)에서 링크 예측
**MRR / Hits@1,3,10** 당시 SOTA급.

## 관련 링크
- 개념: [KG 임베딩·관계 패턴·자기적대적 샘플링](../../concepts/glossary.md)
- 비교/기반: [TransE](transe.md)(이동) · GNN 인코더 결합 [CompGCN](compgcn.md)

---
[← 카테고리](index.md)
