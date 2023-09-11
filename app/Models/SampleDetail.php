<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SampleDetail extends Model
{
    use HasFactory;


    protected $fillable = ['sample_id', 'bottlenumber','picker','datepicker','period_id','order','family','subfamily',
        'gender','species','genitaliascore','finalscore','sex_id','quantity','size','color_id','identifier'];

    public function sample()
    {
        return $this->belongsTo(Sample::class);
    }
    public function period()
    {
        return $this->belongsTo(Catalog::class);
    }
    public function sex()
    {
        return $this->belongsTo(Catalog::class);
    }

    public function color()
    {
        return $this->belongsTo(Catalog::class);
    }
}
