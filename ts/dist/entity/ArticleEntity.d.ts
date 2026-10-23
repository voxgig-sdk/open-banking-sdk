import { OpenBankingEntityBase } from '../OpenBankingEntityBase';
import type { OpenBankingSDK } from '../OpenBankingSDK';
import type { Control } from '../types';
import type { Article, ArticleLoadMatch } from '../OpenBankingTypes';
declare class ArticleEntity extends OpenBankingEntityBase<Article> {
    constructor(client: OpenBankingSDK, entopts: any);
    make(this: ArticleEntity): ArticleEntity;
    load(this: any, reqmatch?: ArticleLoadMatch, ctrl?: Control): Promise<ArticleEntity>;
}
export { ArticleEntity };
