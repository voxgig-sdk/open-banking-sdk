<?php
declare(strict_types=1);

// OpenBanking SDK utility: result_headers

class OpenBankingResultHeaders
{
    public static function call(OpenBankingContext $ctx): ?OpenBankingResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
