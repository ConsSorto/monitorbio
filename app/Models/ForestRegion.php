<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ForestRegion extends Model
{
    use HasFactory;

    public function samples(): HasMany
    {
        return $this->hasMany(Sample::class);
    }
}
