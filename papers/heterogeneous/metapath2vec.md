---
type: Research Paper
must_read: true
venue_tier: top-tier conference
title: "metapath2vec: Scalable Representation Learning for Heterogeneous Networks"
description: 메타패스 기반 랜덤워크로 이종 노드 시퀀스를 생성하고, 노드 타입을 고려한 이종 SkipGram(metapath2vec / metapath2vec++)으로 임베딩을 학습. 이종 네트워크 표현학습의 출발점.
resource: https://dl.acm.org/doi/10.1145/3097983.3098036
tags: [heterogeneous, meta-path, random-walk, node-embedding, skipgram]
authors: Yuxiao Dong, Nitesh V. Chawla, Ananthram Swami
venue: KDD 2017
year: 2017
timestamp: 2026-06-19T00:00:00Z
---

# ⭐ metapath2vec: Scalable Representation Learning for Heterogeneous Networks

> ⭐ **필독 (MUST-READ)** · 탑티어 학회 게재: **KDD 2017**

[← 카테고리](index.md) · 원문: [ACM DL](https://dl.acm.org/doi/10.1145/3097983.3098036)

- **저자**: Yuxiao Dong, Nitesh V. Chawla, Ananthram Swami
- **발표처/연도**: KDD 2017

## 문제 (Problem)
[DeepWalk](../foundations/deepwalk.md)·[node2vec](../foundations/node2vec.md) 는 모든 노드를 같은 타입으로
가정하는 **동질(homogeneous) 그래프** 용이다. 그러나 현실 그래프는 **여러 타입의 노드·엣지**(예:
저자–논문–학회)를 갖는 **이종(heterogeneous)** 네트워크다. 균일 랜덤워크는 타입 의미(semantics)를 무시한다.

## 방법 (Method)
**메타패스(meta-path)** 로 타입 의미를 담은 워크를 만든다.
- 메타패스 = 노드 타입의 시퀀스 스키마 (예: **APA** = 저자–논문–저자, **APVPA** = 저자–논문–학회–논문–저자).
- 이 스키마를 따라 **메타패스 기반 랜덤워크** 를 수행해 의미 있는 이종 이웃을 샘플링.
- **이종 SkipGram**:
  - **metapath2vec** — 컨텍스트 노드 예측 시 모든 타입을 함께 소프트맥스.
  - **metapath2vec++** — **노드 타입별로 분리해 소프트맥스 정규화** 해 타입 구조를 더 잘 반영.

## 핵심 기여 (Contributions)
- 랜덤워크 임베딩을 **이종 네트워크** 로 확장한 출발점.
- 도메인 지식을 **메타패스** 로 주입해 타입 의미를 보존.
- 타입 인지 정규화(metapath2vec++)로 임베딩 품질 향상.

## 결과·데이터셋 (Results)
학술 그래프 [AMiner / DBLP](../../datasets/dblp-aminer.md), DBIS 등에서 노드 분류·클러스터링·유사도 검색
성능 향상을 보고.

## 관련 링크
- 개념: [이종 그래프·메타패스](../../concepts/glossary.md), [분류 체계(그래프 구조 축)](../../concepts/taxonomy.md)
- 기반: [DeepWalk](../foundations/deepwalk.md) · 발전(어텐션·GNN): [HGT](hgt.md)

---
[← 카테고리](index.md)
