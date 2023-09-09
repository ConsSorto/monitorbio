@extends('layouts.principal')

@section('pagecontent')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Detalles de la Muestra</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{ route('samples.index') }}">Regresar</a>
            </div>
        </div>
    </div>

    <div class="row">
        <form>
            <fieldset disabled="">
                <div class="row mb-2 mt-2">
                    <div class="form-group col-3">
                        <strong>Codigo:</strong>
                        <input type="text" name="code" class="form-control" value="{{ $sample->code }}"/>
                    </div>
                    <div class="form-group col-7">
                        <strong>Nombre:</strong>
                        <input type="text" name="name" class="form-control" value="{{ $sample->name }}"/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-3">
                        <strong>Region Forestal:</strong>
                        <input type="text" name="name" class="form-control" value="{{ $sample->forest_region->name }}"/>
                    </div>
                    <div class="form-group col-3">
                        <strong>Departamento:</strong>
                        <input type="text" name="name" class="form-control" value="{{ $sample->department->name }}"/>
                    </div>
                    <div class="form-group col-3">
                        <strong>Municipio:</strong>
                        <input type="text" name="name" class="form-control" value="{{ $sample->municipality->name }}"/>
                    </div>
                    <div class="form-group col-3">
                        <strong>Lugar:</strong>
                        <input type="text" name="place" class="form-control" value="{{ $sample->place }}">
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="form-group col-3">
                        <strong>UTMX:</strong>
                        <input type="number" name="utmx" class="form-control" value="{{ $sample->utmx }}"/>
                    </div>
                    <div class="form-group col-3">
                        <strong>UTMY:</strong>
                        <input type="number" name="utmy" class="form-control" value="{{ $sample->utmy }}"/>
                    </div>
                    <div class="form-group col-3">
                        <strong>MSMN:</strong>
                        <input type="number" name="msmn" class="form-control" value="{{ $sample->msmn }}"/>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
@endsection
