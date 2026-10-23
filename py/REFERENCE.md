# OpenBanking Python SDK Reference

Complete API reference for the OpenBanking Python SDK.


## OpenBankingSDK

### Constructor

```python
from openbanking_sdk import OpenBankingSDK

client = OpenBankingSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `OpenBankingSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = OpenBankingSDK.test()
```


### Instance Methods

#### `Article(data=None)`

Create a new `ArticleEntity` instance. Pass `None` for no initial data.

#### `Bank(data=None)`

Create a new `BankEntity` instance. Pass `None` for no initial data.

#### `Post(data=None)`

Create a new `PostEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## ArticleEntity

```python
article = client.Article()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `bodyHtml` | `str` | Yes | Page body as HTML. |
| `canonicalUrl` | `str` | No |  |
| `coverImageUrl` | `str` | No |  |
| `excerpt` | `str` | No |  |
| `id` | `str` | No |  |
| `kind` | `str` | Yes |  |
| `lang` | `str` | Yes |  |
| `metaDescription` | `str` | Yes |  |
| `publishedAt` | `str` | No |  |
| `slug` | `str` | Yes |  |
| `title` | `str` | Yes |  |
| `updatedAt` | `str` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> ArticleEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

```python
result = client.Article().load({"kind": "kind", "lang": "lang", "slug": "slug"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ArticleEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## BankEntity

```python
bank = client.Bank()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `beta` | `bool` | Yes | True when support for this bank is in beta. |
| `bic` | `str` | Yes | BIC/SWIFT code; null for some banks. |
| `bodyHtml` | `str` | Yes | Page body as HTML. |
| `country` | `str` | Yes | ISO 3166-1 alpha-2 country code. |
| `facts` | `dict` | Yes | One supported bank in the catalogue. |
| `id` | `str` | No |  |
| `lang` | `str` | Yes |  |
| `logo` | `str` | Yes | Site-relative URL of the bank's logo through the /api/public/bank-logo image proxy. |
| `maximumConsentValidityDays` | `int` | Yes | Longest consent the bank grants, in days (mostly 180). |
| `metaDescription` | `str` | Yes |  |
| `name` | `str` | Yes |  |
| `officialUrl` | `str` | No | The bank's own website. |
| `psuTypes` | `list` | Yes | Account holder types supported: personal and/or business. |
| `slug` | `str` | Yes | Unique identifier, country prefix plus name. |
| `title` | `str` | Yes |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list[BankEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.Bank().list()
for bank in results:
    print(bank.data_get())
```

#### `load(reqmatch, ctrl=None) -> BankEntity`

Load a single entity matching the given criteria. Returns the entity, whose record `data_get()` reads, and raises on error.

```python
result = client.Bank().load({"id": "bank_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `BankEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PostEntity

```python
post = client.Post()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `coverImageUrl` | `str` | Yes | Null on every probed post. |
| `excerpt` | `str` | Yes |  |
| `metaDescription` | `str` | Yes |  |
| `publishedAt` | `str` | Yes |  |
| `slug` | `str` | Yes |  |
| `title` | `str` | Yes |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list[PostEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.Post().list()
for post in results:
    print(post.data_get())
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PostEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `ratelimit` | 0.0.1 | Rate limiting |
| `retry` | 0.0.1 | Retry |
| `test` | 0.0.1 | Test transport |
| `timeout` | 0.0.1 | Timeout |


Features are activated via the `feature` option:

```python
client = OpenBankingSDK({
    "feature": {
        "ratelimit": {"active": True},
        "retry": {"active": True},
        "test": {"active": True},
        "timeout": {"active": True},
    },
})
```


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### Ordering

`ratelimit`, `retry`, `timeout` wrap the transport. Each
wraps whatever is already installed, so **activation order is nesting order**:
a feature activated later sits OUTSIDE one activated earlier, and sees the call
first.

That decides behaviour, not just sequence: a feature that short-circuits the
call, such as a cache serving a hit, stops every feature nested inside it from
ever seeing that call.

`test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `ratelimit`

Rate limiting.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

| Option | Type |
|---|---|
| `now` | function |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.ratelimit.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `retry`

Retry.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

| Option | Type |
|---|---|
| `jitter` | boolean |
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.retry.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `test`

Test transport.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `entity` | map |
| `net` | map |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

#### `timeout`

Timeout.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

| Option | Type |
|---|---|
| `clearTimer` | function |
| `now` | function |
| `setTimer` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.timeout.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

