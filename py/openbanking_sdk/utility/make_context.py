# OpenBanking SDK utility: make_context

from openbanking_sdk.core.context import OpenBankingContext


def make_context_util(ctxmap, basectx):
    return OpenBankingContext(ctxmap, basectx)
