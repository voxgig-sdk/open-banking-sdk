import { ArticleEntity } from './entity/ArticleEntity';
import { BankEntity } from './entity/BankEntity';
import { PostEntity } from './entity/PostEntity';
export type * from './OpenBankingTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { OpenBankingEntityBase } from './OpenBankingEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
type DirectResult = {
    ok: false;
    err: any;
    status?: undefined;
    headers?: undefined;
    data?: undefined;
} | {
    ok: boolean;
    status: number;
    headers: any;
    data: any;
    err?: any;
};
declare class OpenBankingSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<DirectResult>;
    _rawRequest(fetchargs?: any): Promise<DirectResult>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Article(entopts?: Record<string, any>): ArticleEntity;
    Bank(entopts?: Record<string, any>): BankEntity;
    Post(entopts?: Record<string, any>): PostEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): OpenBankingSDK;
    tester(testopts?: any, sdkopts?: any): OpenBankingSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof OpenBankingSDK;
export { stdutil, config, BaseFeature, OpenBankingEntityBase, OpenBankingSDK, SDK, };
export type { DirectResult };
