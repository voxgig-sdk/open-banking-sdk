// Typed models for the OpenBanking SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Article {
  bodyHtml: string
  canonicalUrl?: string
  coverImageUrl?: string
  excerpt?: string
  id?: string
  kind: string
  lang: string
  metaDescription: string
  publishedAt?: string
  slug: string
  title: string
  updatedAt?: string
}

export interface ArticleLoadMatch {
  kind: string
  lang: string
  slug: string
}

export interface Bank {
  beta: boolean
  bic: string
  bodyHtml: string
  country: string
  facts: Record<string, any>
  id?: string
  lang: string
  logo: string
  maximumConsentValidityDays: number
  metaDescription: string
  name: string
  officialUrl?: string
  psuTypes: any[]
  slug: string
  title: string
}

export interface BankLoadMatch {
  id: string
  lang?: string
}

export interface BankListMatch {
  beta?: boolean
  bic?: string
  bodyHtml?: string
  country?: string
  facts?: Record<string, any>
  id?: string
  lang?: string
  logo?: string
  maximumConsentValidityDays?: number
  metaDescription?: string
  name?: string
  officialUrl?: string
  psuTypes?: any[]
  slug?: string
  title?: string
}

export interface Post {
  coverImageUrl: string
  excerpt: string
  metaDescription: string
  publishedAt: string
  slug: string
  title: string
}

export interface PostListMatch {
  lang?: string
}

