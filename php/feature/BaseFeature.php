<?php
declare(strict_types=1);

// OpenBanking SDK base feature

class OpenBankingBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(OpenBankingContext $ctx, array $options): void {}
    public function PostConstruct(OpenBankingContext $ctx): void {}
    public function PostConstructEntity(OpenBankingContext $ctx): void {}
    public function SetData(OpenBankingContext $ctx): void {}
    public function GetData(OpenBankingContext $ctx): void {}
    public function GetMatch(OpenBankingContext $ctx): void {}
    public function SetMatch(OpenBankingContext $ctx): void {}
    public function PrePoint(OpenBankingContext $ctx): void {}
    public function PreSpec(OpenBankingContext $ctx): void {}
    public function PreRequest(OpenBankingContext $ctx): void {}
    public function PreResponse(OpenBankingContext $ctx): void {}
    public function PreResult(OpenBankingContext $ctx): void {}
    public function PreDone(OpenBankingContext $ctx): void {}
    public function PreUnexpected(OpenBankingContext $ctx): void {}
}
