package voxgigopenbankingsdk

import (
	"github.com/voxgig-sdk/open-banking-sdk/go/core"
	"github.com/voxgig-sdk/open-banking-sdk/go/entity"
	"github.com/voxgig-sdk/open-banking-sdk/go/feature"
	_ "github.com/voxgig-sdk/open-banking-sdk/go/utility"
)

// Type aliases preserve external API.
type OpenBankingSDK = core.OpenBankingSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type OpenBankingEntity = core.OpenBankingEntity
type StreamItem = core.StreamItem
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type OpenBankingError = core.OpenBankingError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewRatelimitFeatureFunc = func() core.Feature {
		return feature.NewRatelimitFeature()
	}
	core.NewRetryFeatureFunc = func() core.Feature {
		return feature.NewRetryFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewTimeoutFeatureFunc = func() core.Feature {
		return feature.NewTimeoutFeature()
	}
	core.NewArticleEntityFunc = func(client *core.OpenBankingSDK, entopts map[string]any) core.OpenBankingEntity {
		return entity.NewArticleEntity(client, entopts)
	}
	core.NewBankEntityFunc = func(client *core.OpenBankingSDK, entopts map[string]any) core.OpenBankingEntity {
		return entity.NewBankEntity(client, entopts)
	}
	core.NewPostEntityFunc = func(client *core.OpenBankingSDK, entopts map[string]any) core.OpenBankingEntity {
		return entity.NewPostEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewOpenBankingSDK = core.NewOpenBankingSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var SharedConfig = core.SharedConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewOpenBankingSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *OpenBankingSDK  { return NewOpenBankingSDK(nil) }
func Test() *OpenBankingSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewRatelimitFeature = feature.NewRatelimitFeature
var NewRetryFeature = feature.NewRetryFeature
var NewTestFeature = feature.NewTestFeature
var NewTimeoutFeature = feature.NewTimeoutFeature
