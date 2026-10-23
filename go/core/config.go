package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "OpenBanking",
			"slug": "open-banking",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"ratelimit": map[string]any{
				"options": map[string]any{
					"active": false,
					"burst": 5,
					"rate": 5,
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"retry": map[string]any{
				"options": map[string]any{
					"active": false,
					"factor": 2,
					"maxDelay": 2000,
					"minDelay": 50,
					"retries": 2,
					"statuses": []any{
						408,
						425,
						429,
						500,
						502,
						503,
						504,
					},
				},
				"optspec": map[string]any{
					"jitter": "`$BOOLEAN`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"entity": "`$MAP`",
					"net": "`$MAP`",
				},
				"strict": false,
				"transport": "base",
			},
			"timeout": map[string]any{
				"options": map[string]any{
					"active": false,
					"ms": 30000,
				},
				"optspec": map[string]any{
					"clearTimer": "`$FUNCTION`",
					"now": "`$FUNCTION`",
					"setTimer": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
		},
		"options": map[string]any{
			"base": "https://open-banking.io",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"article": map[string]any{},
				"bank": map[string]any{},
				"post": map[string]any{},
			},
		},
		"entity": map[string]any{
			"article": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "bodyHtml",
						"title": "Body Html",
						"type": "`$STRING`",
						"req": true,
						"short": "Page body as HTML.",
					},
					map[string]any{
						"name": "canonicalUrl",
						"title": "Canonical Url",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "coverImageUrl",
						"title": "Cover Image Url",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "excerpt",
						"title": "Excerpt",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "kind",
						"title": "Kind",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "lang",
						"title": "Lang",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "metaDescription",
						"title": "Meta Description",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "publishedAt",
						"title": "Published At",
						"type": "`$STRING`",
						"format": "date-time",
					},
					map[string]any{
						"name": "slug",
						"title": "Slug",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "title",
						"title": "Title",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "updatedAt",
						"title": "Updated At",
						"type": "`$STRING`",
						"format": "date-time",
					},
				},
				"id": map[string]any{
					"field": "id",
					"from": map[string]any{
						"kind": "kind",
						"lang": "lang",
						"slug": "slug",
					},
					"name": "id",
					"parts": []any{
						"kind",
						"lang",
						"slug",
					},
					"sep": "/",
				},
				"name": "article",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/api/public/cms/pages/{kind}/{lang}/{slug}",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "public",
									},
									map[string]any{
										"lit": "cms",
									},
									map[string]any{
										"lit": "pages",
									},
									map[string]any{
										"var": "kind",
									},
									map[string]any{
										"var": "lang",
									},
									map[string]any{
										"var": "slug",
									},
								},
								"parts": []any{
									"api",
									"public",
									"cms",
									"pages",
									"{kind}",
									"{lang}",
									"{slug}",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "kind",
											"orig": "kind",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
											"example": "blog",
										},
										map[string]any{
											"name": "lang",
											"orig": "lang",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
											"example": "en",
										},
										map[string]any{
											"name": "slug",
											"orig": "slug",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
											"example": "openbanking-cli-guide",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"kind",
										"lang",
										"slug",
									},
								},
								"response": map[string]any{
									"kind": "json",
									"media": "application/json",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"bank": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "beta",
						"title": "Beta",
						"type": "`$BOOLEAN`",
						"req": true,
						"short": "True when support for this bank is in beta.",
					},
					map[string]any{
						"name": "bic",
						"title": "Bic",
						"type": "`$STRING`",
						"req": true,
						"short": "BIC/SWIFT code; null for some banks.",
					},
					map[string]any{
						"name": "bodyHtml",
						"title": "Body Html",
						"type": "`$STRING`",
						"req": true,
						"short": "Page body as HTML.",
					},
					map[string]any{
						"name": "country",
						"title": "Country",
						"type": "`$STRING`",
						"req": true,
						"short": "ISO 3166-1 alpha-2 country code.",
					},
					map[string]any{
						"name": "facts",
						"title": "Facts",
						"type": "`$OBJECT`",
						"req": true,
						"short": "One supported bank in the catalogue.",
					},
					map[string]any{
						"name": "id",
						"title": "Id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "lang",
						"title": "Lang",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "logo",
						"title": "Logo",
						"type": "`$STRING`",
						"req": true,
						"short": "Site-relative URL of the bank's logo through the /api/public/bank-logo image proxy.",
					},
					map[string]any{
						"name": "maximumConsentValidityDays",
						"title": "Maximum Consent Validity Days",
						"type": "`$INTEGER`",
						"req": true,
						"short": "Longest consent the bank grants, in days (mostly 180).",
					},
					map[string]any{
						"name": "metaDescription",
						"title": "Meta Description",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "name",
						"title": "Name",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "officialUrl",
						"title": "Official Url",
						"type": "`$STRING`",
						"short": "The bank's own website.",
					},
					map[string]any{
						"name": "psuTypes",
						"title": "Psu Types",
						"type": "`$ARRAY`",
						"req": true,
						"short": "Account holder types supported: personal and/or business.",
					},
					map[string]any{
						"name": "slug",
						"title": "Slug",
						"type": "`$STRING`",
						"req": true,
						"short": "Unique identifier, country prefix plus name.",
					},
					map[string]any{
						"name": "title",
						"title": "Title",
						"type": "`$STRING`",
						"req": true,
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "bank",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/api/public/banks",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "public",
									},
									map[string]any{
										"lit": "banks",
									},
								},
								"parts": []any{
									"api",
									"public",
									"banks",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
								"response": map[string]any{
									"kind": "json",
									"media": "application/json",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/api/public/banks/{slug}",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "public",
									},
									map[string]any{
										"lit": "banks",
									},
									map[string]any{
										"var": "id",
									},
								},
								"parts": []any{
									"api",
									"public",
									"banks",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"slug": "id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"name": "id",
											"orig": "slug",
											"type": "`$STRING`",
											"kind": "param",
											"reqd": true,
											"example": "de-fyrst",
										},
									},
									"query": []any{
										map[string]any{
											"name": "lang",
											"orig": "lang",
											"type": "`$STRING`",
											"kind": "query",
											"example": "en",
											"field": true,
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"response": map[string]any{
									"kind": "json",
									"media": "application/json",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"post": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "coverImageUrl",
						"title": "Cover Image Url",
						"type": "`$STRING`",
						"req": true,
						"short": "Null on every probed post.",
					},
					map[string]any{
						"name": "excerpt",
						"title": "Excerpt",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "metaDescription",
						"title": "Meta Description",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "publishedAt",
						"title": "Published At",
						"type": "`$STRING`",
						"req": true,
						"format": "date-time",
					},
					map[string]any{
						"name": "slug",
						"title": "Slug",
						"type": "`$STRING`",
						"req": true,
					},
					map[string]any{
						"name": "title",
						"title": "Title",
						"type": "`$STRING`",
						"req": true,
					},
				},
				"name": "post",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/api/public/cms/posts",
								"segments": []any{
									map[string]any{
										"lit": "api",
									},
									map[string]any{
										"lit": "public",
									},
									map[string]any{
										"lit": "cms",
									},
									map[string]any{
										"lit": "posts",
									},
								},
								"parts": []any{
									"api",
									"public",
									"cms",
									"posts",
								},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "lang",
											"orig": "lang",
											"type": "`$STRING`",
											"kind": "query",
											"example": "en",
										},
									},
								},
								"select": map[string]any{},
								"response": map[string]any{
									"kind": "json",
									"media": "application/json",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "ratelimit":
		if NewRatelimitFeatureFunc != nil {
			return NewRatelimitFeatureFunc()
		}
	case "retry":
		if NewRetryFeatureFunc != nil {
			return NewRetryFeatureFunc()
		}
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	case "timeout":
		if NewTimeoutFeatureFunc != nil {
			return NewTimeoutFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
