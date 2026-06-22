---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "metapath2vec: Scalable Representation Learning for Heterogeneous Networks"
description: 메타패스 기반 랜덤워크로 이종 노드 시퀀스를 생성하고, 노드 타입을 고려한 이종 SkipGram(metapath2vec / metapath2vec++)으로 임베딩을 학습. 이종 네트워크 표현학습의 출발점.
resource: https://dl.acm.org/doi/10.1145/3097983.3098036
tags: [heterogeneous, meta-path, random-walk, skipgram, type-aware-softmax, node-embedding]
authors: Yuxiao Dong, Nitesh V. Chawla, Ananthram Swami
venue: KDD 2017
year: 2017
timestamp: 2026-06-22T00:00:00Z
---

# ⭐ metapath2vec: Scalable Representation Learning for Heterogeneous Networks

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **KDD 2017**

[← 카테고리](index.md) · 원문: [ACM DL](https://dl.acm.org/doi/10.1145/3097983.3098036)

- **저자**: Yuxiao Dong, Nitesh V. Chawla, Ananthram Swami
- **발표처/연도**: KDD 2017

## 문제 (Problem)
[DeepWalk](../foundations/deepwalk.md)·[node2vec](../foundations/node2vec.md) 는 모든 노드를 같은 타입으로
보는 **동질(homogeneous) 그래프** 용이다. 현실 그래프는 **여러 타입의 노드·엣지**(예: 저자–논문–학회)를
갖는 **이종(heterogeneous)** 네트워크다. 균일 랜덤워크를 그대로 쓰면 ① 타입 의미(semantics)를 무시하고,
② 차수가 큰 특정 타입(예: 학회)으로 워크가 **편향** 되며, ③ SkipGram의 소프트맥스/네거티브 샘플링이
**타입을 구분하지 못해** 임베딩이 왜곡된다.

## 방법 (Method)
두 부분으로 타입을 다룬다.
1. **메타패스 기반 랜덤워크** — 노드 타입 시퀀스 스키마(메타패스)를 따라서만 이동.
2. **이종 SkipGram** — 컨텍스트 예측을 **노드 타입을 고려해** 수행(metapath2vec / metapath2vec++).

## 핵심 메커니즘 — metapath2vec이 *실제로* 하는 것

> **한 줄 요약**: 워크를 **메타패스로 제약** 해 의미 있는 이종 이웃만 모으고, SkipGram의 **소프트맥스를
> 노드 타입별로 분리(++)** 해 타입 편향을 제거한다.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| DeepWalk와 차이 | 그냥 이종 그래프에 DeepWalk | **타입 스키마(메타패스)로 워크를 제약** + 타입 인지 학습 |
| 메타패스 선택 | 아무 경로나 OK | 보통 **대칭 메타패스**(예: A–P–A, A–P–V–P–A) — 시작·끝 타입 동일 |
| `++` 의 핵심 | 사소한 변형 | **타입별 소프트맥스/네거티브 샘플링** — 가장 중요한 개선점 |
| 집계 방식 | GNN 메시지 패싱 | **얕은(shallow) 임베딩**(룩업) — 메시지 패싱 아님 |

### 단계별 메커니즘

1. **메타패스 워크**: 스키마 $\mathcal{P}: V_1 \xrightarrow{} V_2 \xrightarrow{} \cdots \xrightarrow{} V_l$
   를 정해, 현재 노드가 타입 $V_i$ 면 **다음 타입 $V_{i+1}$ 의 이웃** 중에서만 전이한다.
   (예: **APA** = 공저 관계, **APVPA** = 같은 학회에 낸 저자들.)
2. **이종 SkipGram**: 중심 노드 $v$ 로 컨텍스트 $c_t$ 예측.
   - **metapath2vec**: 모든 노드에 대해 **하나의** 소프트맥스로 정규화.
$$p(c_t \mid v;\theta) = \frac{\exp(X_{c_t}\!\cdot X_v)}{\sum_{u\in V}\exp(X_u\!\cdot X_v)}$$
   - **metapath2vec++**: 컨텍스트의 **노드 타입별로 따로** 정규화(+ 타입별 네거티브 샘플링):
$$p(c_t \mid v;\theta) = \frac{\exp(X_{c_t}\!\cdot X_v)}{\sum_{u\in V_{t}}\exp(X_u\!\cdot X_v)}\quad(V_t=c_t\text{의 타입})$$

### 왜 작동하나
- 메타패스가 **의미적으로 일관된 이웃**(예: 저자↔저자)만 모아 → 임베딩이 타입 구조를 보존.
- `++` 의 타입별 정규화는 네거티브 샘플을 **같은 타입에서** 뽑아, 서로 다른 타입이 섞여 생기는
  **기울기 편향** 을 제거 → 더 정확한 이종 임베딩.

### 한 줄 비유
> "아무 길이나 산책(DeepWalk)" 이 아니라, **"저자→논문→저자 처럼 정해진 길(메타패스)로만 산책"** 하고,
> 비교도 **같은 종류끼리(타입별)** 한다.

## 핵심 기여 (Contributions)
- 랜덤워크 임베딩을 **이종 네트워크** 로 확장한 출발점.
- 도메인 지식을 **메타패스** 로 주입해 타입 의미 보존.
- **타입 인지 소프트맥스/네거티브 샘플링**(metapath2vec++)으로 품질 향상.

## 한계·후속
- 메타패스를 **사람이 설계** 해야 하고, 얕은 임베딩이라 노드 특징·귀납 적용이 어렵다 →
  [HGT](hgt.md) 가 메타관계 어텐션 GNN으로 자동·확장 해결.

## 결과·데이터셋 (Results)
학술 그래프 [AMiner / DBLP](../../datasets/dblp-aminer.md), DBIS 등에서 노드 분류·클러스터링·유사도 검색
성능 향상을 보고.

## 관련 링크
- 개념: [이종 그래프·메타패스](../../concepts/glossary.md), [분류 체계(그래프 구조 축)](../../concepts/taxonomy.md)
- 기반: [DeepWalk](../foundations/deepwalk.md) · 발전: [HGT](hgt.md)

---
[← 카테고리](index.md)
