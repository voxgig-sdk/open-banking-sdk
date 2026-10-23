-- OpenBanking SDK exists test

local sdk = require("open-banking_sdk")

describe("OpenBankingSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
