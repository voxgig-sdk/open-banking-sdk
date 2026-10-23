# OpenBanking PHP SDK



The PHP SDK for the OpenBanking API — an entity-oriented client using PHP conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->Article()` — with named operations (`list`/`load`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Packagist. Install it from the
GitHub release tag (`php/vX.Y.Z`, see [Tags](https://github.com/voxgig-sdk/open-banking-sdk/tags)), or
from a clone as a Composer path repository:

```bash
git clone https://github.com/voxgig-sdk/open-banking-sdk
composer config repositories.open-banking-sdk path ./open-banking-sdk/php
composer require voxgig-sdk/open-banking-sdk:@dev
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```php
<?php
require_once 'openbanking_sdk.php';

$client = new OpenBankingSDK();
```

### 3. Load an article

```php
try {
    // load() returns the ENTITY — call data_get() for the Article record (throws on error).
    $article = $client->Article()->load(["kind" => "example_kind", "lang" => "example_lang", "slug" => "example_slug"]);
    print_r($article->data_get());
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```


## Error handling

Entity operations throw a `\Throwable` on failure, so wrap them in
`try` / `catch`:

```php
try {
    $banks = $client->Bank()->list();
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

`direct()` does **not** throw — it returns the result array. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```php
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example_id"],
]);

if (! $result["ok"]) {
    $err = $result["err"] ?? null;
    echo "request failed: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
// direct() is the raw-HTTP escape hatch: it returns a result array
// (it does not throw). Branch on $result["ok"].
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
} else {
    // On an HTTP error status there is no err (only a transport failure sets
    // it), so fall back to the status code.
    $err = $result["err"] ?? null;
    echo "Error: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```

### Prepare a request without sending it

```php
// prepare() throws on error and returns the fetch definition.
$fetchdef = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required. Seed fixture
data via the `entity` option so offline calls resolve without a live server:

```php
$client = OpenBankingSDK::test([
    "entity" => ["bank" => ["test01" => ["id" => "test01"]]],
]);

// list() returns entity instances (throws on error);
// call data_get() for the mock record.
$bank = $client->Bank()->list();
print_r(array_map(fn($item) => $item->data_get(), $bank));
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```php
$mock_fetch = function ($url, $init) {
    return [
        [
            "status" => 200,
            "statusText" => "OK",
            "headers" => [],
            "json" => function () { return ["id" => "mock01"]; },
        ],
        null,
    ];
};

$client = new OpenBankingSDK([
    "base" => "http://localhost:8080",
    "system" => [
        "fetch" => $mock_fetch,
    ],
]);
```

### Run live tests

Create a `.env.local` file at the project root:

```
OPEN_BANKING_TEST_LIVE=TRUE
```

Then run:

```bash
cd php && ./vendor/bin/phpunit test/
```


## Reference

### OpenBankingSDK

```php
require_once 'openbanking_sdk.php';
$client = new OpenBankingSDK($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `array` | Feature activation flags. |
| `extend` | `array` | Additional Feature instances to load. |
| `system` | `array` | System overrides (e.g. custom `fetch` callable). |

### test

```php
$client = OpenBankingSDK::test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### OpenBankingSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `(): array` | Deep copy of current SDK options. |
| `get_utility` | `(): Utility` | Copy of the SDK utility object. |
| `prepare` | `(array $fetchargs): array` | Build an HTTP request definition without sending. |
| `direct` | `(array $fetchargs): array` | Build and send an HTTP request. |
| `Article` | `($data): ArticleEntity` | Create an Article entity instance. |
| `Bank` | `($data): BankEntity` | Create a Bank entity instance. |
| `Post` | `($data): PostEntity` | Create a Post entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl): mixed` | Load a single entity by match criteria, and return it. |
| `list` | `(?array $reqmatch = null, $ctrl): mixed` | List entities matching the criteria (call with no argument to list all), one per record. |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return the entity, and `list` an `array` of entities, one
per record; an entity's `data_get()` reads its record (an `array`). They
throw on error, so wrap calls in `try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `array`
you branch on via `$result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `array` | Response headers. |
| `data` | `mixed` | Parsed JSON response body. |

On error, `ok` is `false` and `$err` contains the error value.

### Entities

#### Article

| Field | Description |
| --- | --- |
| `bodyHtml` | Page body as HTML. |
| `canonicalUrl` |  |
| `coverImageUrl` |  |
| `excerpt` |  |
| `id` |  |
| `kind` |  |
| `lang` |  |
| `metaDescription` |  |
| `publishedAt` |  |
| `slug` |  |
| `title` |  |
| `updatedAt` |  |

Operations: Load.

API path: `/api/public/cms/pages/{kind}/{lang}/{slug}`

#### Bank

| Field | Description |
| --- | --- |
| `beta` | True when support for this bank is in beta. |
| `bic` | BIC/SWIFT code; null for some banks. |
| `bodyHtml` | Page body as HTML. |
| `country` | ISO 3166-1 alpha-2 country code. |
| `facts` | One supported bank in the catalogue. |
| `id` |  |
| `lang` |  |
| `logo` | Site-relative URL of the bank's logo through the /api/public/bank-logo image proxy. |
| `maximumConsentValidityDays` | Longest consent the bank grants, in days (mostly 180). |
| `metaDescription` |  |
| `name` |  |
| `officialUrl` | The bank's own website. |
| `psuTypes` | Account holder types supported: personal and/or business. |
| `slug` | Unique identifier, country prefix plus name. |
| `title` |  |

Operations: List, Load.

API path: `/api/public/banks`

#### Post

| Field | Description |
| --- | --- |
| `coverImageUrl` | Null on every probed post. |
| `excerpt` |  |
| `metaDescription` |  |
| `publishedAt` |  |
| `slug` |  |
| `title` |  |

Operations: List.

API path: `/api/public/cms/posts`



## Entities


### Article

Create an instance: `$article = $client->Article();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `bodyHtml` | `string` | Page body as HTML. |
| `canonicalUrl` | `string` |  |
| `coverImageUrl` | `string` |  |
| `excerpt` | `string` |  |
| `id` | `string` |  |
| `kind` | `string` |  |
| `lang` | `string` |  |
| `metaDescription` | `string` |  |
| `publishedAt` | `string` |  |
| `slug` | `string` |  |
| `title` | `string` |  |
| `updatedAt` | `string` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the Article record (throws on error).
$article = $client->Article()->load(["kind" => "kind", "lang" => "lang", "slug" => "slug"]);
```


### Bank

Create an instance: `$bank = $client->Bank();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `beta` | `bool` | True when support for this bank is in beta. |
| `bic` | `string` | BIC/SWIFT code; null for some banks. |
| `bodyHtml` | `string` | Page body as HTML. |
| `country` | `string` | ISO 3166-1 alpha-2 country code. |
| `facts` | `array` | One supported bank in the catalogue. |
| `id` | `string` |  |
| `lang` | `string` |  |
| `logo` | `string` | Site-relative URL of the bank's logo through the /api/public/bank-logo image proxy. |
| `maximumConsentValidityDays` | `int` | Longest consent the bank grants, in days (mostly 180). |
| `metaDescription` | `string` |  |
| `name` | `string` |  |
| `officialUrl` | `string` | The bank's own website. |
| `psuTypes` | `array` | Account holder types supported: personal and/or business. |
| `slug` | `string` | Unique identifier, country prefix plus name. |
| `title` | `string` |  |

