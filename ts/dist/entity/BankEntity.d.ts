import { OpenBankingEntityBase } from '../OpenBankingEntityBase';
import type { OpenBankingSDK } from '../OpenBankingSDK';
import type { Control } from '../types';
import type { Bank, BankLoadMatch, BankListMatch } from '../OpenBankingTypes';
declare class BankEntity extends OpenBankingEntityBase<Bank> {
    constructor(client: OpenBankingSDK, entopts: any);
    make(this: BankEntity): BankEntity;
    load(this: any, reqmatch?: BankLoadMatch, ctrl?: Control): Promise<BankEntity>;
    list(this: any, reqmatch?: BankListMatch, ctrl?: Control): Promise<BankEntity[]>;
}
export { BankEntity };
