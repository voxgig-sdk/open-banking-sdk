# OpenBanking SDK utility: make_context
require_relative '../core/context'
module OpenBankingUtilities
  MakeContext = ->(ctxmap, basectx) {
    OpenBankingContext.new(ctxmap, basectx)
  }
end