#### Example: Load

```php
// load() returns the ENTITY — call data_get() for the Bank record (throws on error).
$bank = $client->Bank()->load(["id" => "bank_id"]);
```

#### Example: List

```php
// list() returns an array of Bank entities, one per record (throws on error).
$banks = $client->Bank()->list();
```


### Post

Create an instance: `$post = $client->Post();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `coverImageUrl` | `string` | Null on every probed post. |
| `excerpt` | `string` |  |
| `metaDescription` | `string` |  |
| `publishedAt` | `string` |  |
| `slug` | `string` |  |
| `title` | `string` |  |

#### Example: List

```php
// list() returns an array of Post entities, one per record (throws on error).
$posts = $client->Post()->list();
```

## Features

This SDK ships 4 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`ratelimit`](#ratelimit) | Rate limiting |
| [`retry`](#retry) | Retry |
| [`test`](#test) | Test transport |
| [`timeout`](#timeout) | Timeout |

> **Order matters for `ratelimit`, `retry`, `timeout`.** These wrap the
> transport, so each one wraps whatever is already installed: the order you
> activate them in IS the nesting order. Activating them as an ordered list
> rather than a map is what fixes that order.

### ratelimit

Rate limiting.

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

Set `feature.ratelimit.active` to enable it, then override any of the options above.

`ratelimit` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### retry

Retry.

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

Set `feature.retry.active` to enable it, then override any of the options above.

`retry` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### test

Test transport.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.

### timeout

Timeout.

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

Set `feature.timeout.active` to enable it, then override any of the options above.

`timeout` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is a PHP class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **RatelimitFeature**: Rate limiting
- **RetryFeature**: Retry
- **TestFeature**: Test transport
- **TimeoutFeature**: Timeout

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as arrays

The PHP SDK uses plain PHP associative arrays throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers::to_map()` to safely validate that a value is an array.

### Directory structure

```
php/
├── openbanking_sdk.php          -- Main SDK class
├── config.php                     -- Configuration
├── schema.php                     -- Generated option + entity specs
├── features.php                   -- Feature factory
├── core/                          -- Core types and context
├── entity/                        -- Entity implementations
├── feature/                       -- Built-in features (Base, Test, Log)
├── utility/                       -- Utility functions and struct library
└── test/                          -- Test suites
```

The main class (`openbanking_sdk.php`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```php
$bank = $client->Bank();
$bank->list();

// $bank->data_get() now returns the bank data from the last list
// $bank->match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
