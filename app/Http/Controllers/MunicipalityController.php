<?php

namespace App\Http\Controllers;

use App\Models\Municipality;
use Illuminate\Http\Request;

class MunicipalityController extends Controller
{
    /**
     * return cities list
     *
     * @return json
     */
    public function getMunicipalities(Request $request)
    {
        $municipalities = Municipality::where('department_id', $request->department_id)->get();

        if (count($municipalities) > 0) {
            return response()->json($municipalities);
        }
    }
}
