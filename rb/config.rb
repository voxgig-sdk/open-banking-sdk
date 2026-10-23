# OpenBanking SDK configuration

module OpenBankingConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "OpenBanking",
        "slug" => "open-banking",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "ratelimit" => {
          "options" => {
            "active" => false,
            "burst" => 5,
            "rate" => 5,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "retry" => {
          "options" => {
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          },
          "optspec" => {
            "jitter" => "`$BOOLEAN`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "test" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "entity" => "`$MAP`",
            "net" => "`$MAP`",
          },
          "strict" => false,
          "transport" => "base",
        },
        "timeout" => {
          "options" => {
            "active" => false,
            "ms" => 30000,
          },
          "optspec" => {
            "clearTimer" => "`$FUNCTION`",
            "now" => "`$FUNCTION`",
            "setTimer" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
      },
      "options" => {
        "base" => "https://open-banking.io",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "article" => {},
          "bank" => {},
          "post" => {},
        },
      },
      "entity" => {
        "article" => {
          "fields" => [
            {
              "name" => "bodyHtml",
              "title" => "Body Html",
              "type" => "`$STRING`",
              "req" => true,
              "short" => "Page body as HTML.",
            },
            {
              "name" => "canonicalUrl",
              "title" => "Canonical Url",
              "type" => "`$STRING`",
            },
            {
              "name" => "coverImageUrl",
              "title" => "Cover Image Url",
              "type" => "`$STRING`",
            },
            {
              "name" => "excerpt",
              "title" => "Excerpt",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "title" => "Id",
              "type" => "`$STRING`",
            },
            {
              "name" => "kind",
              "title" => "Kind",
              "type" => "`$STRING`",
              "req" => true,
            },
            {
              "name" => "lang",
              "title" => "Lang",
              "type" => "`$STRING`",
              "req" => true,
            },
            {
              "name" => "metaDescription",
              "title" => "Meta Description",
              "type" => "`$STRING`",
              "req" => true,
            },
            {
              "name" => "publishedAt",
              "title" => "Published At",
              "type" => "`$STRING`",
              "format" => "date-time",
            },
            {
              "name" => "slug",
              "title" => "Slug",
              "type" => "`$STRING`",
              "req" => true,
            },
            {
              "name" => "title",
              "title" => "Title",
              "type" => "`$STRING`",
              "req" => true,
            },
            {
              "name" => "updatedAt",
              "title" => "Updated At",
              "type" => "`$STRING`",
              "format" => "date-time",
            },
          ],
          "id" => {
            "field" => "id",
            "from" => {
              "kind" => "kind",
              "lang" => "lang",
              "slug" => "slug",
            },
            "name" => "id",
            "parts" => [
              "kind",
              "lang",
              "slug",
            ],
            "sep" => "/",
          },
          "name" => "article",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/public/cms/pages/{kind}/{lang}/{slug}",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "public",
                    },
                    {
                      "lit" => "cms",
                    },
                    {
                      "lit" => "pages",
                    },
                    {
                      "var" => "kind",
                    },
                    {
                      "var" => "lang",
                    },
                    {
                      "var" => "slug",
                    },
                  ],
                  "parts" => [
                    "api",
                    "public",
                    "cms",
                    "pages",
                    "{kind}",
                    "{lang}",
                    "{slug}",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "kind",
                        "orig" => "kind",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "blog",
                      },
                      {
                        "name" => "lang",
                        "orig" => "lang",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "en",
                      },
                      {
                        "name" => "slug",
                        "orig" => "slug",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "openbanking-cli-guide",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "kind",
                      "lang",
                      "slug",
                    ],
                  },
                  "response" => {
                    "kind" => "json",
                    "media" => "application/json",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "bank" => {
          "fields" => [
            {
              "name" => "beta",
              "title" => "Beta",
              "type" => "`$BOOLEAN`",
              "req" => true,
              "short" => "True when support for this bank is in beta.",
            },
            {
              "name" => "bic",
              "title" => "Bic",
              "type" => "`$STRING`",
              "req" => true,
              "short" => "BIC/SWIFT code; null for some banks.",
            },
            {
              "name" => "bodyHtml",
              "title" => "Body Html",
              "type" => "`$STRING`",
              "req" => true,
              "short" => "Page body as HTML.",
            },
            {
              "name" => "country",
              "title" => "Country",
              "type" => "`$STRING`",
              "req" => true,
              "short" => "ISO 3166-1 alpha-2 country code.",
            },
            {
              "name" => "facts",
              "title" => "Facts",
              "type" => "`$OBJECT`",
              "req" => true,
              "short" => "One supported bank in the catalogue.",
            },
            {
              "name" => "id",
              "title" => "Id",
              "type" => "`$STRING`",
            },
            {
              "name" => "lang",
              "title" => "Lang",
              "type" => "`$STRING`",
              "req" => true,
            },
            {
              "name" => "logo",
              "title" => "Logo",
              "type" => "`$STRING`",
              "req" => true,
              "short" => "Site-relative URL of the bank's logo through the /api/public/bank-logo image proxy.",
            },
            {
              "name" => "maximumConsentValidityDays",
              "title" => "Maximum Consent Validity Days",
              "type" => "`$INTEGER`",
              "req" => true,
              "short" => "Longest consent the bank grants, in days (mostly 180).",
            },
            {
              "name" => "metaDescription",
              "title" => "Meta Description",
              "type" => "`$STRING`",
              "req" => true,
            },
            {
              "name" => "name",
              "title" => "Name",
              "type" => "`$STRING`",
              "req" => true,
            },
            {
              "name" => "officialUrl",
              "title" => "Official Url",
              "type" => "`$STRING`",
              "short" => "The bank's own website.",
            },
            {
              "name" => "psuTypes",
              "title" => "Psu Types",
              "type" => "`$ARRAY`",
              "req" => true,
              "short" => "Account holder types supported: personal and/or business.",
            },
            {
              "name" => "slug",
              "title" => "Slug",
              "type" => "`$STRING`",
              "req" => true,
              "short" => "Unique identifier, country prefix plus name.",
            },
            {
              "name" => "title",
              "title" => "Title",
              "type" => "`$STRING`",
              "req" => true,
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "bank",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/public/banks",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "public",
                    },
                    {
                      "lit" => "banks",
                    },
                  ],
                  "parts" => [
                    "api",
                    "public",
                    "banks",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {},
                  "select" => {},
                  "response" => {
                    "kind" => "json",
                    "media" => "application/json",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/public/banks/{slug}",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "public",
                    },
                    {
                      "lit" => "banks",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "parts" => [
                    "api",
                    "public",
                    "banks",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "slug" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "id",
                        "orig" => "slug",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "de-fyrst",
                      },
                    ],
                    "query" => [
                      {
                        "name" => "lang",
                        "orig" => "lang",
                        "type" => "`$STRING`",
                        "kind" => "query",
                        "example" => "en",
                        "field" => true,
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "response" => {
                    "kind" => "json",
                    "media" => "application/json",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "post" => {
          "fields" => [
            {
              "name" => "coverImageUrl",
              "title" => "Cover Image Url",
              "type" => "`$STRING`",
              "req" => true,
              "short" => "Null on every probed post.",
            },
            {
              "name" => "excerpt",
              "title" => "Excerpt",
              "type" => "`$STRING`",
              "req" => true,
            },
            {
              "name" => "metaDescription",
              "title" => "Meta Description",
              "type" => "`$STRING`",
              "req" => true,
            },
            {
              "name" => "publishedAt",
              "title" => "Published At",
              "type" => "`$STRING`",
              "req" => true,
              "format" => "date-time",
            },
            {
              "name" => "slug",
              "title" => "Slug",
              "type" => "`$STRING`",
              "req" => true,
            },
            {
              "name" => "title",
              "title" => "Title",
              "type" => "`$STRING`",
              "req" => true,
            },
          ],
          "name" => "post",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/api/public/cms/posts",
                  "segments" => [
                    {
                      "lit" => "api",
                    },
                    {
                      "lit" => "public",
                    },
                    {
                      "lit" => "cms",
                    },
                    {
                      "lit" => "posts",
                    },
                  ],
                  "parts" => [
                    "api",
                    "public",
                    "cms",
                    "posts",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "query" => [
                      {
                        "name" => "lang",
                        "orig" => "lang",
                        "type" => "`$STRING`",
                        "kind" => "query",
                        "example" => "en",
                      },
                    ],
                  },
                  "select" => {},
                  "response" => {
                    "kind" => "json",
                    "media" => "application/json",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    OpenBankingFeatures.make_feature(name)
  end
end
