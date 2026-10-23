# Typed models for the OpenBanking SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class ArticleRequired(TypedDict):
    bodyHtml: str
    kind: str
    lang: str
    metaDescription: str
    slug: str
    title: str


class Article(ArticleRequired, total=False):
    canonicalUrl: str
    coverImageUrl: str
    excerpt: str
    id: str
    publishedAt: str
    updatedAt: str


class ArticleLoadMatch(TypedDict):
    kind: str
    lang: str
    slug: str


class BankRequired(TypedDict):
    beta: bool
    bic: str
    bodyHtml: str
    country: str
    facts: dict
    lang: str
    logo: str
    maximumConsentValidityDays: int
    metaDescription: str
    name: str
    psuTypes: list
    slug: str
    title: str


class Bank(BankRequired, total=False):
    id: str
    officialUrl: str


class BankLoadMatchRequired(TypedDict):
    id: str


class BankLoadMatch(BankLoadMatchRequired, total=False):
    lang: str


class BankListMatch(TypedDict, total=False):
    beta: bool
    bic: str
    bodyHtml: str
    country: str
    facts: dict
    id: str
    lang: str
    logo: str
    maximumConsentValidityDays: int
    metaDescription: str
    name: str
    officialUrl: str
    psuTypes: list
    slug: str
    title: str


class Post(TypedDict):
    coverImageUrl: str
    excerpt: str
    metaDescription: str
    publishedAt: str
    slug: str
    title: str


class PostListMatch(TypedDict, total=False):
    lang: str
