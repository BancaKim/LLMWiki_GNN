---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "node2vec: Scalable Feature Learning for Networks"
description: 복귀(p)·인아웃(q) 파라미터로 제어되는 2차(biased) 랜덤워크로 BFS(구조적 동등성)와 DFS(동질성) 탐색을 보간하는 노드 임베딩. DeepWalk를 일반화.
resource: https://arxiv.org/abs/1607.00653
tags: [random-walk, node-embedding, skipgram, biased-walk, second-order-walk, link-prediction]
authors: Aditya Grover, Jure Leskovec
venue: KDD 2016
year: 2016
timestamp: 2026-06-22T00:00:00Z
---

# ⭐ node2vec: Scalable Feature Learning for Networks

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **KDD 2016**

[← 카테고리](index.md) · 원문: [arXiv:1607.00653](https://arxiv.org/abs/1607.00653)

- **저자**: Aditya Grover, Jure Leskovec
- **발표처/연도**: KDD 2016

## 문제 (Problem)
[DeepWalk](deepwalk.md) 의 단순(균일) 랜덤워크는 탐색 전략이 **고정** 되어 있다. 그런데 그래프에는 성격이
다른 **두 가지 유사성** 이 공존한다.
- **동질성(homophily)**: 같은 커뮤니티/클러스터에 속한 노드는 가깝게 임베딩되어야 한다.
- **구조적 동등성(structural equivalence)**: 그래프 내 **역할** 이 비슷한 노드(예: 여러 커뮤니티의 *허브*)는,
  멀리 떨어져 있어도 가깝게 임베딩되어야 한다.

균일 워크는 이 둘 사이를 조절할 수 없어, 한 임베딩이 두 신호를 동시에 잡기 어렵다.

## 방법 (Method)
탐색 편향을 조절하는 **유연한 2차(biased) 랜덤워크** 를 도입한다. 두 하이퍼파라미터로 "다음 스텝"을 제어:
- **복귀 파라미터 p (return)**: 방금 떠나온 노드로 되돌아갈 경향.
- **인아웃 파라미터 q (in-out)**: 출발지 근처에 머물지(**BFS**), 더 멀리 나아갈지(**DFS**) 결정.

생성된 워크에 [DeepWalk](deepwalk.md) 와 동일하게 **SkipGram + 네거티브 샘플링** 을 적용해 임베딩을 학습한다.
즉 **워크 샘플링 전략만 일반화** 한 것이다.

## 핵심 메커니즘 — node2vec이 *실제로* 하는 것

> **한 줄 요약**: 워크를 **2차(직전 노드를 기억하는)** 로 만들어, p·q 로 "지금까지 본 동선과의 거리"에
> 따라 다음 노드를 선택 → **BFS(구조적 동등성)와 DFS(동질성)** 사이를 **연속적으로 보간** 한다.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| 워크의 차수 | DeepWalk처럼 **1차 마르코프**(현재 노드만 봄) | **2차(second-order)** — *직전 노드 t* 도 함께 보고 다음을 결정 |
| BFS가 잡는 것 | 동질성(커뮤니티) | **구조적 동등성(역할)** — 자주 헷갈림 |
| DFS가 잡는 것 | 구조적 동등성 | **동질성(커뮤니티)** |
| DeepWalk와 관계 | 전혀 다른 방법 | **p=q=1 이면 node2vec = DeepWalk** (특수 케이스) |

> ⚠️ **헷갈리는 지점 — 논문 Figure 1의 "함정"**
> 논문 본문은 두 유사성을 *정의* 하며 예시 노드를 든다: **s1**(=u 와 같은 커뮤니티 → **동질성**),
> **s6**(=u 와 같은 허브 역할 → **구조적 동등성**). 그런데 Figure 1에서 **s1은 BFS 이웃**, **s6은 DFS로
> 도달** 하는 노드라, *"BFS=동질성, DFS=구조적 동등성"* 처럼 정반대로 읽히기 쉽다.
> 하지만 **s1·s6은 두 개념의 "정의" 예시일 뿐**, BFS/DFS 매핑이 아니다. 매핑의 근거는 *"그림에서 누구에게
> 닿느냐"* 가 아니라 *"그 전략이 전체 노드에 만드는 임베딩 구조"* 이며, 논문은 이를 명시한다:
> - *"neighborhoods sampled by **BFS** lead to embeddings that correspond closely to **structural
>   equivalence**"* (미시적 국소 샘플링 → 역할 지문).
> - *"**DFS** ... important in discovering **homophilous communities**"* (거시적 원거리 탐색 → 커뮤니티).
>
> 실험(**Figure 3**, Les Misérables)도 일치: **동질성** = `p=1, q=0.5`(DFS 성향), **구조적 동등성** =
> `p=1, q=2`(BFS 성향). → 결론은 위 표대로 **BFS=구조적 동등성 · DFS=동질성**.
> ([Stanford PDF](https://cs.stanford.edu/~jure/pubs/node2vec-kdd16.pdf) · [arXiv:1607.00653](https://arxiv.org/abs/1607.00653))

### 단계별 메커니즘

> ⚠️ **"2차(2nd-order)" = 마르코프 차수이지, 워크 길이가 아니다.**
> 시퀀스는 DeepWalk처럼 **길게**($s_0\to s_1\to\cdots\to s_l$, 예: $l=80$) 이어진다. "2차"는 **다음 노드를
> 고를 때 직전 노드까지 본다** 는 뜻일 뿐:
> 1차(DeepWalk) $P(s_{i+1}\mid s_i)$ → 2차(node2vec) $P(s_{i+1}\mid s_i, s_{i-1})$.
> 헷갈리기 쉬운 세 값은 모두 별개다 — **워크 길이 $l$**(문장 노드 수) · **마르코프 차수 = 2**(과거 1개
> 더 봄) · **SkipGram 윈도우 $k$**(동시 등장 ±범위). 아래 식에 *직전 노드 $t$* 가 등장하는 이유가 곧 2차이기 때문이다.

직전에 `t → v` 로 이동해 지금 `v` 에 있다고 하자. 다음 노드 `x` 로 가는 **비정규화 전이확률** 은
`α_{pq}(t,x) · w_{vx}` 이며, 편향 `α` 는 `t` 와 `x` 의 최단거리 `d_{tx} ∈ {0,1,2}` 로 정해진다:

$$
\alpha_{pq}(t,x)=
\begin{cases}
\tfrac{1}{p} & d_{tx}=0 \quad(\text{직전 노드 }t\text{ 로 복귀})\\[2pt]
1 & d_{tx}=1 \quad(t\text{ 와도 인접한 공통 이웃})\\[2pt]
\tfrac{1}{q} & d_{tx}=2 \quad(t\text{ 에서 더 멀어짐)}
\end{cases}
$$

> ⚠️ **$\alpha_{pq}$ 는 "확률"이 아니라 "정규화 안 된 가중치(점수)"다.** 그래서 $\tfrac1p,\,1,\,\tfrac1q$ 의
> 합이 1을 넘어도 된다 — **마지막에 이웃 전체 합으로 나눠** 확률을 만들기 때문:
> $$P(\text{다음}=x\mid v,t)=\frac{\pi_{vx}}{\sum_{x'\in N(v)}\pi_{vx'}},\qquad \pi_{vx}=\alpha_{pq}(t,x)\,w_{vx}$$
> 예) 이웃이 $x_1(d{=}0),x_2(d{=}1),x_3(d{=}2)$ 이고 $p{=}1,q{=}2$ 면 점수 $1,\,1,\,0.5$ → $Z{=}2.5$ →
> 확률 $0.4,\,0.4,\,0.2$ (합 1 ✅).
> **$d_{tx}=1$ 의 "1"은 기준(baseline)값** 이고 $p,q$ 는 그에 대한 *상대 배율* 일 뿐 — 어차피 $Z$ 로
> 나누므로 **비율만 의미** 있다. ($p{=}q{=}1$ → 셋 다 1 → 균일 분포 → [DeepWalk](deepwalk.md)와 동일.)

1. **작은 p** → 1/p 가 커져 **자꾸 되돌아감**(좁은 지역을 촘촘히, BFS 성향).
2. **작은 q** → 1/q 가 커져 **바깥으로 멀리** 나아감(DFS 성향, 커뮤니티 탐험).
3. 워크 길이 `l`, 노드당 워크 수 `r`, 윈도우 `k` 로 문장을 모은 뒤 SkipGram 학습.

### 왜 작동하나
- **BFS(국소)** 는 같은 이웃을 반복 관찰 → 노드의 **미시 구조(역할/차수 패턴)** 를 인코딩 → *구조적 동등성*.
- **DFS(원거리)** 는 커뮤니티를 멀리까지 따라감 → 같은 클러스터 노드가 함께 등장 → *동질성*.
- p·q 를 데이터에 맞게 탐색하면 **두 극단 사이 최적점** 을 고를 수 있다.

### 엣지 임베딩 (링크 예측)
노드 쌍 `(u,v)` 의 엣지 특징은 **이항 연산자** 로 만든다: **Hadamard**(원소곱, 보통 최고),
평균, L1(`|f(u)-f(v)|`), L2. 이를 분류기에 넣어 링크 예측.

### 한 줄 비유
> "지도 없이 무작정 걷기(DeepWalk)" 가 아니라, **"방금 어디서 왔는지 기억하고, 되돌아갈지/더 나아갈지
> 성향(p,q)을 정해 산책"** 하는 것.

## 핵심 기여 (Contributions)
- **2차 편향 랜덤워크(p,q)** 로 DeepWalk를 일반화 — 탐색 편향을 연속적으로 조절.
- 하나의 임베딩으로 **노드 분류와 링크 예측** 을 모두 강하게 수행.
- 엣지 임베딩용 **이항 연산자** 제시.

## 결과·데이터셋 (Results)
[BlogCatalog](../../datasets/blogcatalog.md), [PPI](../../datasets/reddit-ppi.md), Wikipedia 등에서
다중 라벨 분류·링크 예측 성능 향상을 보고. p·q 탐색으로 데이터셋별 최적 편향을 찾을 수 있음을 보임.

## 관련 링크
- 개념: [랜덤워크·동시 등장](../../concepts/glossary.md), [동질성·구조적 동등성](../../concepts/overview.md)
- 기반: [DeepWalk](deepwalk.md)(p=q=1 특수 케이스) · 이종 확장: [metapath2vec](../heterogeneous/metapath2vec.md)

---
[← 카테고리](index.md)
