# OpenBanking SDK configuration


# The sekreto plugin DEFINITIONS the model selected per feature, imported
# above by name from the modules the catalogue's active `plugin.def`
# entries declare. Handed to each feature (secrets builds its Sekreto
# with them): a provider kind not listed here is unknown to that SDK.
FEATURE_PLUGINS = {
}


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "OpenBanking",
            "slug": "open-banking",
            "version": "0.0.1",
            "target": "py",
        },
        "feature": {
            "ratelimit": {
        "options": {
          "active": False,
          "burst": 5,
          "rate": 5,
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "retry": {
        "options": {
          "active": False,
          "factor": 2,
          "maxDelay": 2000,
          "minDelay": 50,
          "retries": 2,
          "statuses": [
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          ],
        },
        "optspec": {
          "jitter": "`$BOOLEAN`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "test": {
        "options": {
          "active": False,
        },
        "optspec": {
          "entity": "`$MAP`",
          "net": "`$MAP`",
        },
        "strict": False,
        "transport": "base",
      },
            "timeout": {
        "options": {
          "active": False,
          "ms": 30000,
        },
        "optspec": {
          "clearTimer": "`$FUNCTION`",
          "now": "`$FUNCTION`",
          "setTimer": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
        },
        "options": {
            "base": "https://open-banking.io",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "article": {},
                "bank": {},
                "post": {},
            },
        },
        "entity": {
      "article": {
        "fields": [
          {
            "name": "bodyHtml",
            "title": "Body Html",
            "type": "`$STRING`",
            "req": True,
            "short": "Page body as HTML.",
          },
          {
            "name": "canonicalUrl",
            "title": "Canonical Url",
            "type": "`$STRING`",
          },
          {
            "name": "coverImageUrl",
            "title": "Cover Image Url",
            "type": "`$STRING`",
          },
          {
            "name": "excerpt",
            "title": "Excerpt",
            "type": "`$STRING`",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
          },
          {
            "name": "kind",
            "title": "Kind",
            "type": "`$STRING`",
            "req": True,
          },
          {
            "name": "lang",
            "title": "Lang",
            "type": "`$STRING`",
            "req": True,
          },
          {
            "name": "metaDescription",
            "title": "Meta Description",
            "type": "`$STRING`",
            "req": True,
          },
          {
            "name": "publishedAt",
            "title": "Published At",
            "type": "`$STRING`",
            "format": "date-time",
          },
          {
            "name": "slug",
            "title": "Slug",
            "type": "`$STRING`",
            "req": True,
          },
          {
            "name": "title",
            "title": "Title",
            "type": "`$STRING`",
            "req": True,
          },
          {
            "name": "updatedAt",
            "title": "Updated At",
            "type": "`$STRING`",
            "format": "date-time",
          },
        ],
        "id": {
          "field": "id",
          "from": {
            "kind": "kind",
            "lang": "lang",
            "slug": "slug",
          },
          "name": "id",
          "parts": [
            "kind",
            "lang",
            "slug",
          ],
          "sep": "/",
        },
        "name": "article",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/api/public/cms/pages/{kind}/{lang}/{slug}",
                "segments": [
                  {
                    "lit": "api",
                  },
                  {
                    "lit": "public",
                  },
                  {
                    "lit": "cms",
                  },
                  {
                    "lit": "pages",
                  },
                  {
                    "var": "kind",
                  },
                  {
                    "var": "lang",
                  },
                  {
                    "var": "slug",
                  },
                ],
                "parts": [
                  "api",
                  "public",
                  "cms",
                  "pages",
                  "{kind}",
                  "{lang}",
                  "{slug}",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "kind",
                      "orig": "kind",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                      "example": "blog",
                    },
                    {
                      "name": "lang",
                      "orig": "lang",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                      "example": "en",
                    },
                    {
                      "name": "slug",
                      "orig": "slug",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                      "example": "openbanking-cli-guide",
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "kind",
                    "lang",
                    "slug",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "bank": {
        "fields": [
          {
            "name": "beta",
            "title": "Beta",
            "type": "`$BOOLEAN`",
            "req": True,
            "short": "True when support for this bank is in beta.",
          },
          {
            "name": "bic",
            "title": "Bic",
            "type": "`$STRING`",
            "req": True,
            "short": "BIC/SWIFT code; null for some banks.",
          },
          {
            "name": "bodyHtml",
            "title": "Body Html",
            "type": "`$STRING`",
            "req": True,
            "short": "Page body as HTML.",
          },
          {
            "name": "country",
            "title": "Country",
            "type": "`$STRING`",
            "req": True,
            "short": "ISO 3166-1 alpha-2 country code.",
          },
          {
            "name": "facts",
            "title": "Facts",
            "type": "`$OBJECT`",
            "req": True,
            "short": "One supported bank in the catalogue.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
          },
          {
            "name": "lang",
            "title": "Lang",
            "type": "`$STRING`",
            "req": True,
          },
          {
            "name": "logo",
            "title": "Logo",
            "type": "`$STRING`",
            "req": True,
            "short": "Site-relative URL of the bank's logo through the /api/public/bank-logo image proxy.",
          },
          {
            "name": "maximumConsentValidityDays",
            "title": "Maximum Consent Validity Days",
            "type": "`$INTEGER`",
            "req": True,
            "short": "Longest consent the bank grants, in days (mostly 180).",
          },
          {
            "name": "metaDescription",
            "title": "Meta Description",
            "type": "`$STRING`",
            "req": True,
          },
          {
            "name": "name",
            "title": "Name",
            "type": "`$STRING`",
            "req": True,
          },
          {
            "name": "officialUrl",
            "title": "Official Url",
            "type": "`$STRING`",
            "short": "The bank's own website.",
          },
          {
            "name": "psuTypes",
            "title": "Psu Types",
            "type": "`$ARRAY`",
            "req": True,
            "short": "Account holder types supported: personal and/or business.",
          },
          {
            "name": "slug",
            "title": "Slug",
            "type": "`$STRING`",
            "req": True,
            "short": "Unique identifier, country prefix plus name.",
          },
          {
            "name": "title",
            "title": "Title",
            "type": "`$STRING`",
            "req": True,
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
        "name": "bank",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/api/public/banks",
                "segments": [
                  {
                    "lit": "api",
                  },
                  {
                    "lit": "public",
                  },
                  {
                    "lit": "banks",
                  },
                ],
                "parts": [
                  "api",
                  "public",
                  "banks",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {},
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/api/public/banks/{slug}",
                "segments": [
                  {
                    "lit": "api",
                  },
                  {
                    "lit": "public",
                  },
                  {
                    "lit": "banks",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "api",
                  "public",
                  "banks",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "slug": "id",
                  },
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "params": [
                    {
                      "name": "id",
                      "orig": "slug",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                      "example": "de-fyrst",
                    },
                  ],
                  "query": [
                    {
                      "name": "lang",
                      "orig": "lang",
                      "type": "`$STRING`",
                      "kind": "query",
                      "example": "en",
                      "field": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "post": {
        "fields": [
          {
            "name": "coverImageUrl",
            "title": "Cover Image Url",
            "type": "`$STRING`",
            "req": True,
            "short": "Null on every probed post.",
          },
          {
            "name": "excerpt",
            "title": "Excerpt",
            "type": "`$STRING`",
            "req": True,
          },
          {
            "name": "metaDescription",
            "title": "Meta Description",
            "type": "`$STRING`",
            "req": True,
          },
          {
            "name": "publishedAt",
            "title": "Published At",
            "type": "`$STRING`",
            "req": True,
            "format": "date-time",
          },
          {
            "name": "slug",
            "title": "Slug",
            "type": "`$STRING`",
            "req": True,
          },
          {
            "name": "title",
            "title": "Title",
            "type": "`$STRING`",
            "req": True,
          },
        ],
        "name": "post",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/api/public/cms/posts",
                "segments": [
                  {
                    "lit": "api",
                  },
                  {
                    "lit": "public",
                  },
                  {
                    "lit": "cms",
                  },
                  {
                    "lit": "posts",
                  },
                ],
                "parts": [
                  "api",
                  "public",
                  "cms",
                  "posts",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "query": [
                    {
                      "name": "lang",
                      "orig": "lang",
                      "type": "`$STRING`",
                      "kind": "query",
                      "example": "en",
                    },
                  ],
                },
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
