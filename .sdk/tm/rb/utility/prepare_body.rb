# OpenBanking SDK utility: prepare_body
require_relative 'media'
module OpenBankingUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return OpenBankingUtilities.raw_body(ctx.reqdata) if OpenBankingUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end
