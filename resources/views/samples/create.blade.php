@extends('layouts.principal')

@section('pagecontent')
    <div class="row">
        <div class="col-lg-12 mb-2 mt-2">
            <div class="pull-left">
                <h2>Agregar nueva muestra</h2>
            </div>
            <div class="pull-right">
                <a class="btn btn-primary" href="{{ route('samples.index') }}">Regresar</a>
            </div>
        </div>
    </div>

    @if ($errors->any())
        <div class="alert alert-danger">
            <strong>oops!</strong> Hay problemas con los datos.<br><br>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('samples.store') }}" method="POST">
        @csrf
        <div class="row mb-2 mt-2">
            <div class="form-group col-3">
                <strong>Codigo:</strong>
                <input type="text" name="code" class="form-control"/>
            </div>
            <div class="form-group col-7">
                <strong>Nombre:</strong>
                <input type="text" name="name" class="form-control"/>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-3">
                <strong>Region Forestal:</strong>
                <select class="form-select col-3" name="forest_region_id">
                    <option selected disabled>Seleccione La Region Forestal</option>
                    @foreach ($forest_regions as $forest_region)
                        <option value="{{ $forest_region->id }}">{{ $forest_region->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-3">
                <strong>Departamento:</strong>
                <select class="form-select col-3" name="department_id" id="department_id">
                    <option selected disabled>Seleccione el Departamento</option>
                    @foreach ($departments as $department)
                        <option value="{{ $department->id }}">{{ $department->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group col-3">
                <strong>Municipio:</strong>
                <select class="form-select col-3" name="municipality_id" id="municipality_id">
                </select>
            </div>
            <div class="form-group col-3">
                <strong>Lugar:</strong>
                <input type="text" name="place" class="form-control">
            </div>
        </div>
        <div class="row mt-2">
            <div class="form-group col-3">
                <strong>UTMX:</strong>
                <input type="number" name="utmx" class="form-control"/>
            </div>
            <div class="form-group col-3">
                <strong>UTMY:</strong>
                <input type="number" name="utmy" class="form-control"/>
            </div>
            <div class="form-group col-3">
                <strong>MSMN:</strong>
                <input type="number" name="msmn" class="form-control"/>
            </div>
        </div>
        <button type="submit" class="btn btn-primary mt-2">Guardar !!</button>
    </form>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#department_id').on('change', function () {
                var department_id = this.value;
                $('#municipality_id').html('');
                $.ajax({
                    url: '{{ route('getMunicipalities') }}?department_id=' + department_id,
                    type: 'get',
                    success: function (res) {
                        $('#municipality_id').html('<option selected disabled>Seleccione el Municipio</option>');
                        $.each(res, function (key, value) {
                            $('#municipality_id').append('<option value="' + value
                                .id + '">' + value.name + '</option>');
                        });
                    }
                });
            });
        });
    </script>
@endsection
