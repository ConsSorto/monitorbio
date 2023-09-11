@extends('layouts.principal')

@section('pagecontent')
    <div class="card">
        <div class="card-body">
            <div class="card-header">

                <div class="row">
                    <div class="col-lg-12 mt-4 mb-4">
                        <div class="float-start">
                            <h4>Detalles Colecta</h4>
                        </div>
                        <div class="float-end">
                            <a class="btn btn-primary" href="{{ route('samples.index') }}">Regresar</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <form>
                            <fieldset disabled>
                                <div class="row mb-2 mt-2">
                                    <div class="form-group col-2">
                                        <label>Codigo:</label>
                                        <input type="text" name="code" class="form-control"
                                               value="{{ $sample->code }}"/>
                                    </div>
                                    <div class="form-group col-4">
                                        <label>Nombre:</label>
                                        <input type="text" name="name" class="form-control"
                                               value="{{ $sample->name }}"/>
                                    </div>
                                    <div class="form-group col-2">
                                        <label>Region Forestal:</label>
                                        <input type="text" name="name" class="form-control"
                                               value="{{ $sample->forest_region->name }}"/>
                                    </div>
                                    <div class="form-group col-2">
                                        <label>Departamento:</label>
                                        <input type="text" name="name" class="form-control"
                                               value="{{ $sample->department->name }}"/>
                                    </div>
                                    <div class="form-group col-2">
                                        <label>Municipio:</label>
                                        <input type="text" name="name" class="form-control"
                                               value="{{ $sample->municipality->name }}"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-2">
                                        <label>Lugar:</label>
                                        <input type="text" name="place" class="form-control"
                                               value="{{ $sample->place }}">
                                    </div>
                                    <div class="form-group col-2">
                                        <label>UTMX:</label>
                                        <input type="number" name="utmx" class="form-control"
                                               value="{{ $sample->utmx }}"/>
                                    </div>
                                    <div class="form-group col-2">
                                        <label>UTMY:</label>
                                        <input type="number" name="utmy" class="form-control"
                                               value="{{ $sample->utmy }}"/>
                                    </div>
                                    <div class="form-group col-2">
                                        <label>MSMN:</label>
                                        <input type="number" name="msmn" class="form-control"
                                               value="{{ $sample->msmn }}"/>
                                    </div>
                                </div>
                            </fieldset>
                        </form>

                    </div>
                    <hr/>
                    @if ($message = Session::get('success'))
                        <div class="alert alert-success">
                            <p>{{ $message }}</p>
                        </div>
                    @endif
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
                    <div class="row mt-3">
                        <form action="{{ route('sampleDetails.store') }}" method="POST">
                            @csrf
                            <input type="hidden" name="sample_id" value="{{$sample->id}}"/>
                            <div class="row mb-2 mt-2">
                                <div class="form-group col-1">
                                    <label>N.Bote:</label>
                                    <input type="number" name="bottlenumber" class="form-control"
                                           value="{{old('bottlenumber')}}"/>
                                </div>
                                <div class="form-group col-3">
                                    <label>Colector:</label>
                                    <input type="text" name="picker" class="form-control" value="{{old('picker')}}"/>
                                </div>
                                <div class="form-group col-2">
                                    <label>Fecha Colecta:</label>
                                    <input type="date" name="datepicker" class="form-control"
                                           value="{{old('datepicker')}}"/>
                                </div>
                                <div class="form-group col-2">
                                    <label>Periodo LDSF:</label>
                                    <select class="form-select col-2" name="period_id" value="{{old('period_id')}}">
                                        <option selected disabled>Seleccione el periodo</option>
                                        @foreach ($periods as $period)
                                            <option
                                                value="{{ $period->id }}" {{ old('period_id') == $period->id ? "selected" : "" }}>{{ $period->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group col-2">
                                    <label>Orden:</label>
                                    <input type="text" name="order" class="form-control" value="{{old('order')}}"/>
                                </div>
                                <div class="form-group col-2">
                                    <label>Familia :</label>
                                    <input type="text" name="family" class="form-control" value="{{old('family')}}"/>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="form-group col-2">
                                    <label>Sub Familia:</label>
                                    <input type="text" name="subfamily" class="form-control"
                                           value="{{old('subfamily')}}"/>
                                </div>
                                <div class="form-group col-2">
                                    <label>Genero :</label>
                                    <input type="text" name="gender" class="form-control" value="{{old('gender')}}"/>
                                </div>
                                <div class="form-group col-2">
                                    <label>Especie :</label>
                                    <input type="text" name="species" class="form-control" value="{{old('species')}}"/>
                                </div>
                                <div class="form-group col-2">
                                    <label>Resultado Genitalia:</label>
                                    <input type="text" name="genitaliascore" class="form-control"
                                           value="{{old('genitaliascore')}}"/>
                                </div>
                                <div class="form-group col-2">
                                    <label>Resultado Final:</label>
                                    <input type="text" name="finalscore" class="form-control"
                                           value="{{old('finalscore')}}"/>
                                </div>
                                <div class="form-group col-2">
                                    <label>Sexo :</label>
                                    <select class="form-select col-2" name="sex_id">
                                        <option selected disabled>Seleccione el sexo</option>
                                        @foreach ($sexs as $sex)
                                            <option
                                                value="{{ $sex->id }}" {{ old('sex_id') == $sex->id  ? "selected" : "" }}>{{ $sex->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="form-group col-2">
                                    <label>Cantidad :</label>
                                    <input type="number" step=".01" name="quantity" class="form-control"
                                           value="{{old('quantity')}}"/>
                                </div>
                                <div class="form-group col-2">
                                    <label>Tamaño :</label>
                                    <input type="number" step=".01" name="size" class="form-control"
                                           value="{{old('size')}}"/>
                                </div>
                                <div class="form-group col-2">
                                    <label>Color :</label>
                                    <select class="form-select col-2" name="color_id">
                                        <option selected disabled>Seleccione el color</option>
                                        @foreach ($colors as $color)
                                            <option
                                                value="{{ $color->id }}" {{ old('color_id') == $color->id ? "selected" : "" }}>{{ $color->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group col-3">
                                    <label>Identificador :</label>
                                    <input type="text" name="identifier" class="form-control"
                                           value="{{old('identifier')}}"/>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary mt-2">Agregar !!</button>
                        </form>
                    </div>
                    <div class="row mt-3">
                        <table class="table table-striped table-sm table-hover">
                            <tr>
                                <th>#BOTE</th>
                                <th>COLECTOR</th>
                                <th>FECHA DE COLECTA</th>
                                <th>PERIODO LDSF</th>
                                <th>ORDEN</th>
                                <th>FAMILIA</th>
                                <th>SUB FAMILIA</th>
                                <th>GENERO</th>
                                <th>ESPECIE</th>
                                <th>RESULTADO GENITALIA</th>
                                <th>RESULTADO FINAL</th>
                                <th>SEXO</th>
                                <th>CANTIDAD</th>
                                <th>TAMAÑO (mm)</th>
                                <th>COLOR</th>
                                <th>IDENTIFICADOR</th>
                                <th>ACCION</th>
                            </tr>
                            @foreach ($sampleDetails as $sampleDetail)
                                <tr>
                                    <td>{{ $sampleDetail->bottlenumber }}</td>
                                    <td>{{ $sampleDetail->picker }}</td>
                                    <td>{{ $sampleDetail->datepicker }}</td>
                                    <td>{{ $sampleDetail->period->name }}</td>
                                    <td>{{ $sampleDetail->order}}</td>
                                    <td>{{ $sampleDetail->family }}</td>
                                    <td>{{ $sampleDetail->subfamily }}</td>
                                    <td>{{ $sampleDetail->gender }}</td>
                                    <td>{{ $sampleDetail->species }}</td>
                                    <td>{{ $sampleDetail->genitaliascore}}</td>
                                    <td>{{ $sampleDetail->finalscore}}</td>
                                    <td>{{ $sampleDetail->sex->name}}</td>
                                    <td>{{ $sampleDetail->quantity}}</td>
                                    <td>{{ $sampleDetail->size}}</td>
                                    <td>{{ $sampleDetail->color->name}}</td>
                                    <td>{{ $sampleDetail->indentifier}}</td>
                                    <td>
                                        <form action="{{ route('sampleDetails.destroy',$sampleDetail->id) }}"
                                              method="POST">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger show_confirm2">Borrar</button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        $('.show_confirm2').click(function (event) {
            var form = $(this).closest("form");
            event.preventDefault();
            swal({
                title: `Estas seguro de borrar esta detalle de colecta?`,
                text: "Si borras esta detalle de colecta no podras ver los datos de nuevo.",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {
                        form.submit();
                    }
                });
        });

    </script>
@endsection
