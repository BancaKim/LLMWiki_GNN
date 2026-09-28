---
type: Index
title: 🧬 자기지도·대조학습 (Self-Supervised)
description: 라벨 없이 그래프 표현을 학습하는 자기지도/대조학습 2편 — DGI(상호정보 최대화)와 GraphCL(증강 기반 대조). 2편 모두 탑티어 학회 필독.
tags: [self-supervised, contrastive-learning, unsupervised, mutual-information, must-read]
timestamp: 2026-09-28T00:00:00Z
---

# 🧬 자기지도·대조학습 (Self-Supervised)

[← 논문 모음](../index.md) · [번들 루트](../../index.md)

라벨은 비싸다. **자기지도(self-supervised)** 는 라벨 없이 그래프 구조·의미에서 스스로 학습 신호를 만들어
표현을 배운다. 랜덤워크([DeepWalk](../foundations/deepwalk.md))의 얕은 임베딩을 넘어, **상호정보 최대화**
와 **증강 기반 대조** 로 발전했다. **이 카테고리는 2편 모두 ⭐ 필독입니다.**

> **범례**: ⭐ = 탑티어 AI 학회 게재 **필독(MUST-READ)**.

| ⭐ | 논문 | 연도/발표처 | 핵심 아이디어 | concept |
|:--:|------|------------|--------------|---------|
| ⭐ | DGI | **ICLR 2019** | 노드↔전역 요약 상호정보 최대화(InfoMax) | [dgi.md](dgi.md) |
| ⭐ | GraphCL | **NeurIPS 2020** | 4종 증강 + InfoNCE 대조(SimCLR의 그래프판) | [graphcl.md](graphcl.md) |

> **흐름**: [DGI](dgi.md)(패치–전역 MI, 손상으로 네거티브) → [GraphCL](graphcl.md)(증강 두 뷰의 대조).
> 이후 BGRL(ICLR'22, 네거티브 없는 부트스트랩)·GRACE 등으로 이어짐(후속 추가 후보).
> 인코더로는 [GCN](../foundations/gcn.md)/[GAT](../foundations/gat.md)/[GIN](../foundations/gin.md) 을 사용.

---
[← 이전: 그래프 트랜스포머](../graph-transformer/index.md) · [논문 모음 →](../index.md)
