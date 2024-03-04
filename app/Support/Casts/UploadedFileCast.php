<?php

namespace Support\Casts;

use Illuminate\Contracts\Database\Eloquent\CastsAttributes;
use Illuminate\Support\Facades\Storage;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Str;

class UploadedFileCast implements CastsAttributes
{
    public function __construct(
        private readonly string $path = '',
        private readonly bool $isPublic = true,
    ) {
    }

    /**
     * Cast the given value.
     *
     * @param  Model  $model
     * @param  string  $key
     * @param  mixed  $value
     * @param  array  $attributes
     * @return string
     */
    public function get($model, string $key, $value, array $attributes)
    {
        if (Str::startsWith($value, 'http')) {
            return $value;
        }
        if($value == 'undefined' || is_null($value)){
            return $value;
        }
        return Storage::disk('r2')->url($value);
    }

    /**
     * Prepare the given value for storage.
     *
     * @param  Model  $model
     * @param  string  $key
     * @param  UploadedFile|string  $value
     * @param  array  $attributes
     * @return string
     */
    public function set($model, string $key, $value, array $attributes)
    {
        if ($value instanceof UploadedFile) {
            $method = $this->isPublic ? 'storePublicly' : 'store';

            return $value->$method($this->path, [
                'disk' => 'r2',
            ]);
        }

        if (str_contains($value, ';base64,')) {
            $imageParts = explode(';base64,', $value);
            $imageTypeAux = explode('image/', $imageParts[0]);
            $imageType = $imageTypeAux[1];
            $imageBase64 = base64_decode($imageParts[1]);
            $fileName = $this->path . DIRECTORY_SEPARATOR . Str::orderedUuid() . ".$imageType";
            Storage::disk('r2')->put($fileName, $imageBase64);
            return $fileName;
        }

        return Str::of($value)->remove(config('filesystems.disks.r2.url'));
    }
}
