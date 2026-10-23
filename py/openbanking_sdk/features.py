# OpenBanking SDK feature factory

from openbanking_sdk.feature.base_feature import OpenBankingBaseFeature
from openbanking_sdk.feature.ratelimit_feature import OpenBankingRatelimitFeature
from openbanking_sdk.feature.retry_feature import OpenBankingRetryFeature
from openbanking_sdk.feature.test_feature import OpenBankingTestFeature
from openbanking_sdk.feature.timeout_feature import OpenBankingTimeoutFeature


_FEATURES = {
    "base": lambda: OpenBankingBaseFeature(),
    "ratelimit": lambda: OpenBankingRatelimitFeature(),
    "retry": lambda: OpenBankingRetryFeature(),
    "test": lambda: OpenBankingTestFeature(),
    "timeout": lambda: OpenBankingTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
