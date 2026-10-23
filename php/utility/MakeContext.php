<?php
declare(strict_types=1);

// OpenBanking SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class OpenBankingMakeContext
{
    public static function call(array $ctxmap, ?OpenBankingContext $basectx): OpenBankingContext
    {
        return new OpenBankingContext($ctxmap, $basectx);
    }
}
