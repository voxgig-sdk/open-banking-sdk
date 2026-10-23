
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { OpenBankingSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = OpenBankingSDK.test()
    equal(testsdk instanceof OpenBankingSDK, true,
      'OpenBankingSDK.test() must return a client synchronously')
  })

})
