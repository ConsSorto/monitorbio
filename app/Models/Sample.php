<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sample extends Model
{
    use HasFactory;

    protected $fillable = ['forest_region_id', 'department_id', 'municipality_id', 'place', 'code', 'name', 'utmx', 'utmy', 'msmn'];

    public function forest_region()
    {
        return $this->belongsTo(ForestRegion::class);
    }

    public function department()
    {
        return $this->belongsTo(Department::class);
    }

    public function municipality()
    {
        return $this->belongsTo(Municipality::class);
    }
    public function details()
    {
        return $this->hasMany(SampleDetail::class)->orderBy('id', 'desc');
    }
}
