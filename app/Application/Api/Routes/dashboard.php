<?php

use App\Api\Dashboard\Sms\Controllers\SmsSendController;
use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'sms', 'middleware' => ['apiKey.verify']], function () {
    Route::post('/send', [SmsSendController::class, 'sendSms']);
});
