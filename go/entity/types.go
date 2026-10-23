// Typed models for the OpenBanking SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/open-banking-sdk/go/core"
)

// Article is the typed data model for the article entity.
type Article struct {
}

// ArticleLoadMatch is the typed request payload for Article.LoadTyped.
type ArticleLoadMatch struct {
	Kind string `json:"kind"`
	Lang string `json:"lang"`
	Slug string `json:"slug"`
}

// Bank is the typed data model for the bank entity.
type Bank struct {
}

// BankLoadMatch is the typed request payload for Bank.LoadTyped.
type BankLoadMatch struct {
	Id string `json:"id"`
	Lang *string `json:"lang,omitempty"`
}

// BankListMatch is the typed request payload for Bank.ListTyped.
type BankListMatch struct {
	Beta *bool `json:"beta,omitempty"`
	Bic *string `json:"bic,omitempty"`
	BodyHtml *string `json:"bodyHtml,omitempty"`
	Country *string `json:"country,omitempty"`
	Facts *map[string]any `json:"facts,omitempty"`
	Id *string `json:"id,omitempty"`
	Lang *string `json:"lang,omitempty"`
	Logo *string `json:"logo,omitempty"`
	MaximumConsentValidityDays *int `json:"maximumConsentValidityDays,omitempty"`
	MetaDescription *string `json:"metaDescription,omitempty"`
	Name *string `json:"name,omitempty"`
	OfficialUrl *string `json:"officialUrl,omitempty"`
	PsuTypes *[]any `json:"psuTypes,omitempty"`
	Slug *string `json:"slug,omitempty"`
	Title *string `json:"title,omitempty"`
}

// Post is the typed data model for the post entity.
type Post struct {
}

// PostListMatch is the typed request payload for Post.ListTyped.
type PostListMatch struct {
	Lang *string `json:"lang,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
