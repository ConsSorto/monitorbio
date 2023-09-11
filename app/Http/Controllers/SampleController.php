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

        return view('samples.index', compact('samples'))
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
        ], ['forest_region_id.required' => 'El campo region forestal es obligatorio.',
            'forest_region_id.integer' => 'El campo region forestal deber ser un entero.',
            'forest_region_id.exists' => 'El campo region forestal es invalido.',
            'department_id.required' => 'El campo Departamento es obligatorio.',
            'department_id.integer' => 'El campo Departamento deber ser un entero.',
            'department_id.exists' => 'El campo region forestal es invalido.',
            'municipality_id.required' => 'El campo Municipio es obligatorio.',
            'place.required' => 'El campo Lugar es obligatorio.',
            'code.required' => 'El campo Codigo es obligatorio.',
            'code.unique' => 'El valor campo Codigo ya fue utilizado.',
            'name.required' => 'El campo Nombre es obligatorio.',
            'name.unique' => 'El valor campo Nombre ya fue utilizado.',
            'utmx.required' => 'El campo utmx es obligatorio.',
            'utmx.integer' => 'El valor campo utmx deber ser un entero.',
            'utmy.required' => 'El campo utmy es obligatorio.',
            'utmy.integer' => 'El valor campo utmy deber ser un entero.',
            'msmn.required' => 'El campo msmn es obligatorio.',
            'msmn.integer' => 'El valor campo msmn deber ser un entero.']
        );

        Sample::create($request->all());

        return redirect()->route('samples.index')
            ->with('success', 'Muestra creada correctamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Sample $sample)
    {
        $periods = Catalog::where('catalog_id', '1')->get();
        $sexs = Catalog::where('catalog_id', '4')->get();
        $colors = Catalog::where('catalog_id', '9')->get();
        $sampleDetails = $sample->details;

        return view('samples.show', compact('sample', 'periods', 'sexs', 'colors', 'sampleDetails'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Sample $sample)
    {
        $forest_regions = ForestRegion::all();
        $departments = Department::all();
        $municipalities = Municipality::where('department_id', $sample->department_id)->get();

        return view('samples.edit', compact('sample', 'departments', 'forest_regions', 'municipalities'));
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
        ], ['forest_region_id.required' => 'El campo region forestal es obligatorio.',
            'forest_region_id.integer' => 'El campo region forestal deber ser un entero.',
            'forest_region_id.exists' => 'El campo region forestal es invalido.',
            'department_id.required' => 'El campo Departamento es obligatorio.',
            'department_id.integer' => 'El campo Departamento deber ser un entero.',
            'department_id.exists' => 'El campo region forestal es invalido.',
            'municipality_id.required' => 'El campo Municipio es obligatorio.',
            'place.required' => 'El campo Lugar es obligatorio.',
            'code.required' => 'El campo Codigo es obligatorio.',
            'code.unique' => 'El valor campo Codigo ya fue utilizado.',
            'name.required' => 'El campo Nombre es obligatorio.',
            'name.unique' => 'El valor campo Nombre ya fue utilizado.',
            'utmx.required' => 'El campo utmx es obligatorio.',
            'utmx.integer' => 'El valor campo utmx deber ser un entero.',
            'utmy.required' => 'El campo utmy es obligatorio.',
            'utmy.integer' => 'El valor campo utmy deber ser un entero.',
            'msmn.required' => 'El campo msmn es obligatorio.',
            'msmn.integer' => 'El valor campo msmn deber ser un entero.']);

        $sample->update($request->all());

        return redirect()->route('samples.index')
            ->with('success', 'Muestra modificada correctamente.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Sample $sample)
    {
        $sample->delete();

        return redirect()->route('samples.index')
            ->with('success', 'Muestra borrada correctamente.');
    }
}
