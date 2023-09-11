<?php

namespace App\Http\Controllers;

use App\Models\Catalog;
use App\Models\Department;
use App\Models\Municipality;
use App\Models\ForestRegion;
use App\Models\Samples;
use Illuminate\Http\Request;
use App\Models\Sample;
use Illuminate\Validation\Rule;

class SampleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $samples = Sample::latest()->paginate(10);

        return view('samples.index',compact('samples'))
            ->with('i', (request()->input('page', 1) - 1) * 10);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $forest_regions = ForestRegion::all();
        $departments = Department::all();
        return view('samples.create', compact('departments', 'forest_regions'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'forest_region_id' => 'required|integer|exists:forest_regions,id',
            'department_id' => 'required|integer|exists:departments,id',
            'municipality_id' => 'required|integer|exists:municipalities,id',
            'place' => 'required',
            'code' => 'required|unique:samples',
            'name' => 'required|unique:samples',
            'utmx' => 'required|integer',
            'utmy' => 'required|integer',
            'msmn' => 'required|integer'
        ]);

        Sample::create($request->all());

        return redirect()->route('samples.index')
            ->with('success','Muestra creada correctamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Sample $sample)
    {
        $periods = Catalog::where('catalog_id','1')->get();
        $sexs = Catalog::where('catalog_id','4')->get();
        $colors = Catalog::where('catalog_id','9')->get();
        $sampleDetails = $sample->details;

        return view('samples.show',compact('sample', 'periods', 'sexs', 'colors', 'sampleDetails'));
    }
    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Sample $sample)
    {
        $forest_regions = ForestRegion::all();
        $departments = Department::all();
        $municipalities = Municipality::where('department_id', $sample->department_id)->get();

        return view('samples.edit',compact('sample','departments', 'forest_regions', 'municipalities'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Sample $sample)
    {
        $request->validate([
            'forest_region_id' => 'required|integer|exists:forest_regions,id',
            'department_id' => 'required|integer|exists:departments,id',
            'municipality_id' => 'required|integer|exists:municipalities,id',
            'place' => 'required',
            'code' => ['required', Rule::unique('samples')->ignore($sample->id)],
            'name' => ['required', Rule::unique('samples')->ignore($sample->id)],
            'utmx' => 'required|integer',
            'utmy' => 'required|integer',
            'msmn' => 'required|integer'
        ]);

        $sample->update($request->all());

        return redirect()->route('samples.index')
            ->with('success','Muestra modificada correctamente.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Sample $sample)
    {
        $sample->delete();

        return redirect()->route('samples.index')
            ->with('success','Muestra borrada correctamente.');
    }
}
