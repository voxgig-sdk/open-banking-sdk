# OpenBanking SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

OpenBankingUtility.registrar = ->(u) {
  u.clean = OpenBankingUtilities::Clean
  u.clean_add = OpenBankingUtilities::CleanAdd
  u.clean_explain = OpenBankingUtilities::CleanExplain
  u.done = OpenBankingUtilities::Done
  u.make_error = OpenBankingUtilities::MakeError
  u.feature_add = OpenBankingUtilities::FeatureAdd
  u.feature_hook = OpenBankingUtilities::FeatureHook
  u.feature_init = OpenBankingUtilities::FeatureInit
  u.fetcher = OpenBankingUtilities::Fetcher
  u.make_fetch_def = OpenBankingUtilities::MakeFetchDef
  u.make_context = OpenBankingUtilities::MakeContext
  u.make_options = OpenBankingUtilities::MakeOptions
  u.make_request = OpenBankingUtilities::MakeRequest
  u.make_response = OpenBankingUtilities::MakeResponse
  u.make_result = OpenBankingUtilities::MakeResult
  u.make_point = OpenBankingUtilities::MakePoint
  u.make_spec = OpenBankingUtilities::MakeSpec
  u.make_url = OpenBankingUtilities::MakeUrl
  u.param = OpenBankingUtilities::Param
  u.prepare_auth = OpenBankingUtilities::PrepareAuth
  u.prepare_body = OpenBankingUtilities::PrepareBody
  u.prepare_headers = OpenBankingUtilities::PrepareHeaders
  u.prepare_method = OpenBankingUtilities::PrepareMethod
  u.prepare_params = OpenBankingUtilities::PrepareParams
  u.prepare_path = OpenBankingUtilities::PreparePath
  u.prepare_query = OpenBankingUtilities::PrepareQuery
  u.graphql_body = OpenBankingUtilities::GraphqlBody
  u.graphql_errors = OpenBankingUtilities::GraphqlErrors
  u.result_basic = OpenBankingUtilities::ResultBasic
  u.result_body = OpenBankingUtilities::ResultBody
  u.result_headers = OpenBankingUtilities::ResultHeaders
  u.transform_request = OpenBankingUtilities::TransformRequest
  u.transform_response = OpenBankingUtilities::TransformResponse
}
