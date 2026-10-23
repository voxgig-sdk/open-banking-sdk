import { OpenBankingEntityBase } from '../OpenBankingEntityBase';
import type { OpenBankingSDK } from '../OpenBankingSDK';
import type { Control } from '../types';
import type { Post, PostListMatch } from '../OpenBankingTypes';
declare class PostEntity extends OpenBankingEntityBase<Post> {
    constructor(client: OpenBankingSDK, entopts: any);
    make(this: PostEntity): PostEntity;
    list(this: any, reqmatch?: PostListMatch, ctrl?: Control): Promise<PostEntity[]>;
}
export { PostEntity };
