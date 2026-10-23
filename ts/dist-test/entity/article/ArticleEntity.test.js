"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const node_path_1 = __importDefault(require("node:path"));
const Fs = __importStar(require("node:fs"));
const node_test_1 = require("node:test");
const node_assert_1 = __importDefault(require("node:assert"));
const live_runner_1 = require("../../live-runner");
const live_entity_1 = require("../../live-entity");
const __1 = require("../../..");
const utility_1 = require("../../utility");
(0, utility_1.loadEnvLocal)(__dirname + '/../../../.env.local');
(0, node_test_1.describe)('ArticleEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when OPEN_BANKING_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('OPEN_BANKING_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.OpenBankingSDK.test();
        const ent = testsdk.Article();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('validate', async (t) => {
        if (null == __1.config.feature?.validate) {
            t.skip('feature not present in this SDK: validate');
            return;
        }
        const client = __1.OpenBankingSDK.test(undefined, { feature: { validate: { active: true } } });
        await node_assert_1.default.rejects(client.Article().load({ "kind": 1, "lang": "x", "slug": "x" }), (err) => 'validate_failed' === err.code);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.OPEN_BANKING_TEST_LIVE;
        for (const op of []) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'article.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": { "bodyHtml": { "a": true, "h": "Body Html", "n": "bodyHtml", "r": true, "sh": "Page body as HTML.", "t": "`$STRING`", "key$": "bodyHtml", "index$": 0 }, "canonicalUrl": { "a": true, "h": "Canonical Url", "n": "canonicalUrl", "r": false, "t": "`$STRING`", "key$": "canonicalUrl", "index$": 1 }, "coverImageUrl": { "a": true, "h": "Cover Image Url", "n": "coverImageUrl", "r": false, "t": "`$STRING`", "key$": "coverImageUrl", "index$": 2 }, "excerpt": { "a": true, "h": "Excerpt", "n": "excerpt", "r": false, "t": "`$STRING`", "key$": "excerpt", "index$": 3 }, "id": { "a": true, "h": "Id", "n": "id", "r": false, "t": "`$STRING`", "key$": "id", "index$": 4 }, "kind": { "a": true, "h": "Kind", "n": "kind", "r": true, "t": "`$STRING`", "key$": "kind", "index$": 5 }, "lang": { "a": true, "h": "Lang", "n": "lang", "r": true, "t": "`$STRING`", "key$": "lang", "index$": 6 }, "metaDescription": { "a": true, "h": "Meta Description", "n": "metaDescription", "r": true, "t": "`$STRING`", "key$": "metaDescription", "index$": 7 }, "publishedAt": { "a": true, "fo": "date-time", "h": "Published At", "n": "publishedAt", "r": false, "t": "`$STRING`", "key$": "publishedAt", "index$": 8 }, "slug": { "a": true, "h": "Slug", "n": "slug", "r": true, "t": "`$STRING`", "key$": "slug", "index$": 9 }, "title": { "a": true, "h": "Title", "n": "title", "r": true, "t": "`$STRING`", "key$": "title", "index$": 10 }, "updatedAt": { "a": true, "fo": "date-time", "h": "Updated At", "n": "updatedAt", "r": false, "t": "`$STRING`", "key$": "updatedAt", "index$": 11 } }, "id": { "field": "id", "from": { "kind": "kind", "lang": "lang", "slug": "slug" }, "name": "id", "parts": ["kind", "lang", "slug"], "sep": "/" }, "name": "article", "op": { "load": { "input": "data", "name": "load", "points": [{ "a": true, "co": { "id": "GET /api/public/cms/pages/{kind}/{lang}/{slug}", "source": "openapi3", "version": 2 }, "g": { "params": [{ "a": true, "ex": "blog", "k": "param", "n": "kind", "or": "kind", "r": true, "t": "`$STRING`", "index$": 0 }, { "a": true, "ex": "en", "k": "param", "n": "lang", "or": "lang", "r": true, "t": "`$STRING`", "index$": 1 }, { "a": true, "ex": "openbanking-cli-guide", "k": "param", "n": "slug", "or": "slug", "r": true, "t": "`$STRING`", "index$": 2 }] }, "k": "http", "m": "GET", "o": "/api/public/cms/pages/{kind}/{lang}/{slug}", "q": { "exist": ["kind", "lang", "slug"] }, "r": {}, "rs": { "kind": "json", "media": "application/json" }, "s": [{ "lit": "api" }, { "lit": "public" }, { "lit": "cms" }, { "lit": "pages" }, { "var": "kind" }, { "var": "lang" }, { "var": "slug" }], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "load" } }, "relations": { "ancestors": [] }, "key$": "article", "name__orig": "article", "Name": "Article", "name_": "article", "name-": "article", "NAME": "ARTICLE", "index$": 0 }, { "active": true, "entity": "article", "key$": "BasicArticleFlow", "kind": "basic", "name": "BasicArticleFlow", "param": {}, "step": [{ "a": false, "d": {}, "i": { "ref": "article_ref01", "srcdatavar": "article_ref01_data", "suffix": "_dt0" }, "m": { "id": "article01", "kind": "kind01", "lang": "lang01" }, "o": "load", "s": [], "v": [{ "apply": "TextFieldMark", "def": { "mark": "Mark01-article_ref01" } }], "unreachable": true }] }, 'Article', { "GET /api/public/cms/pages/{kind}/{lang}/{slug}": { "protocol": "http", "parameters": [{ "name": "kind", "in": "path", "required": true, "description": "Page kind. Only 'blog' is verified.", "schema": { "type": "string" }, "example": "blog", "index$": 0 }, { "name": "lang", "in": "path", "required": true, "description": "Language code.", "schema": { "type": "string" }, "example": "en", "index$": 1 }, { "name": "slug", "in": "path", "required": true, "description": "Page slug, e.g. from listPosts.", "schema": { "type": "string" }, "example": "openbanking-cli-guide", "index$": 2 }] } }, { strict: LIVE_STRICT, t });
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        let article_ref01_data = Object.values(setup.data.existing.article)[0];
    });
});
// main.kit.test.live.strict is true (the default is true): a live
// request that fails, or a live test missing an input it needs,
// fails the test.
// An account with no record for a test to read skips it either way.
const LIVE_STRICT = true;
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/article/ArticleTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.OpenBankingSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['article01', 'article02', 'article03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'OPEN_BANKING_TEST_ARTICLE_ENTID': idmap,
        'OPEN_BANKING_TEST_LIVE': 'FALSE',
        'OPEN_BANKING_TEST_EXPLAIN': 'FALSE',
    });
    idmap = env['OPEN_BANKING_TEST_ARTICLE_ENTID'];
    const live = 'TRUE' === env.OPEN_BANKING_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['OPEN_BANKING_TEST_ARTICLE_ENTID'];
        idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {};
        if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
            throw new Error('Live ENTID must be a JSON object');
        }
        client = new __1.OpenBankingSDK(merge([
            // FIRST, so the generated fields below win: sdk-test-control.json's
            // test.client.options adds to the live client, it does not redirect it.
            (0, utility_1.liveClientOptions)(),
            {},
            // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
            // last entry is undefined, and basicSetup is normally called with no
            // argument at all - so a bare 'extra' silently discarded the apikey
            // and server values above and handed the SDK undefined. Harmless
            // while there was nothing in that object; not harmless now.
            extra || {},
            { system: { fetch: transport.fetch } }
        ]));
    }
    const setup = {
        idmap,
        env,
        options,
        client,
        struct,
        data: entityData,
        explain: 'TRUE' === env.OPEN_BANKING_TEST_EXPLAIN,
        live,
        transport,
        now: Date.now(),
    };
    return setup;
}
//# sourceMappingURL=ArticleEntity.test.js.map