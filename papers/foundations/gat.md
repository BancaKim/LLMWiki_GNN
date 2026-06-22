---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "Graph Attention Networks (GAT)"
description: 마스크드 셀프 어텐션으로 이웃마다 다른 가중치를 학습하는 GNN. 다중 헤드 어텐션을 사용하고 라플라시안 등 전역 그래프 연산 없이 귀납적으로도 동작.
resource: https://arxiv.org/abs/1710.10903
tags: [gat, attention, multi-head, masked-attention, anisotropic, message-passing, node-classification, inductive]
authors: Petar Veličković, Guillem Cucurull, Arantxa Casanova, Adriana Romero, Pietro Liò, Yoshua Bengio
venue: ICLR 2018
year: 2018
timestamp: 2026-06-22T00:00:00Z
---

# ⭐ Graph Attention Networks (GAT)

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **ICLR 2018**

[← 카테고리](index.md) · 원문: [arXiv:1710.10903](https://arxiv.org/abs/1710.10903)

- **저자**: Petar Veličković, Guillem Cucurull, Arantxa Casanova, Adriana Romero, Pietro Liò, Yoshua Bengio
- **발표처/연도**: ICLR 2018

## 문제 (Problem)
[GCN](gcn.md) 은 이웃을 **차수로 고정된 가중치**($1/\sqrt{d_i d_j}$)로 집계해, 이웃마다 다른 중요도를
반영하지 못한다(**isotropic**). 또 스펙트럼 기반 방법은 라플라시안 등 **전체 그래프 구조에 의존** 해
귀납적 적용이 까다롭다.

## 방법 (Method)
**셀프 어텐션** 으로 이웃별 가중치를 데이터로부터 학습한다(**anisotropic**).
- 각 엣지의 attention 점수를 계산 → **이웃에 대해서만(masked)** 소프트맥스 정규화 → 가중합.
- **다중 헤드(multi-head)** 로 안정성·표현력 향상.
- 라플라시안·고유분해가 필요 없고 이웃만 보면 되므로 **귀납적(inductive)** 으로도 동작.

## 핵심 메커니즘 — GAT가 *실제로* 하는 것

> **한 줄 요약**: 어텐션을 **이웃 집합에만(masked)** 적용해 **이웃별 가중치 $\alpha_{ij}$ 를 학습** 한다.
> 전역 어텐션도, 그래프 구조 사전 지식도 필요 없다.

### 흔한 오해 vs 실제

| | ❌ 오해 | ✅ 실제 |
|---|---|---|
| 어텐션 범위 | 모든 노드쌍(트랜스포머식 **전역**) | **1-홉 이웃에만**(masked attention) → 희소·저비용 |
| 그래프 구조 | 라플라시안 등 **전역 구조 필요** | 이웃 목록만 필요 → **귀납적** |
| 어텐션 가중치 | 곧 **설명(ground-truth)** | 성능용 가중치 — 해석 단서는 되나 설명 보장 아님 |
| GCN과 차이 | 무관 | GCN의 **고정 $1/\sqrt{d_id_j}$** 를 **학습형 $\alpha_{ij}$** 로 교체 |

### 단계별 메커니즘

1. 공유 선형변환 $W$ 적용 후, 엣지 점수를 계산:
$$e_{ij} = \text{LeakyReLU}\big(\mathbf{a}^\top [\,W h_i \,\Vert\, W h_j\,]\big)$$
2. **이웃 $\mathcal{N}(i)$ 에 대해서만** 소프트맥스 정규화:
$$\alpha_{ij} = \frac{\exp(e_{ij})}{\sum_{k\in\mathcal{N}(i)} \exp(e_{ik})}$$
3. 가중합 + 비선형:
$$h_i' = \sigma\Big(\textstyle\sum_{j\in\mathcal{N}(i)} \alpha_{ij}\, W h_j\Big)$$
4. **다중 헤드**: 중간 층은 $K$개 헤드를 **concat**, 출력 층은 **평균**.
$$h_i' = \big\Vert_{k=1}^{K}\,\sigma\Big(\textstyle\sum_{j} \alpha_{ij}^{k}\, W^{k} h_j\Big)$$

### 왜 작동하나
- 정보량이 큰 이웃에 **큰 $\alpha$**, 잡음 이웃에 작은 $\alpha$ → GCN의 균일 평균보다 변별력↑.
- 이웃별 국소 연산이라 **병렬화** 가 쉽고, 노드 차수가 달라도 동작 → 새 그래프(PPI) 일반화.
- 다중 헤드는 서로 다른 관점을 학습해 **분산을 줄이고** 안정화.

### 한 줄 비유
> 이웃의 의견을 **똑같이 평균(GCN)** 내지 않고, **"누구 말을 더 들을지 가중치를 스스로 정해" 듣는다.**
> 단, 여러 명(멀티헤드)에게 물어 평균 낸다.

## 핵심 기여 (Contributions)
- 그래프에 **마스크드 셀프 어텐션** 을 도입해 이웃 중요도를 학습.
- 전역 그래프 연산 없이 **국소 연산** 만으로 동작 → 병렬화·귀납 적용 용이.
- 어텐션 가중치가 **해석 가능성** 의 단서를 제공.

## 결과·데이터셋 (Results)
전이 설정 [Cora / Citeseer / Pubmed](../../datasets/cora-citeseer-pubmed.md) 와 귀납 설정
[PPI](../../datasets/reddit-ppi.md) 모두에서 SOTA급. GCN 대비 이웃 가중을 학습해 성능·유연성 향상.

## 관련 링크
- 개념: [어텐션·메시지 패싱](../../concepts/glossary.md), [귀납 vs 전이](../../concepts/overview.md)
- 비교: [GCN](gcn.md)(고정 가중) · [GraphSAGE](graphsage.md)(샘플+집계)
- 영향: 이종 타입별 어텐션 [HGT](../heterogeneous/hgt.md)

---
[← 카테고리](index.md)
