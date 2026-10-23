<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FinancementSetting extends Model
{
    protected $fillable = ['key', 'value'];
    public $timestamps = false;

    public static function getValue($key, $default = null)
    {
        $setting = self::where('key', $key)->first();
        return $setting ? $setting->value : $default;
    }

    public static function setValue($key, $value)
    {
        return self::updateOrCreate(['key' => $key], ['value' => $value]);
    }
}
