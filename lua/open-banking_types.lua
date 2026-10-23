-- Typed models for the OpenBanking SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
-- params (op.<name>.points[].g.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Article
---@field bodyHtml string
---@field canonicalUrl? string
---@field coverImageUrl? string
---@field excerpt? string
---@field id? string
---@field kind string
---@field lang string
---@field metaDescription string
---@field publishedAt? string
---@field slug string
---@field title string
---@field updatedAt? string

---@class ArticleLoadMatch
---@field kind string
---@field lang string
---@field slug string

---@class Bank
---@field beta boolean
---@field bic string
---@field bodyHtml string
---@field country string
---@field facts table
---@field id? string
---@field lang string
---@field logo string
---@field maximumConsentValidityDays number
---@field metaDescription string
---@field name string
---@field officialUrl? string
---@field psuTypes table
---@field slug string
---@field title string

---@class BankLoadMatch
---@field id string
---@field lang? string

---@class BankListMatch
---@field beta? boolean
---@field bic? string
---@field bodyHtml? string
---@field country? string
---@field facts? table
---@field id? string
---@field lang? string
---@field logo? string
---@field maximumConsentValidityDays? number
---@field metaDescription? string
---@field name? string
---@field officialUrl? string
---@field psuTypes? table
---@field slug? string
---@field title? string

---@class Post
---@field coverImageUrl string
---@field excerpt string
---@field metaDescription string
---@field publishedAt string
---@field slug string
---@field title string

---@class PostListMatch
---@field lang? string

local M = {}

return M
