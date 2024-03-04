<?php

namespace Support\Http\Resources\CustomHtml;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource as JsonResourceAlias;

class CustomHtmlResource extends JsonResourceAlias
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'tenant_id' => $this->tenant_id,
            'page' => $this->page,
            'html' => $this->html,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
