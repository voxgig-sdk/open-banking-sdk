# OpenBanking SDK exists test

import pytest
from openbanking_sdk import OpenBankingSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = OpenBankingSDK.test(None, None)
        assert testsdk is not None
