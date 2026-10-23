# frozen_string_literal: true

# Typed models for the OpenBanking SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Article entity data model.
#
# @!attribute [rw] bodyHtml
#   @return [String]
#
# @!attribute [rw] canonicalUrl
#   @return [String, nil]
#
# @!attribute [rw] coverImageUrl
#   @return [String, nil]
#
# @!attribute [rw] excerpt
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] kind
#   @return [String]
#
# @!attribute [rw] lang
#   @return [String]
#
# @!attribute [rw] metaDescription
#   @return [String]
#
# @!attribute [rw] publishedAt
#   @return [String, nil]
#
# @!attribute [rw] slug
#   @return [String]
#
# @!attribute [rw] title
#   @return [String]
#
# @!attribute [rw] updatedAt
#   @return [String, nil]
Article = Struct.new(
  :bodyHtml,
  :canonicalUrl,
  :coverImageUrl,
  :excerpt,
  :id,
  :kind,
  :lang,
  :metaDescription,
  :publishedAt,
  :slug,
  :title,
  :updatedAt,
  keyword_init: true
)

# Request payload for Article#load.
#
# @!attribute [rw] kind
#   @return [String]
#
# @!attribute [rw] lang
#   @return [String]
#
# @!attribute [rw] slug
#   @return [String]
ArticleLoadMatch = Struct.new(
  :kind,
  :lang,
  :slug,
  keyword_init: true
)

# Bank entity data model.
#
# @!attribute [rw] beta
#   @return [Boolean]
#
# @!attribute [rw] bic
#   @return [String]
#
# @!attribute [rw] bodyHtml
#   @return [String]
#
# @!attribute [rw] country
#   @return [String]
#
# @!attribute [rw] facts
#   @return [Hash]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] lang
#   @return [String]
#
# @!attribute [rw] logo
#   @return [String]
#
# @!attribute [rw] maximumConsentValidityDays
#   @return [Integer]
#
# @!attribute [rw] metaDescription
#   @return [String]
#
# @!attribute [rw] name
#   @return [String]
#
# @!attribute [rw] officialUrl
#   @return [String, nil]
#
# @!attribute [rw] psuTypes
#   @return [Array]
#
# @!attribute [rw] slug
#   @return [String]
#
# @!attribute [rw] title
#   @return [String]
Bank = Struct.new(
  :beta,
  :bic,
  :bodyHtml,
  :country,
  :facts,
  :id,
  :lang,
  :logo,
  :maximumConsentValidityDays,
  :metaDescription,
  :name,
  :officialUrl,
  :psuTypes,
  :slug,
  :title,
  keyword_init: true
)

# Request payload for Bank#load.
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] lang
#   @return [String, nil]
BankLoadMatch = Struct.new(
  :id,
  :lang,
  keyword_init: true
)

# Request payload for Bank#list.
#
# @!attribute [rw] beta
#   @return [Boolean, nil]
#
# @!attribute [rw] bic
#   @return [String, nil]
#
# @!attribute [rw] bodyHtml
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] facts
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] lang
#   @return [String, nil]
#
# @!attribute [rw] logo
#   @return [String, nil]
#
# @!attribute [rw] maximumConsentValidityDays
#   @return [Integer, nil]
#
# @!attribute [rw] metaDescription
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] officialUrl
#   @return [String, nil]
#
# @!attribute [rw] psuTypes
#   @return [Array, nil]
#
# @!attribute [rw] slug
#   @return [String, nil]
#
# @!attribute [rw] title
#   @return [String, nil]
BankListMatch = Struct.new(
  :beta,
  :bic,
  :bodyHtml,
  :country,
  :facts,
  :id,
  :lang,
  :logo,
  :maximumConsentValidityDays,
  :metaDescription,
  :name,
  :officialUrl,
  :psuTypes,
  :slug,
  :title,
  keyword_init: true
)

# Post entity data model.
#
# @!attribute [rw] coverImageUrl
#   @return [String]
#
# @!attribute [rw] excerpt
#   @return [String]
#
# @!attribute [rw] metaDescription
#   @return [String]
#
# @!attribute [rw] publishedAt
#   @return [String]
#
# @!attribute [rw] slug
#   @return [String]
#
# @!attribute [rw] title
#   @return [String]
Post = Struct.new(
  :coverImageUrl,
  :excerpt,
  :metaDescription,
  :publishedAt,
  :slug,
  :title,
  keyword_init: true
)

# Request payload for Post#list.
#
# @!attribute [rw] lang
#   @return [String, nil]
PostListMatch = Struct.new(
  :lang,
  keyword_init: true
)

