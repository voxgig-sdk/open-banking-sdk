import { describe, test } from 'node:test'
import { SDK } from '..'
import { runDefinitionPoint } from './definition-runner'
import { isControlSkipped } from './utility'


// Generated from the API definition, not from the model this SDK was built
// from: the route, the declared query parameters, the credential the security
// scheme names, and the definition's own response example.
const PLAN: any[] = [
  {
    "entity": "article",
    "accessor": "Article",
    "op": "load",
    "method": "GET",
    "path": "/api/public/cms/pages/{kind}/{lang}/{slug}",
    "args": [
      {
        "name": "kind",
        "wire": "kind",
        "value": "blog"
      },
      {
        "name": "lang",
        "wire": "lang",
        "value": "en"
      },
      {
        "name": "slug",
        "wire": "slug",
        "value": "openbanking-cli-guide"
      }
    ],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": null,
    "status": 200,
    "sample": {
      "kind": "blog",
      "lang": "en",
      "slug": "openbanking-cli-guide",
      "title": "x",
      "metaDescription": "x",
      "excerpt": "x",
      "bodyHtml": "x",
      "coverImageUrl": "x",
      "canonicalUrl": "x",
      "publishedAt": "2026-01-01T00:00:00Z",
      "updatedAt": "2026-01-01T00:00:00Z"
    },
    "idField": "id"
  },
  {
    "entity": "bank",
    "accessor": "Bank",
    "op": "list",
    "method": "GET",
    "path": "/api/public/banks",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": null,
    "status": 200,
    "sample": [
      {
        "name": "Argenta",
        "country": "BE",
        "logo": "/api/public/bank-logo?u=https%3A%2F%2Fenablebanking.com%2Fbrands%2FBE%2FArgenta%2F",
        "bic": "ARSPBE22",
        "beta": true,
        "psuTypes": [
          "personal"
        ],
        "maximumConsentValidityDays": 180,
        "slug": "be-argenta"
      }
    ],
    "idField": "id"
  },
  {
    "entity": "bank",
    "accessor": "Bank",
    "op": "load",
    "method": "GET",
    "path": "/api/public/banks/{slug}",
    "args": [
      {
        "name": "id",
        "wire": "slug",
        "value": "de-fyrst"
      }
    ],
    "select": {
      "lang": "en"
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "lang"
    ],
    "queryArgs": [
      {
        "name": "lang",
        "wire": "lang"
      }
    ],
    "auth": null,
    "status": 200,
    "sample": {
      "slug": "de-fyrst",
      "lang": "en",
      "country": "DE",
      "title": "x",
      "metaDescription": "x",
      "bodyHtml": "x",
      "officialUrl": "https://www.fyrst.de",
      "facts": {
        "name": "Argenta",
        "country": "BE",
        "logo": "/api/public/bank-logo?u=https%3A%2F%2Fenablebanking.com%2Fbrands%2FBE%2FArgenta%2F",
        "bic": "ARSPBE22",
        "beta": true,
        "psuTypes": [
          "personal"
        ],
        "maximumConsentValidityDays": 180,
        "slug": "be-argenta"
      }
    },
    "idField": "id"
  },
  {
    "entity": "post",
    "accessor": "Post",
    "op": "list",
    "method": "GET",
    "path": "/api/public/cms/posts",
    "args": [],
    "select": {
      "lang": "en"
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "lang"
    ],
    "queryArgs": [
      {
        "name": "lang",
        "wire": "lang"
      }
    ],
    "auth": null,
    "status": 200,
    "sample": [
      {
        "slug": "openbanking-cli-guide",
        "title": "x",
        "metaDescription": "x",
        "excerpt": "x",
        "coverImageUrl": "x",
        "publishedAt": "2026-07-17T21:07:00.030005+00:00"
      }
    ],
    "idField": "id"
  }
]


describe('definition', () => {
  for (const point of PLAN) {
    test(point.entity + '.' + point.op + ' ' + point.method + ' ' + point.path, async (t) => {
      const control = isControlSkipped('entityOp', point.entity + '.' + point.op, 'definition')
      if (control.skip) {
        t.skip(control.reason || 'skipped via sdk-test-control.json')
        return
      }
      await runDefinitionPoint(SDK, point)
    })
  }
})
