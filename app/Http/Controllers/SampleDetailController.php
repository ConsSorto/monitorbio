<?php

namespace App\Http\Controllers;

use App\Models\SampleDetail;
use Illuminate\Http\Request;

class SampleDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
            $request->validate([
                'sample_id' => 'required|integer|exists:samples,id',
                'bottlenumber' => 'required|integer',
                'picker' => 'required',
                'datepicker' => 'required',
                'period_id' => 'required|integer|exists:catalogs,id',
                'order' => 'required',
                'family' => 'required',
                'subfamily' => 'required',
                'gender' => 'required',
                'species' => 'required',
                'genitaliascore' => 'required',
                'finalscore' => 'required',
                'sex_id' => 'required|integer|exists:catalogs,id',
                'quantity' => 'required|decimal:2',
                'size' => 'required|decimal:2',
                'color_id' => 'required|integer|exists:catalogs,id',
                'identifier' => 'required'
            ]);

        SampleDetail::create($request->all());

        $sampleDetails = SampleDetail::where('sample_id', $request->input('sample_id'))->orderBy('id', 'desc')->get();

        return redirect()->back()->with(['sampleDetails' => $sampleDetails, 'success' => 'Detalle creado correctamente']);
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request)
    {
        $sampleDetails = SampleDetail::where('sample_id', $request->input('sample_id'))->get();

        return $sampleDetails;
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(SampleDetail $sampleDetail)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, SampleDetail $sampleDetail)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(SampleDetail $sampleDetail)
    {
        $sampleDetail->delete();

        $sampleDetails = SampleDetail::where('sample_id', $sampleDetail->sample_id)->get();

        return redirect()->back()->with(['sampleDetails'=> $sampleDetails, 'success'=>'Detalle de colecta borrada correctamente.']);
    }
}
