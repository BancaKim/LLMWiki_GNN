---
type: Dataset
title: DBLP / AMiner (OAG)
description: 학술 그래프 데이터셋. 저자·논문·학회·용어 등 여러 타입의 노드와 관계를 갖는 이종(heterogeneous) 그래프로, metapath2vec·HGT 등 이종 그래프 표현학습 평가에 사용.
resource: https://www.aminer.org/data
tags: [dataset, heterogeneous, academic-graph, meta-path, benchmark]
timestamp: 2026-06-19T00:00:00Z
---

# DBLP / AMiner (Open Academic Graph)

[← 데이터셋 카탈로그](index.md)

## 개요
**학술(academic) 그래프** 데이터셋들로, 이종(heterogeneous) 그래프 표현학습의 대표 벤치마크다.
여러 **타입의 노드**(저자 Author · 논문 Paper · 학회/저널 Venue · 용어 Term)와 그 사이의 관계
(저술·인용·게재 등)를 담는다.

## 이종 구조와 메타패스
- 노드 타입: A(author), P(paper), V(venue) 등.
- 관계: A–P(저술), P–V(게재), P–P(인용) …
- **메타패스** 예: **APA**(공저), **APVPA**(같은 학회에 낸 저자들) →
  [metapath2vec](../papers/heterogeneous/metapath2vec.md) 이 이런 스키마로 랜덤워크.

## 변형
- **DBLP / AMiner** — 컴퓨터과학 서지 그래프(저자·논문·학회).
- **Open Academic Graph(OAG)** — Microsoft Academic + AMiner를 합친 대규모 버전.
  [HGT](../papers/heterogeneous/hgt.md) 가 웹 스케일 학습 평가에 사용.

## 과제
- 노드 분류(논문 분야/저자 연구 영역), 클러스터링, 링크 예측, 유사도 검색.

## 이 데이터셋을 쓰는 논문
- [metapath2vec](../papers/heterogeneous/metapath2vec.md), [HGT](../papers/heterogeneous/hgt.md)

> 관련 개념: [이종 그래프·메타패스/메타관계](../concepts/glossary.md) · [분류 체계](../concepts/taxonomy.md)

---
[← 데이터셋 카탈로그](index.md) · [표준 벤치마크: OGB →](ogb.md)
