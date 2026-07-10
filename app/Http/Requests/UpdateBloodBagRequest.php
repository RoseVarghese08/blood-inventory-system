<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateBloodBagRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
   public function rules(): array
{
    return [

        'refrigerator_id' => [
            'required',
            'exists:refrigerators,id'
        ],

        'bag_number' => [

            'required',

            'string',

            'max:50',

            Rule::unique('blood_bags', 'bag_number')
                ->ignore($this->blood_bag),

        ],

        'blood_group' => [

            'required',

            Rule::in([
                'A+',
                'A-',
                'B+',
                'B-',
                'AB+',
                'AB-',
                'O+',
                'O-'
            ])

        ],

        'donor_name' => [
            'required',
            'string',
            'max:255'
        ],

        'collection_date' => [
            'required',
            'date'
        ],

        'expiry_date' => [
            'required',
            'date',
            'after:collection_date'
        ],

        'quantity' => [
            'required',
            'integer',
            'min:100',
            'max:500'
        ],

        'status' => [

            'required',

            Rule::in([
                'available',
                'reserved',
                'dispatched',
                'expired'
            ])

        ],

    ];
}
}
