<?php

namespace Support\Services;

use Illuminate\Contracts\Filesystem\FileNotFoundException;
use Illuminate\Support\Facades\Storage;

class S3Service
{
    private string $s3Url = 'themembers.s3.us-east-2.amazonaws.com';
    private string $cfUrl = 'd2ik51dz9s180r.cloudfront.net';

    public function uploadImage(object $data)
    {
        $path = Storage::disk('s3')->put('images', $data);
        $path = Storage::disk('s3')->url($path);

        if (!filter_var($path, FILTER_VALIDATE_URL)) {
            throw new FileNotFoundException('Não foi possível fazer o upload corretamente da imagem solicitada');
        }

        return str_replace($this->s3Url, $this->cfUrl, $path);

    }
}
