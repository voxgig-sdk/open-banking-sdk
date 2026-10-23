# OpenBanking SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module OpenBankingFeatures
  def self.make_feature(name)
    case name
    when "base"
      OpenBankingBaseFeature.new
    when "ratelimit"
      OpenBankingRatelimitFeature.new
    when "retry"
      OpenBankingRetryFeature.new
    when "test"
      OpenBankingTestFeature.new
    when "timeout"
      OpenBankingTimeoutFeature.new
    else
      OpenBankingBaseFeature.new
    end
  end
end
