<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateTemperatureLogRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [

            'refrigerator_id' => [
                'required',
                'exists:refrigerators,id'
            ],

            'temperature' => [
                'required',
                'numeric',
                'between:-20,20'
            ],

            'recorded_at' => [
                'required',
                'date'
            ],

        ];
    }
}