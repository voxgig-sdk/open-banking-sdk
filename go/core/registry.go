package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewRatelimitFeatureFunc func() Feature

var NewRetryFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewTimeoutFeatureFunc func() Feature

var NewArticleEntityFunc func(client *OpenBankingSDK, entopts map[string]any) OpenBankingEntity

var NewBankEntityFunc func(client *OpenBankingSDK, entopts map[string]any) OpenBankingEntity

var NewPostEntityFunc func(client *OpenBankingSDK, entopts map[string]any) OpenBankingEntity

