# Open Banking API

The keyless, public part of the open-banking.io API: the catalogue of supported EU/EEA banks, per-bank landing pages, and the blog. Knowledge source: the developer page https://open-banking.io/en/developers (which documents only the keyed, X-Api-Key account/transaction API, deliberately left out here), the site&#39;s own front-end JavaScript bundles (which reveal the /api/public/* paths), and live GET probes on 2026-10-23. Every response shape below is taken from a live response. Unverified or excluded: /api/public/banks/country/&#123;cc&#125; is referenced by the front end but returned 404 for every country probed (de, DE, se), so it is omitted; /api/public/bank-logo?u=... is an image proxy, not JSON, so it is omitted; bank landing pages exist only for some banks and only in some languages (de-fyrst?lang=de returned 404 while lang=en worked); the set of CMS page kinds other than &#39;blog&#39; is unknown. The account, transaction, connection and sync endpoints all need an API key and a paid connected account and are not described.

## Start here

This guide introduces the API, the client libraries, and the companion tools in this repository. Start with the API capabilities, choose a client for your application, and use the linked reference when you need exact request and response details.

The selected API surface contains 3 entities and 4 HTTP routes. There are 6 SDK targets and 2 companion tools.

An entity groups related API operations. An operation can have several routes with different inputs or authentication requirements. The SDK exposes the entity and its operations using the conventions of the selected language.

## What the API provides

### Article

Results: The page.

SDK operations: `load`.

Key fields to recognise:

- `bodyHtml`: Page body as HTML.

### Bank

Results: All supported banks.; The bank&#39;s landing page.

SDK operations: `list`, `load`.

Key fields to recognise:

- `beta`: True when support for this bank is in beta.
- `bic`: BIC/SWIFT code; null for some banks.
- `bodyHtml`: Page body as HTML.
- `country`: ISO 3166-1 alpha-2 country code.
- `facts`: One supported bank in the catalogue.

### Post

Results: Blog post summaries.

SDK operations: `list`.

Key fields to recognise:

- `coverImageUrl`: Null on every probed post.

### Route map

Use this map to locate a capability. Consult the entity reference before supplying request data; routes for the same operation can require different fields.

| Entity | SDK operation | HTTP route | Authentication |
| --- | --- | --- | --- |
| Article | `load` | `GET /api/public/cms/pages/{kind}/{lang}/{slug}` | See reference |
| Bank | `list` | `GET /api/public/banks` | See reference |
| Bank | `load` | `GET /api/public/banks/{slug}` | See reference |
| Post | `list` | `GET /api/public/cms/posts` | See reference |

## Connect to the API

- API server: `https://open-banking.io`

Check authentication for the route you plan to call. A route that declares no authentication can be used without credentials; this does not change the requirements of other routes. Keep credentials in environment variables or a configured secret provider, and keep them out of source control and logs.

## Make a first request

1. Choose the API server and an operation that matches your task.
2. Check the operation’s required input and authentication. Use values valid for your account and environment.
3. Send one request and inspect the returned data before adding retries, concurrency, or a larger batch.

For an SDK call, install or build the chosen client, create a client instance with its documented configuration, and call the required entity operation. Language references describe the argument shape, asynchronous behaviour, and returned values.

## Choose an SDK

Choose the language already used by your application or service. The clients represent the same API model, while package setup, naming, and return types follow each language. Check the selected client’s reference and tests before integrating it into an existing application.

| Client | Repository directory | Distribution |
| --- | --- | --- |
| Golang | `go/` | Build from source |
| Lua | `lua/` | Build from source |
| PHP | `php/` | Build from source |
| Python | `py/` | Build from source |
| Ruby | `rb/` | Build from source |
| TypeScript | `ts/` | Build from source |

Build-from-source entries are not marked as published in the project model. Follow the build instructions in that target’s README, then consume the resulting package using your language’s local dependency mechanism. Published entries give the installation command recorded for that client.

## Companion tools

These targets provide another way to use the API. Their available commands or tools can cover a smaller set of operations than the client libraries.

### Go CLI

Use the command-line interface for shell-based tasks and scripts.

Repository directory: `go-cli/`. Not published. Build from the go-cli directory.


### Go MCP server

Use the MCP server to expose supported API operations to an MCP client.

Repository directory: `go-mcp/`. Not published. Build from the go-mcp directory.

- `open-banking_list`: List records for an entity. Supported entities: `bank`, `post`.
- `open-banking_load`: Load one record for an entity. Supported entities: `article`, `bank`.

## Operational features

Features supply behaviour around API calls, such as request handling, diagnostics, or local testing. Inclusion in this project does not mean a feature is enabled at runtime. Check the selected SDK’s supported features and configuration defaults, then enable the behaviour your application needs.

- `ratelimit`: Client-side rate limiting via a token bucket
- `retry`: Automatic retry of transient failures with exponential backoff
- `test`: In-memory mock transport for testing without a live server
- `timeout`: Per-request timeout with transport abort

Start with the default client configuration. Add request limits and diagnostics as needed, test error paths, and review retry behaviour before using operations that change data. A retry can repeat an operation unless the API provides a suitable guarantee.

## Continue with the documentation

- Follow the first-call guide for the setup sequence.
- Read the authentication guide before using protected routes.
- Use the API reference for request schemas, response formats, and status codes.
- Check the chosen SDK or companion tool reference for its configuration and supported operations.

