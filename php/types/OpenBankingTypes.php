<?php
declare(strict_types=1);

// Typed models for the OpenBanking SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Article entity data model. */
class Article
{
    public string $bodyHtml;
    public ?string $canonicalUrl = null;
    public ?string $coverImageUrl = null;
    public ?string $excerpt = null;
    public ?string $id = null;
    public string $kind;
    public string $lang;
    public string $metaDescription;
    public ?string $publishedAt = null;
    public string $slug;
    public string $title;
    public ?string $updatedAt = null;
}

/** Request payload for Article#load. */
class ArticleLoadMatch
{
    public string $kind;
    public string $lang;
    public string $slug;
}

/** Bank entity data model. */
class Bank
{
    public bool $beta;
    public string $bic;
    public string $bodyHtml;
    public string $country;
    public array $facts;
    public ?string $id = null;
    public string $lang;
    public string $logo;
    public int $maximumConsentValidityDays;
    public string $metaDescription;
    public string $name;
    public ?string $officialUrl = null;
    public array $psuTypes;
    public string $slug;
    public string $title;
}

/** Request payload for Bank#load. */
class BankLoadMatch
{
    public string $id;
    public ?string $lang = null;
}

/** Request payload for Bank#list. */
class BankListMatch
{
    public ?bool $beta = null;
    public ?string $bic = null;
    public ?string $bodyHtml = null;
    public ?string $country = null;
    public ?array $facts = null;
    public ?string $id = null;
    public ?string $lang = null;
    public ?string $logo = null;
    public ?int $maximumConsentValidityDays = null;
    public ?string $metaDescription = null;
    public ?string $name = null;
    public ?string $officialUrl = null;
    public ?array $psuTypes = null;
    public ?string $slug = null;
    public ?string $title = null;
}

/** Post entity data model. */
class Post
{
    public string $coverImageUrl;
    public string $excerpt;
    public string $metaDescription;
    public string $publishedAt;
    public string $slug;
    public string $title;
}

/** Request payload for Post#list. */
class PostListMatch
{
    public ?string $lang = null;
}

